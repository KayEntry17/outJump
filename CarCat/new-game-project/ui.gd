extends Control
@export var manager:Node
@onready var lapent=preload("res://laptimes.tscn")

func _process(delta: float) -> void:
	var curlaps=$NinePatchRect/MarginContainer/Control4/VBoxContainer.get_children()
	for i in range(manager.laptimes.size()):
		if i>=curlaps.size():
			var l=lapent.instantiate()
			$NinePatchRect/MarginContainer/Control4/VBoxContainer.add_child(l)
			curlaps.append(l)
			curlaps[i].get_child(0).text="LAP "+str(i+1)
		trans(curlaps[i].get_child(1),manager.laptimes[i])
		trans($NinePatchRect/Control.get_child(1),manager.totaltime)
		$NinePatchRect/Control.get_child(0).text="LAP "+str(manager.laptimes.size())+" OF "+str(manager.lapam)
func trans(i,j):

	var r1=int(j/60)
	var r2=int(j)%60
	var r3=int(j*100)%100
	i.get_child(0).text=str(r1)
	i.get_child(1).text=str(r2)
	i.get_child(2).text=str(r3)
	#return str(r1)+" "+str(r2)+" "+str(r3)
		
