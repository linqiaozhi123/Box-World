extends AnimationPlayer
@onready var audio_stream_player = $"../AudioStreamPlayer"
@onready var 烬 = $".."

var 射击1
var 射击2
var 换弹

# Called when the node enters the scene tree for the first time.
func _ready():
	射击1=preload("res://声音/手炮射击01.ogg")
	射击2=preload("res://声音/手炮射击02.ogg")
	换弹=preload("res://声音/换弹夹.mp3")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if 烬.警戒状态==false:
		if current_animation=="":
			stop()
			play("武器待机旋转")
	pass


func _on_animation_finished(anim_name):
	if anim_name=="武器瞄准":
		play("武器射击1")
		
		if 烬.子弹数量==2 or 3 or 4:
			audio_stream_player.stream=射击1
			audio_stream_player.volume_db=0
			audio_stream_player.pitch_scale=1.4
			audio_stream_player.playing=true
		if 烬.子弹数量==1:
			audio_stream_player.stream=射击2
			audio_stream_player.volume_db=5
			audio_stream_player.pitch_scale=1.3
			audio_stream_player.playing=true
		烬.子弹数量-=1
	if anim_name=="武器射击1":play("武器射击2")
	if anim_name=="武器射击2":
		play("武器换弹旋转")
		audio_stream_player.stream=换弹
		audio_stream_player.volume_db=-10
		audio_stream_player.playing=true
	if anim_name=="武器换弹旋转":
		if 烬.子弹数量<=0:烬.子弹数量=4
		if 烬.警戒状态==true:
			play("武器瞄准")
		else:play("RESET")
	if anim_name=="武器待机旋转":
		play("武器待机旋转")
