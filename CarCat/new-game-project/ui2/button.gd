extends TextureButton


var basepos: Vector2
@export var destination: Vector2
func  _ready() -> void:
	basepos=position
func _on_focus_entered() -> void:
	var tween = create_tween()
	tween.tween_property(self, "position",basepos + destination, 0.5).set_trans(Tween.TRANS_QUART)		

func _on_focus_exited() -> void:
	var tween = create_tween()
	
	tween.tween_property(self, "position", basepos, 0.5).set_trans(Tween.TRANS_QUART)	


func _on_mouse_entered() -> void:
	var tween = create_tween()
	tween.tween_property(self, "position",basepos + destination, 0.5).set_trans(Tween.TRANS_QUART)		

func _on_mouse_exited() -> void:
	var tween = create_tween()
	
	tween.tween_property(self, "position", basepos, 0.5).set_trans(Tween.TRANS_QUART)	
