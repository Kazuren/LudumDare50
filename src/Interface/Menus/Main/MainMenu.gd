extends Control

const SettingsMenu = preload("res://src/Interface/Menus/Settings/Settings.tscn")
const MUSIC = preload("res://Assets/Music/mainmenu.wav")

onready var play = $CenterContainer/VBoxContainer/PlayButton
onready var settings = $CenterContainer/VBoxContainer/SettingsButton
onready var exit = $CenterContainer/VBoxContainer/Exit


func _ready() -> void:
	Audio.play_music(MUSIC)
	play.connect("pressed", self, "_on_PlayButton_pressed")
	settings.connect("pressed", self, "_on_SettingsButton_pressed")
	exit.connect("pressed", self, "_on_ExitButton_pressed")


func _on_PlayButton_pressed() -> void:
	Audio.stop_music()
	get_tree().change_scene("res://src/Main.tscn")


func _on_SettingsButton_pressed() -> void:
	var settings_menu = SettingsMenu.instance()
	add_child(settings_menu)


func _on_ExitButton_pressed() -> void:
	get_tree().quit()
