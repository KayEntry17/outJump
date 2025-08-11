extends Control
@export var updtime:String
@export var updtime1:float
@onready var lapent=preload("res://laptimes.tscn")

var timerem
@export var active:bool
func _ready() -> void:
	Leaderboard.refresh()
	timerem=updtime1
func _process(delta: float) -> void:
	if active:
		timerem-=delta
	if timerem<=0:
		rebuildlists()
		timerem=updtime1
		active=false

func trans(i,j):

	var r1=int(j/60)
	var r2=int(j)%60
	var r3=int(j*100)%100
	i.get_child(0).text=str(r1)
	i.get_child(1).text=str(r2)
	i.get_child(2).text=str(r3)
func rebuildlists():
	print(Leaderboard.leaderbsort)
	if !Leaderboard.leaderbsort.has(updtime):
		Leaderboard.leaderbsort[updtime]=["0","0","0"]
	var i2=Leaderboard.leaderbsort[updtime]
	for i in $NinePatchRect/MarginContainer/Control4/VBoxContainer.get_children():
		i.queue_free()
	for i in i2:
		print(i)
		var n=lapent.instantiate()
		$NinePatchRect/MarginContainer/Control4/VBoxContainer.add_child(n)
		trans(n.get_child(1),float(i[1]))
		n.get_child(0).text=i[0]

		
		
