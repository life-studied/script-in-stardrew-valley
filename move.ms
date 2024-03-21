import "set_face"

clever_forward = function(move_before)
    move_away = [0, 0]
    if me.facing == 0 then 
        move_away[1] = -1
    else if me.facing == 1 then 
        move_away[0] = 1
    else if me.facing == 2 then 
        move_away[1] = 1
    else if me.facing == 3 then 
        move_away[0] = -1
    end if
    me.forward
    move_before[0] = move_before[0] + move_away[0]
    move_before[1] = move_before[1] + move_away[1]
end function


back = function(move_away_all)
    x = move_away_all[0]
    y = move_away_all[1]
    
    if x > 0 then set_face.to_left else set_face.to_right
    x = abs(x)
    for i in range(0, x - 1)
        me.forward
    end for

    if y > 0 then set_face.to_up else set_face.to_down
    y = abs(y)
    for i in range(0, y - 1)
        me.forward
    end for    
    
end function

backway_forward = function(move_list)
    move_list.push(me.facing)
    me.forward
end function

backway_back = function(move_list)
    for i in range(move_list.len - 1)
        set_face.direct(set_face.to_opposite(move_list[i]))
        me.forward
    end for
end function