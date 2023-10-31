extends Control

var 基于谁创建的

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_timer_timeout():
	$AnimationPlayer.play_backwards("气泡出现")
	await $AnimationPlayer.animation_finished
	XHZX.气泡ui销毁事件(基于谁创建的)
	queue_free() 
