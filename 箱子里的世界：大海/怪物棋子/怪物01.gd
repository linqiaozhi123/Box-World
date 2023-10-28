extends Control
var a
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
		pass
func _input(event):
	a=event
	if a.is_action_pressed("a点击"):
		position.x-=3
	if a.is_action_pressed("d点击"):
		position.x+=3
	pass
