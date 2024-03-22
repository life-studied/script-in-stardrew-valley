import "tool_chosen"

watering = function
  tool_chosen.use_water
  me.useTool
  wait(0.3)
end function

hoeing = function
    tool_chosen.use_hoe
    me.useTool
    wait(0.3)
end function

seeding = function(seed_name)
    me.select seed_name
    me.placeItem
end function

full_watering = function
    tool_chosen.use_water
end function

choping = function
    print me.ahead
    if me.ahead == null then return
    if me.ahead.type != "trees" then return
    if me.ahead.growthStage < 3 then return
    tool_chosen.use_axe
    for i in range(0, 14)
        me.useTool
        wait(0.3)
    end for
end function

planting = function(tree_seed_name)
    if me.ahead == null then
        me.select tree_seed_name
        me.placeItem
    end if
end function