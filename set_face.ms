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

to_opposite = function(face)
  if face == 0 then return 2
  if face == 1 then return 3
  if face == 2 then return 0
  if face == 3 then return 1
end function