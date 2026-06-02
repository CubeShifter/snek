extends ColorRect

const SPEED:= 128
@export var delay := 0.0
@onready var collision: Area2D = $collision

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(delay).timeout
	var tween = create_tween()
	tween.set_loops(0)
	visible = true
	tween.tween_property(self,"position:x", 255,0)
	tween.tween_property(self,"position:x", -1,2)




func _on_collision_area_entered(area: Area2D) -> void:
	color = Color(0,1,0)


func _on_collision_area_exited(area: Area2D) -> void:
	color = Color(0,0,1)
