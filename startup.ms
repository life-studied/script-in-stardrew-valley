import "tasks"

farm_land_line = 3
farm_land_col = 5

if me.name != "Home Computer" then
    if world.timeOfDay == 2 then
        tasks.hoe_task_no_judge(farm_land_line, farm_land_col)
        tasks.seed_task_no_judge(farm_land_line, farm_land_col)
        tasks.water_task(farm_land_line, farm_land_col)
    else
        tasks.hoe_task(farm_land_line, farm_land_col)
        tasks.seed_task(farm_land_line, farm_land_col)
        tasks.water_task(farm_land_line, farm_land_col)
    end if
end if