import "set_face"
import "move"

run = function(line, col, func)
    back_xy = [0, 0]

    set_face.to_right()
    for i in range(0, line - 1)
        for j in range(0, col - 1)
            func()
            move.clever_forward(back_xy)

            is_odd_line = (i % 2 == 0)
            is_col_start = (j == 0)
            is_col_end = (j == col - 1)
            
            if is_odd_line and is_col_start then
                set_face.to_right()
            end if

            if is_odd_line and is_col_end then
                set_face.to_down()
            end if

            if not is_odd_line and is_col_start then
                set_face.to_left()
            end if

            if not is_odd_line and is_col_end then
                set_face.to_down()
            end if
        end for
    end for
    return back_xy
end function

quick_run_and_back = function(line, col, func)
    back_xy = run(line, col, @func)
    move.back(back_xy)
end function

run_and_back = function(line, col, func)
    back_list = []

    set_face.to_right()
    for i in range(0, line - 1)
        for j in range(0, col - 1)
            func()
            move.backway_forward(back_list)

            is_odd_line = (i % 2 == 0)
            is_col_start = (j == 0)
            is_col_end = (j == col - 1)
            
            if is_odd_line and is_col_start then
                set_face.to_right()
            end if

            if is_odd_line and is_col_end then
                set_face.to_down()
            end if

            if not is_odd_line and is_col_start then
                set_face.to_left()
            end if

            if not is_odd_line and is_col_end then
                set_face.to_down()
            end if
        end for
    end for
    move.backway_back(back_list)
end function