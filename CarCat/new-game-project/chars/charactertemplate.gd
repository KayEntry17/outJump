extends CharacterBody3D

@export var speedbasic:float
@export var jumpspeed: float
@export var speedupcurve:Curve
@export var offshoreminus:float
@export var accspeed: float
@export var descspeed: float

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
@export var speeduprefcurve:Curve
@export var tdbg: Node2D
var canjump:bool=true
var timejumping
var rc
var trrot
var inirot
var tf2: Transform3D
var speedfin
var speedtime
@export var camrotspeed: float
func _ready() -> void:
	rc=$RayCast3D
	trrot=rotation.y
	speedfin=0
	inirot=rotation.y
func floored():
	for i in $Area3D.get_overlapping_bodies():
		if i.is_in_group("ground"):
			return true
			break
	return false
func _process(delta: float) -> void:
	#if
	#speedfin=speedupcurve.sample()
	var normal =( $RayCast3D3.get_collision_normal()+$RayCast3D4.get_collision_normal()+$RayCast3D.get_collision_normal()+$RayCast3D2.get_collision_normal()).normalized()
	
	# FIX: ensure forward/right are orthogonal to normal for stable movement
	var forward = chrbod.global_transform.basis.x
	var right = forward.cross(normal).normalized()
	forward = normal.cross(right).normalized()
	#$CharacterBody3D/car1/Node3D.global_rotation=Vector3(0,0,0)
	
	var inpdir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if abs(inpdir.x) <= 0.1:
		inpdir.x = 0

	if Input.is_action_pressed("gasgasgas" ):
		$CharacterBody3D/car1/Node3D/GPUParticles3D.emitting=true
		if speedfin<maxspeed:
			speedfin+=accspeed*delta
		#speedtime+=delta
		velocity = speedfin * forward
	else:
		$CharacterBody3D/car1/Node3D/GPUParticles3D.emitting=false
		#velocity.x = 0
		#velocity.z = 0
		if speedfin>0:
			speedfin-=descspeed*delta
			print(speedfin)
		else:
			speedfin=0
		velocity = speedfin * forward
	
	
	if floored():
		tf2 = global_transform
		tf2.basis.y = normal  
		tf2.basis.x = -tf2.basis.z.cross(normal)
		tf2.basis = tf2.basis.orthonormalized()
		global_transform = tf2
	else:
		velocity.y = -50
		if speedfin>0:
			speedfin-=descspeed*delta
			print(speedfin)
		else:
			speedfin=0
		pass
	trrot -= inpdir.x * handlingspeed * delta
	chrbod.rotation.y -= inpdir.x * handlingspeed * delta
	
	chrbod.rotation_degrees.y = clampf(chrbod.rotation_degrees.y, -30, 30)
	rotation.y = trrot - chrbod.rotation.y

	if canjump:
		if Input.is_action_just_pressed("jump"):
			canjump = false
			timejumping = 0
	else:
		chrbod.position.y = jumpcurve.sample(timejumping / jumpspeed) * jumpheight
		timejumping += delta
		$CharacterBody3D/car1.get_child(0).get_surface_override_material(0)\
			.set_shader_parameter("bend", jumpbendcurve.sample(timejumping / jumpspeed) * bendstr)
		if timejumping >= jumpspeed:
			canjump = true
	
	move_and_slide()
	var camh=$Node3D
	#global_rotation=Vector3( wrapf(global_rotation.x,0,2*PI),wrapf(global_rotation.y,0,2*PI),wrapf(global_rotation.z,0,2*PI))
	#camh.global_rotation=Vector3( wrapf(camh.global_rotation.x,0,2*PI),wrapf(camh.global_rotation.y,0,2*PI),wrapf(camh.global_rotation.z,0,2*PI))
	camh.global_rotation.x=lerp_angle(camh.global_rotation.x,global_rotation.x,camrotspeed*delta)
	camh.global_rotation.z=lerp_angle(camh.global_rotation.z,global_rotation.z,camrotspeed*delta)
	camh.global_rotation.y=lerp_angle(camh.global_rotation.y,global_rotation.y,camrotspeed*delta)

	camh.global_position=global_position
	#tdbg.material.set_shader_parameter("ro",(camh.global_position/10).rotated(Vector3.UP,-PI/2))
	tdbg.material.set_shader_parameter("rotation",Vector3(camh.global_rotation.y,camh.global_rotation.x,camh.global_rotation.z))
	tdbg.material.set_shader_parameter("ro",Vector3(camh.global_position.z,-camh.global_position.y,camh.global_position.x)/5)
