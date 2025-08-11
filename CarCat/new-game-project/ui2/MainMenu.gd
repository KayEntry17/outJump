extends Control
@export var levels:Array[PackedScene]
@export var credits:PackedScene
@export var mmtheme: AudioStream
func _ready() -> void:
	Saveload.load_game()
	$nosaves/button.grab_focus()
	Saveload.save_game()
	#Mus.swaptrack(mmtheme)
	##$AudioStreamPlayer2D/AnimationPlayer.play("new_animation")
	#pass
#func _on_new_game_pressed() -> void:
	#TR.change_scene(levels[Saveload.level])
	##$AudioStreamPlayer2D/AnimationPlayer.play("new_animation")

#
#func _on_options_pressed() -> void:
	#$audio.pausemenu()
	#print(Saveload.lvunl)
#
	#Saveload.lvunl=10.0;
	##$AudioStreamPlayer2D/AnimationPlayer.play("new_animation")


func _on_exit_pressed() -> void:
	get_tree().quit()
	#$AudioStreamPlayer2D/AnimationPlayer.play("new_animation")

#
#func _on_credits_pressed() -> void:
	##$AudioStreamPlayer2D/AnimationPlayer.play("new_animation")
	#TR.change_scene(credits)
