extends Main


const MUSIC = preload("res://Assets/Music/home_and_countryside_reset_2.wav")

onready var dead_wife_dialogue = $DeadWifeDialogue


func _ready() -> void:
	Audio.stop_music()
	PlayerInfo.has_gun = true
	dead_wife_dialogue.connect("dialogue_finished", self, "_on_DeadWifeDialogue_finihed")


func _on_DeadWifeDialogue_finihed() -> void:
	Audio.play_music(MUSIC)
