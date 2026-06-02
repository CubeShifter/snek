extends Area2D
class_name snek_segment


enum {HEAD,TAIL,SEGMENT}
enum DIRECTIONS {UP,DOWN,LEFT,RIGHT}
var type = SEGMENT
var previous_sement: snek_segment
# Called when the node enters the scene tree for the first time.
func move_forward():
	if type = HEAD:
		DIRECTIONS
