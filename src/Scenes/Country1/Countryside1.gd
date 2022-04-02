extends Main

const MUSIC = preload("res://Assets/Music/game1.wav")


func _ready():
	Audio.play_music(MUSIC)
