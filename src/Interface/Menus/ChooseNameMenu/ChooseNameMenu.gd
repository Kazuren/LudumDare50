extends Control


onready var confirm_button = $CenterContainer/VBoxContainer/ConfirmButton
onready var line_edit = $CenterContainer/VBoxContainer/LineEdit


func _ready() -> void:
	ScreenFader.fade_out("1.0")
	yield(ScreenFader, "animation_finished")
	confirm_button.connect("pressed", self, "_on_ConfirmButton_pressed")


func _on_ConfirmButton_pressed() -> void:
	var player_name = line_edit.text.strip_edges()
	if player_name == "":
		return
	Dialogic.set_variable("PlayerName", player_name)
	#TODO change npc names if player chooses one of them
	Dialogic.set_variable("Player", "[color=#cf573c]" + player_name + "[/color]")
	ScreenFader.fade_in("1.0")
	yield(ScreenFader, "animation_finished")
	Audio.stop_music()
	get_tree().change_scene("res://src/Scenes/Lab1/Lab1.tscn")

