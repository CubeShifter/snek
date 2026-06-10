extends ColorRect

enum {EARLY,PERFECT,LATE,MISS,HIT}
enum DIRECTIONS {UP,DOWN,LEFT,RIGHT}

var state = MISS
@onready var snek_daddy: Node2D = $"../Snek Daddy"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.





func _on_early_area_entered(area: Area2D) -> void:
	
	state = EARLY


func _on_perfect_area_entered(area: Area2D) -> void:
	if state != MISS or state != HIT:
		state = PERFECT


func _on_perfect_area_exited(area: Area2D) -> void:
	if state != MISS or state != HIT:
		state = LATE


func _on_late_area_exited(area: Area2D) -> void:
	if state != MISS or state != HIT:
		state = MISS

func _input(event: InputEvent) -> void:
	if state == MISS or state == HIT:
		pass
	
	elif event.is_action_pressed("up"):
		snek_daddy.move_snek(DIRECTIONS.UP)
		state = HIT
		
	elif event.is_action_pressed("down"):
		snek_daddy.move_snek(DIRECTIONS.DOWN)
		state = HIT
		
	elif event.is_action_pressed("left"):
		snek_daddy.move_snek(DIRECTIONS.LEFT)
		state = HIT
		
	elif event.is_action_pressed("right"):
		snek_daddy.move_snek(DIRECTIONS.RIGHT)
		state = HIT
		
