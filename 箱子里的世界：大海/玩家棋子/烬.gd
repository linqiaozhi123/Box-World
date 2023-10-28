extends CharacterBody2D
@onready var 武器动画节点 = $"武器动画"
@onready var 子弹条 = $弹匣
@onready var 警戒范围 = $"警戒范围"
var 警戒状态
var 警戒范围内area数组

var 目标位置
var 子弹数量=4:
	set(a):
		子弹数量=a
		子弹条.value=子弹数量
# Called when the node enters the scene tree for the first time.
func _ready():
	目标位置=Vector2(1,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	自动翻转()
	
func 识别敌人():
	
	pass
func 自动翻转():
	if 目标位置.x<position.x:
		scale.x=-1
		子弹条.scale.x=-1
	else:
		scale.x=1
		子弹条.scale.x=1
func 攻击():
	if 武器动画节点.current_animation == ""or "武器待机旋转":
		武器动画节点.stop()
		if 子弹数量<=0:
			武器动画节点.play("武器换弹旋转")
		else:
			武器动画节点.play("武器瞄准")


func _on_警戒范围_area_entered(area):
	警戒范围内area数组=警戒范围.get_overlapping_areas()
	if "敌人组" in area.get_groups():
		警戒状态=true
		$"警戒定时器".start()
		攻击()
		pass # Replace with function body.

func _on_警戒定时器_timeout():
	警戒范围内area数组=警戒范围.get_overlapping_areas()
	var 警戒范围内敌人数量=0
	for children in 警戒范围内area数组:
		if "敌人组" in children.get_groups():
			警戒范围内敌人数量+=1
	if 警戒范围内敌人数量==0:
		警戒状态=false
		$"警戒定时器".stop()
