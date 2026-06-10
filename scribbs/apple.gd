extends TileMapLayer
var grid: Array[Array] = [[true]]
var lower_bounds := Vector2(1,1)
var upper_bounds := Vector2(14,14)
var collector:Array[Vector2i]


@onready var snek_daddy: Node2D = $"../Snek Daddy"


func _ready() -> void:
	
	new_apple()
func new_apple():
	clear()
	collector = []
	var coords := Vector2(randi_range(lower_bounds.x,upper_bounds.x),randi_range(lower_bounds.y,upper_bounds.y))
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
	print(collector)
	for i in range(len(collector)):
		snackable.append(false)
	for i in range(len(snek)):
		snacks.append(local_to_map(snek[i].global_position)+Vector2i(8,10))
		if collector.find(snacks[i]) >= 0:
			snackable[collector.find(snacks[i])] = true
	if snackable.all(func(x):return x):
		new_apple()
		snek_daddy.new_snek()
		
	
