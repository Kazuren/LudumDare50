extends Main

const MUSIC = preload("res://Assets/Music/city_reset_3.wav")

onready var daughter = $Daughter
onready var dialogue_area = $DialogueArea


func _ready() -> void:
	PlayerInfo.has_gun = true
	Audio.play_music(MUSIC)
	dialogue_area.connect("dialogue_started", self, "_on_DialogueArea_dialogue_started")
	dialogue_area.connect("dialogue_finished", self, "_on_DialogueArea_dialogue_finished")
	daughter.connect("death", self, "_on_Daughter_death")


func _on_DialogueArea_dialogue_started() -> void:
	Audio.stop_music()


func _on_DialogueArea_dialogue_finished() -> void:
	daughter.player = Globals.player
	daughter.invincible = false


func _on_Daughter_death() -> void:
	Events.emit_signal("game_paused")
	get_tree().paused = true
	var dialog = Dialogic.start("CityDaughterDeath")
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	dialog.connect("timeline_end", self, "on_Dialog_timeline_end")
	add_child(dialog)


func on_Dialog_timeline_end(timeline_name):
	yield(get_tree(), "idle_frame")
	get_tree().paused = false
	Events.emit_signal("game_resumed")
