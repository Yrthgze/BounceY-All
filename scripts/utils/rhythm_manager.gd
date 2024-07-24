extends Node2D

@export var main_audio_player:AudioStreamPlayer
@export var rhythm_player:AudioStreamPlayer
@export var audio_bpm:int = 0
@export var rhythm_timer:Timer
var audio_check_freq:float = 0
var time_since_last_check:float = 0
const SECS_IN_MIN = 60.0

# Called when any audio bpm change has been made. Not usable for now
# but maybe in the future we want to change bpms on the go
func _manage_freq_change():
	if audio_bpm >= 0:
		rhythm_timer.stop()
		main_audio_player.stop()
		audio_check_freq = SECS_IN_MIN / audio_bpm
		print("Audio freq changed: "+ str(audio_check_freq))
		rhythm_timer.wait_time = audio_check_freq
		rhythm_timer.start()
		main_audio_player.play()

# Called when the node enters the scene tree for the first time.
func _ready():
	_manage_freq_change()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_since_last_check += delta
	print(time_since_last_check)
	if Input.is_action_just_pressed("space"):
		rhythm_player.play()
		_check_players_rhythm()

func _check_players_rhythm():
	if time_since_last_check <= audio_bpm:
		print("Nice rhythm")

# Called everytime the rhythm has to be checked
func _on_rhythm_timer_timeout():
	time_since_last_check = 0
