extends TileMapLayer
var grid
var lower_bounds := Vector2(1,1)
var upper_bounds := Vector2(13,13)
var collector:Array[Vector2i]
var possible_appels = [[[true]]]


@onready var snek_daddy: Node2D = $"../Snek Daddy"


func _ready() -> void:
	
	new_apple()
func new_apple():
	clear()
	collector = []
	grid = possible_appels.pick_random()
	var coords := Vector2(randi_range(lower_bounds.x,15-len(grid[0])),randi_range(lower_bounds.y,15 - len(grid)))
	
	for x in range(0,len(grid)):
		for y in range(0,len(grid[0])):
			if grid[x][y]:
				var coordy := coords+Vector2(x,y)
				collector.append_array([coordy+Vector2.UP,coordy+Vector2.DOWN,coordy+Vector2.LEFT,coordy+Vector2.RIGHT])
				set_cell(coordy,0,Vector2i(0,0),0)
	for x in range(0,len(grid)):
		for y in range(0,len(grid[0])):
			if grid[x][y]:
				collector.erase(coords+Vector2(x,y))
	
func check_appels(snek):	
	var snacks : Array
	var snackable: Array[bool]
	
	for i in range(len(collector)):
		snackable.append(false)
	for i in range(len(snek)):
		snacks.append(local_to_map(snek[i].global_position)+Vector2i(8,10))
		if collector.find(snacks[i]) >= 0:
			snackable[collector.find(snacks[i])] = true
	if snackable.all(func(x):return x):
		new_apple()
		snek_daddy.new_snek()
		change_possibly_snakes(len(snek_daddy.snek_list))
		
func change_possibly_snakes(len):
	if len == 10:
		possible_appels.append([[true],[true]])
		possible_appels.append([[true,true]])
	elif len == 12:
		possible_appels.append([[true,true],[true,false]])
		possible_appels.append([[true,true,true]])
		possible_appels.append([[false,true],[true,true]])
	elif len == 13:
		possible_appels.append([[true,true,false],[false,true,true]])
		possible_appels.append([[false,true,true],[true,true,false]])
	elif len == 14:
		possible_appels.append([[false,true,false],[true,true,true]])
		possible_appels.append([[false, true],[false, true],[true,true]])
		possible_appels.append([[true, true],[true, false],[true,false]])
	
