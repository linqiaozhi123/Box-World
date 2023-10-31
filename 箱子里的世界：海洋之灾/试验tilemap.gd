extends TileMap
@onready var 玩家选中区域01 = $"玩家鼠标选中区域01"
const 气泡 = preload("res://UI/气泡.tscn")
var 鼠标上一次更新位置=Vector2(0,0)
var 鼠标实时位置=Vector2(0,0)
var 当前地图块位置=Vector2(0,0)
var 当前地图块格子=Vector2(0,0)

var 上一个气泡ui={"位置":null,"实例":null}
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	XHZX.connect("气泡ui销毁", 气泡ui销毁)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _input(event):
	#鼠标移动时
	if event is InputEventMouseMotion:
		鼠标实时位置 = get_global_mouse_position()
		
		if 鼠标实时位置.distance_to(鼠标上一次更新位置) >= 5:
			鼠标上一次更新位置=鼠标实时位置
			
			当前地图块格子=local_to_map(to_local(鼠标上一次更新位置))
			当前地图块位置=to_global(map_to_local(当前地图块格子))
			
			if 玩家选中区域01.global_position!=当前地图块位置:
				玩家选中区域01.global_position=当前地图块位置
				
	if event.is_action_pressed("鼠标左键点击"):
		var 格子id=get_cell_atlas_coords(1,当前地图块格子,false)
		if 格子id==Vector2i(0,1):
			地图块弹出ui(当前地图块位置,当前地图块格子)
			
func 地图块弹出ui(当前地图块位置,当前地图块格子):
	if 上一个气泡ui["位置"]!=当前地图块位置:
		if 上一个气泡ui["实例"]!=null:
			上一个气泡ui["实例"]._on_timer_timeout()
		var 气泡实例=气泡.instantiate()
		self.get_parent().add_child(气泡实例)
		气泡实例.global_position=当前地图块位置-Vector2(0,10)
		气泡实例.get_node("AnimationPlayer").play("气泡出现")
		气泡实例.基于谁创建的=当前地图块位置
		上一个气泡ui["位置"]=当前地图块位置
		上一个气泡ui["实例"]=气泡实例
func 气泡ui销毁(a):
	if a==上一个气泡ui["位置"]:
		上一个气泡ui["位置"]=null
		上一个气泡ui["实例"]=null

##set_cell( int layer, Vector2i coords, int source_id=-1, Vector2i atlas_coords=Vector2i(-1, -1), int alternative_tile=0 )
			##set_cell(int 层,Vector2i 坐标,int 源id=-1,Vector2i 图集坐标=Vector2i(-1, -1),int 代替图块=0 )
			#set_cell(1,当前地图块格子,0,Vector2i(0,0),0)
			#var 相邻格子位置数组=get_surrounding_cells(当前地图块格子)
			#for child in 相邻格子位置数组:
				#if get_cell_atlas_coords(1,child,false)==Vector2i(-1,-1):
					#set_cell(1,child,0,Vector2i(0,1),0)
