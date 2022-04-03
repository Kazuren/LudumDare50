extends Main


onready var daughter = $Daughter
onready var dialogue_area = $DialogueArea


func _ready() -> void:
	dialogue_area.connect("dialogue_finished", self, "_on_DialogueArea_dialogue_finished")


func _on_DialogueArea_dialogue_finished() -> void:
	daughter.invincible = false
