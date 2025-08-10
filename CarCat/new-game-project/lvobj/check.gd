extends Area3D
@export var manager:Node
@export var id:int


var passed:bool=false
func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		if manager.nextcp==id:
			passed=true
			print(3824797847)
		
