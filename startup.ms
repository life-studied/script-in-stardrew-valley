import "tasks"

max_energy = 270
water_energy_waste = 2
chop_energy_waste = 2
hoe_energy_waste = 2

farm_land_line = 3
farm_land_col = 5
tree_land_length_max = (max_energy - water_energy_waste *(farm_land_col * farm_land_line)) / (chop_energy_waste * 2)
tree_land_length_max_with_hoe = (max_energy - (water_energy_waste + hoe_energy_waste) *(farm_land_col * farm_land_line)) / (chop_energy_waste * 2)

if tree_land_length_max > 50 then tree_land_length_max = 50
if tree_land_length_max_with_hoe > 50 then tree_land_length_max_with_hoe = 50


if me.name != "Home Computer" then
    if world.daySinceGameStart == 2 then
        tasks.hoe_task_no_judge(farm_land_line, farm_land_col)
        tasks.seed_task_no_judge(farm_land_line, farm_land_col)
        tasks.water_task(farm_land_line, farm_land_col)
        tasks.clean_for_tree_task(tree_land_length_max)
    else
        tasks.hoe_task(farm_land_line, farm_land_col)
        tasks.seed_task(farm_land_line, farm_land_col)
        tasks.water_task(farm_land_line, farm_land_col)
        tasks.clean_for_tree_task(tree_land_length_max)
    end if
else
    print "Good Morning!"
end if