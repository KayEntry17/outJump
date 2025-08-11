extends Node
@export var channels: Array[AudioStreamPlayer]
@export var fbacksong: AudioStream
var single:bool=true
func swaptrack(song : AudioStream, loopim=true, foti=1.25,fiti=0.75) -> void:
	channels[0].chanon=true
	channels[0].change_track(song, loopim, foti,fiti)
	channels[1].chanon=false
	channels[2].chanon=false
	channels[1].mon=false
	channels[2].mon=false
	channels[1].stop()
	channels[2].stop()
	single=true
func swapmulti(song : AudioStream, song1 : AudioStream,song2 : AudioStream,loopim=true, foti=1.25,fiti=0.75) -> void:
	channels[1].mon=true
	channels[2].mon=true
	channels[0].change_track(song, loopim, foti,fiti)
	channels[1].change_track(song1, loopim, foti,fiti)
	channels[2].change_track(song2, loopim, foti,fiti)
func changechannel(channelnum: int, state: bool):
	channels[channelnum].chanon=state
