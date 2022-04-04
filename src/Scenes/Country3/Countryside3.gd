extends Main


const MUSIC = preload("res://Assets/Music/home_and_countryside_reset_2.wav")

onready var dead_wife_dialogue = $DeadWifeDialogue
onready var dead_wife_interaction = $DeadWifeInteraction
var dead_wife_counter = 0


func _ready() -> void:
	Audio.stop_music()
	PlayerInfo.has_gun = true
	dead_wife_dialogue.connect("dialogue_finished", self, "_on_DeadWifeDialogue_finihed")
	dead_wife_interaction.connect("interacted", self, "_on_DeadWifeInteraction_interacted")


func _on_DeadWifeDialogue_finihed() -> void:
	Audio.play_music(MUSIC)


func _on_DeadWifeInteraction_interacted() -> void:
	dead_wife_counter += 1
	if dead_wife_counter > 4:
		dead_wife_interaction.dialog_timeline = "DeadWifeInteractionAfter5"
