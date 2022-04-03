extends Main


const MUSIC = preload("res://Assets/Music/lab_reset3.wav")


func _ready() -> void:
	Audio.play_music(MUSIC)
