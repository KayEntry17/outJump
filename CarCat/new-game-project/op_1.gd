extends Node2D
func truready():
	Saveload.load_game()
	if Saveload.names=="placeholdername1723":
		ask_name()
	else:
		TR.change_scene_main()
func ask_name():
	var tween = create_tween()
	tween.tween_property($Sprite2D, "position",Vector2(156,0), 0.5).set_trans(Tween.TRANS_QUART)	
	$Sprite2D/Label/LineEdit.grab_focus()


func _on_line_edit_text_submitted(new_text: String) -> void:
	Saveload.names=new_text
	print(new_text)
	print(Saveload.names)
	Saveload.save_game()
	Saveload.load_game()
	print(Saveload.names)
	TR.change_scene_main()
	
