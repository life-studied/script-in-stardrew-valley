import "loop_sequare"
import "tool_action"
import "move"

back_xy = loop_sequare.run(3, 3, @tool_action.watering)
move.back(back_xy)