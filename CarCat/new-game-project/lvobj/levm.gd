extends Node
@export var chekcp: Array[Area3D]
@export var goal: Node3D
var nextcp
var laptimes
var totaltime
var active
var curlap
@export var lapam:int
func _ready() -> void:
	active=true
	nextcp=1
	laptimes=[0.0]
	curlap=0
	totaltime=0.0
func _process(delta: float) -> void:
	#print(nextcp)
	goalcheck()
	if active:
		totaltime+=delta
		nextcp=0
		laptimes[curlap]+=delta
		for i in range(chekcp.size()):
			if chekcp[i].passed==true:
				nextcp=max(chekcp[i].id, nextcp)
				#print(nextcp)
		nextcp+=1	
func goalcheck():
	
	if nextcp-1>=chekcp.size():
		nextcp=1
		#print(777)
		for i in range(chekcp.size()):
			chekcp[i].passed=false
		if curlap<lapam-1:
			laptimes.append(0.0)
			curlap+=1
			#print(curlap)

		
