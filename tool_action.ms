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