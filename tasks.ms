import "loop_sequare"
import "tool_action"
import "move"
import "inventory"

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

