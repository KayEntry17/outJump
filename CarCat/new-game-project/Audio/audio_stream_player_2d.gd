extends AudioStreamPlayer
var track: AudioStream
var loopf: bool=true
var chanon:bool=false
var loopi: bool=true
var onch:=1.0
var fitime:=1.0
var volv:=-60
var mon:=true
#func _ready() -> void:
	#if chanon==true	:
		#volv=60

func change_track(song : AudioStream, loopim=true, foti=1.25,fiti=1) -> void:
	track=song
	loopi=loopim
	fitime=fiti
	
	if playing:
		if song==stream and onch>0:
			return	
		if foti!=0:
			$TransitionTimer.start(foti)
			fade_out(foti)
		else:
			fade_out(foti)
			loopf=loopi
			self.stream =track
			#print(track)
			play()
			fade_in()
		pass
	else:	
		loopf=loopi
		volv=-60	
		self.stream =track
		#print(track)
		play()
		fade_in()		
func fade_in() -> void:
	var tween = create_tween()
	tween.tween_property(self, "volv",0, fitime).set_trans(Tween.TRANS_QUAD)			
func fade_out(foti=1.25) -> void:
	var tween = create_tween()
	tween.tween_property(self, "volv",-60, foti).set_trans(Tween.TRANS_QUAD)			
func _on_finished() -> void:
	
	if loopf:
		play()
func _process(delta: float) -> void:
	if !mon and onch<=0:
		stop()
	#print(self.name,"  ",volume_db)
	if chanon and onch<1.0:
		onch+=0.5*delta
	if !chanon and onch>0:
		onch-=0.5*delta
	self.volume_db=onch*(volv+60)-60
func _on_transition_timer_timeout() -> void:
	loopf=loopi
	self.stream =track
	#print(track)
	play()
	fade_in()
