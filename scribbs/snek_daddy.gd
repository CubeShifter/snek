extends Node2D


enum DIRECTIONS {UP,DOWN,LEFT,RIGHT}

var len := 8
var snek_list: Array[snek_segment]

@onready var apple: TileMapLayer = $"../apple"

func _ready():
	for i in range(len):
		var snek = load("res://scones/snake_segment.tscn").instantiate()
		add_child(snek)
		snek.position =Vector2(16 *i,0)
		snek_list.append(snek)
		
	assign_links()
	 
func assign_links():
	for i in range(0,len(snek_list)-1):
		snek_list[i].previous_segment = snek_list[i+1]
		snek_list[i].type = 2
		snek_list[i].sprite.z_index = snek_list.size() - i + 3
		
		
	snek_list[0].type = 0
	snek_list[len(snek_list)-1].type = 1

func move_snek(dir):
	if floor(dir / 2) * 2 + (dir % 2 + 1)%2 != snek_list[0].dir:
		snek_list[0].move_forward(dir)
		apple.check_appels(snek_list)
	

func new_snek():
	var snek = load("res://scones/snake_segment.tscn").instantiate()
	
	var snektor = Vector2.ZERO
	match snek_list[-1].dir:
		0:
			snektor = Vector2.DOWN
		1:
			snektor = Vector2.UP
		2:
			snektor = Vector2.RIGHT
		3:
			snektor = Vector2.LEFT
	snek.position = snek_list[-1].position+16*snektor
	if !snek.get_overlapping_areas():
		snek_list.append(snek)
		add_child(snek)
	else: 
		snek.position = snek_list[-1].position+16*snektor.rotated(deg_to_rad(90))
		if !snek.get_overlapping_areas():
			snek_list.append(snek)
			add_child(snek)
		else:
			snek.position = snek_list[-1].position+16*snektor.rotated(deg_to_rad(180))
			if !snek.get_overlapping_areas():
				snek_list.append(snek)
				add_child(snek)
	
	assign_links()
