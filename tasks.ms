import "loop_sequare"
import "tool_action"
import "move"
import "inventory"
import "set_face"

water_task = function(farmland_line, farmland_col)
  loop_sequare.quick_run_and_back(farmland_line, farmland_col, @tool_action.watering)
end function

hoe_task_no_judge = function(farmland_line, farmland_col)
  loop_sequare.quick_run_and_back(farmland_line, farmland_col, @tool_action.hoeing)
end function

hoe_task = function(farmland_line, farmland_col)
  if world.season != 3 and world.dayOfSeason == 1 then
    hoe_task_no_judge(farmland_line, farmland_col)
  end if
end function


seed_task_no_judge = function(farmland_line, farmland_col)
  seed_no_judge = function
    seed_name = inventory.get_seed_name()
    if seed_name != "" then
      tool_action.seeding(seed_name)
    end if
  end function

  loop_sequare.quick_run_and_back(farmland_line, farmland_col, @seed_no_judge)
end function


seed_task = function(farmland_line, farmland_col)
  if world.season == 3 and world.dayOfSeason == 1 then
    seed_task_no_judge(farmland_line, farmland_col)
  end if
end function

tree_task = function(tree_land_length)
  cutting_once_energy = 15 * 2
  move_step = 0
  set_face.to_left
  for i in range(0, tree_land_length - 1)
    if me.energy < cutting_once_energy then break
    if me.ahead.name != "Wood Path" then 
      me.clearAhead
      me.select "Wood Path"
      me.placeItem
    end if
    me.forward
    move_step = move_step + 1
    set_face.to_up
    tool_action.choping
    tool_action.planting
    set_face.to_down
    tool_action.choping
    tool_action.planting
    set_face.to_left
  end for
  set_face.to_right
  for i in range(0, move_step - 1)
    me.forward
  end for
end function

clean_for_tree_task = function(tree_land_length)

  try_clean_ahead = function
    if me.ahead != null then
      me.clearAhead
    end if
  end function

  set_face.to_left
  for i in range(0, tree_land_length - 1)
    move.force_forward
    set_face.to_up
    try_clean_ahead
    set_face.to_down
    try_clean_ahead
    set_face.to_left
  end for
  set_face.to_right
  for i in range(0, tree_land_length - 1)
    me.forward
  end for
end function
