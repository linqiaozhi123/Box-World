extends Node

var a =0
var b =0
var c =0
var 开始时间
@onready var label = $SubViewport/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	开始时间=Time.get_time_string_from_system()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	c+=1
	if c==60:
		b+=1
		c=0
		if b==60:
			a+=1
			b=0
	label.text= "%02d:%02d:%02d" % [a,b,c]
