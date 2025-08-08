extends CharacterBody3D
@export var speedbasic:float
@export var jumpspeed: float
@export var speedupcurve:Curve
@export var offshoreminus:float
@export var accspeed: float
@export var maxspeed:float
@export var handlingspeed:float
@export var damageknockbackspeed:float
@export var slowdowncurve:Curve
@export var chrbod: Area3D
@export var camera: Node3D
@export var jumpcurve:Curve
@export var jumpheight:float
@export var bendstr:float
@export var jumpbendcurve:Curve
var canjump:bool=true
var timejumping
var rc
var tf2: Transform3D
func _ready() -> void:
	rc=$RayCast3D
func _process(delta: float) -> void:
	if is_on_floor():
		
		tf2=global_transform
		tf2.basis.y=$RayCast3D.get_collision_normal()
		tf2.basis.x=-tf2.basis.z.cross($RayCast3D.get_collision_normal())
		tf2.basis=tf2.basis.orthonormalized()
		#tf2=
		global_transform=tf2
	velocity.y=-10
	
	var inpdir=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if abs(inpdir.x)<=0.1:
		inpdir.x=0
	if Input.is_action_pressed("ui_up"):
		velocity.x=speedbasic

	#var inpdir2=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	chrbod.rotation.y-=inpdir.x*handlingspeed*delta
	print(inpdir)
	chrbod.rotation_degrees.y=clampf(chrbod.rotation_degrees.y,-45,45)
	if canjump:
		#print(345)
		if Input.is_action_just_pressed("ui_accept"):
			canjump=false
			timejumping=0
	else:
		#print(jumpcurve.sample(timejumping/jumpspeed))
		chrbod.position.y=jumpcurve.sample(timejumping/jumpspeed)*jumpheight
		timejumping+=delta
		$CharacterBody3D/car1.get_child(0).get_surface_override_material(0).set_shader_parameter("bend",jumpbendcurve.sample(timejumping/jumpspeed)*bendstr)
		if timejumping>=jumpspeed:
			canjump=true
	#velocity.rotated(Vector3(0,1,0),global_rotation.y)
	move_and_slide()	
