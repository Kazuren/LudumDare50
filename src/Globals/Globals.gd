extends Node


var player


func unpause_game():
	get_tree().paused = false
	Events.emit_signal("game_resumed")
