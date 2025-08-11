extends CanvasLayer
var i
var mainm

func _ready() -> void:
	mainm=Sceneref.mainm
	#call_deferred("_fix_alignment")
	#$AnimatedSprite2D.frame=0
func change_scene(scene):
	Pausem.pause()
	$AnimatedSprite2D.play("defaul")
	$Timer.start()
	$Timer2.stop()
	i=scene

func _on_timer_timeout() -> void:
	$AnimatedSprite2D.play_backwards("defaul")
	get_tree().change_scene_to_packed(i)
	get_tree().paused=false
	Pausem.pauses=0
func reload_scene():
	Pausem.pause()
	$AnimatedSprite2D.play("defaul")
	$Timer2.start()
	$Timer.stop()
	i=get_tree().current_scene.scene_file_path
func change_scene_main():
	change_scene(mainm)
func _on_timer_2_timeout() -> void:
	$AnimatedSprite2D.play_backwards("defaul")
	get_tree().change_scene_to_file(i)
	get_tree().paused=false
	Pausem.pauses=0
