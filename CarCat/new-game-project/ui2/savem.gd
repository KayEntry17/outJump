extends Node
var level:int=0
var checkp:int=0
var lvunl:int=0
var volm:=linear_to_db(0.7)
var volsfx:=linear_to_db(0.7)
var volmus:=linear_to_db(0.7)
var names:="placeholdername1723"
func _ready() -> void:
	load_game()
	pass
func save():
	volsfx=(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))
	volm=(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	volmus=(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	var save_dict={
		"level":level,
		"checkpoint":checkp,
		"lev_unlock":lvunl,
		"volmast":volm,
		"volmus":volmus,
		"volsfx":volsfx,
		"names":names
		}
	return save_dict
func save_game():
	var save_game = FileAccess.open("user://savesd.save", FileAccess.WRITE)
	var json_string=JSON.stringify(save())
	save_game.store_line(json_string)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func load_game():
	if not FileAccess.file_exists("user://savesd.save"):
		return
	else:
		
		var save_gamex = FileAccess.open("user://savesd.save", FileAccess.READ)
		while save_gamex.get_position()<save_gamex.get_length():
			var json_string =save_gamex.get_line()
			var json=JSON.new()
			var parse_result=json.parse(json_string)
			var node_data=json.get_data()
			print(node_data)
			volm=node_data["volmast"]
			level=node_data["level"]
			checkp=node_data["checkpoint"]
			lvunl=node_data["lev_unlock"]
			names=node_data["names"]
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),volm)
			volmus=node_data["volmus"]
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),volmus)
			volsfx=node_data["volsfx"]
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),volsfx)
func _process(delta: float) -> void:
	pass
