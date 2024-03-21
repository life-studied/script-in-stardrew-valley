import "loop_sequare"
import "tool_action"
import "move"

farmland_line = 3
farmland_col = 5
seed_name = "Parsnip Seeds"

water_task = function
  loop_sequare.quick_run_and_back(farmland_line, farmland_col, @tool_action.watering)
end function

hoe_task = function
  if world.season != 3 and world.dayOfSeason == 1 then
    loop_sequare.quick_run_and_back(farmland_line, farmland_col, @tool_action.hoeing)
  end if
end function

hoe_task_no_judge = function
  loop_sequare.quick_run_and_back(farmland_line, farmland_col, @tool_action.hoeing)
end function

seed_task = function(seed_name)
  if world.season == 3 and world.dayOfSeason == 1 then
    loop_sequare.quick_run_and_back(farmland_line, farmland_col, @tool_action.seeding(seed_name))
  end if
end function

first_seeding = function
  tool_action.seeding(seed_name)
end function

seed_task_no_judge = function
  loop_sequare.quick_run_and_back(farmland_line, farmland_col, @first_seeding)
end function
