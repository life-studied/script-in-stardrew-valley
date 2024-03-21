get_seed_name = function
    item_list = me.inventory
    for i in range(0,inventory.len - 1)
        if item_list[i][-5:0] == "Seeds" then
            return item_list[i]
        end if
    end for
    return ""
end function