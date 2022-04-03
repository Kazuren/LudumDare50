extends Main



func _ready() -> void:
	#PlayerInfo.has_gun = true
	yield(get_tree().create_timer(0.1), "timeout")
	Events.emit_signal("game_paused")
	get_tree().paused = true
	var dialog = Dialogic.start("LabLastOne")
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	dialog.connect("timeline_end", self, "on_Dialog_timeline_end")
	add_child(dialog)


func on_Dialog_timeline_end(timeline_name):
	yield(get_tree(), "idle_frame")
	get_tree().paused = false
	Events.emit_signal("game_resumed")

