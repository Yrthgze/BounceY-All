extends Node2D

@export var audio_player:AudioStreamPlayer2D
@export var audio_bpm:int = 0
var audio_check_freq:float = 0
const SECS_IN_MIN = 60.0

# Called when any audio bpm change has been made. Not usable for now
# but maybe in the future we want to change bpms on the go
func _manage_freq_change():
	if audio_bpm >= 0:
		audio_check_freq = audio_bpm / SECS_IN_MIN

# Called when the node enters the scene tree for the first time.
func _ready():
	_manage_freq_change()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
