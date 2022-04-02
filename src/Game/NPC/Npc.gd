extends Node


var active = false

onready var input_key = $InputKey

export var dialog_timeline: String = ""


func _ready():
	connect("body_entered", self, "_on_NPC_body_entered")
	connect("body_exited", self, "_on_NPC_body_exited")


func _process(delta: float) -> void:
	input_key.visible = active


func _unhandled_input(event: InputEvent) -> void:
	if get_node_or_null("DialogNode") == null:
		if event.is_action_pressed("interact") and active:
			Events.emit_signal("game_paused")
			get_tree().paused = true
			var dialog = Dialogic.start(dialog_timeline)
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect("timeline_end", self, "on_Dialog_timeline_end")
			add_child(dialog)


func on_Dialog_timeline_end(timeline_name):
	yield(get_tree(), "idle_frame")
	get_tree().paused = false
	Events.emit_signal("game_resumed")


func _on_NPC_body_entered(body) -> void:
	if body is Player:
		active = true


func _on_NPC_body_exited(body) -> void:
	if body is Player:
		active = false
