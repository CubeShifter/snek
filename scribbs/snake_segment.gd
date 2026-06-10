extends Area2D
class_name snek_segment


enum {HEAD,TAIL,SEGMENT}
enum DIRECTIONS {UP,DOWN,LEFT,RIGHT}
var type = SEGMENT
var previous_segment: snek_segment
var dir = DIRECTIONS.LEFT

@onready var sprite: AnimatedSprite2D = $sprite
func _ready() -> void:
	update_sprite()
func move_forward(new_dir):
	
	if type != TAIL:
		previous_segment.move_forward(dir)
	dir = new_dir
	
	match dir:
		DIRECTIONS.UP:
			position += Vector2.UP*16
		DIRECTIONS.DOWN:
			position += Vector2.DOWN*16
		DIRECTIONS.LEFT:
			position += Vector2.LEFT*16
		DIRECTIONS.RIGHT:
			position += Vector2.RIGHT*16
	
	update_sprite()
	
func update_sprite():
	if dir == DIRECTIONS.LEFT:
		sprite.rotation = 1.5 * PI
	elif dir == DIRECTIONS.UP:
		sprite.rotation = 0
	elif dir == DIRECTIONS.RIGHT:
		sprite.rotation = 0.5 * PI
	elif dir == DIRECTIONS.DOWN:
		sprite.rotation = PI
	
	if type == HEAD:
		sprite.play("head")
	elif type == TAIL	:
		sprite.play("tail")
	else:
		sprite.play("straight")
func _physics_process(delta: float) -> void:
	if type == HEAD:
		if get_overlapping_bodies().size() > 0:
			get_tree().reload_current_scene()
