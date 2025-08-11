
extends Node2D
var level:=0
var selmode:bool
func _process(delta: float) -> void:
	if $"..".has_focus() and selmode:
		if Input.is_action_just_pressed("ui_left"):
			level=max(0,level-1)
		if Input.is_action_just_pressed("ui_right"):
			level=min(2,level+1)
	if $"../../../Control2".updtime!=str(level):
		$"../../../Control2".updtime=str(level)
		$"../../../Control2".rebuildlists()
	$Label2.text=str(level+1)
func _ready() -> void:
	selmode=true
	#if Saveload.lvunl==0:
		#$"../../BnNewGame".visible=true
		#$"..".visible=false
		#selmode=false
	#else:
		#level=1
		#$"../../BnNewGame".visible=false
		#$"..".visible=true
		#selmode=true
		
		
func _on_new_game_pressed() -> void:
	TR.change_scene($"../../../..".levels[level])


func _on_button_pressed() -> void:
	TR.change_scene($"../../..".levels[level])
