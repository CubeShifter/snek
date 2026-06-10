extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.25).timeout
	var tween = create_tween()
	tween.set_loops(0) 
	tween.tween_property(self,"flip_h",true,0.5)
	tween.tween_property(self,"flip_h",false,0.5)
