direct = function(wanted_face)
  while me.facing != wanted_face
    me.left
  end while
  print "set face finish"
end function

to_up = function
  direct(0)
end function

to_down = function
  direct(2)
end function

to_left = function
  direct(3)
end function

to_right = function
  direct(1)
end function