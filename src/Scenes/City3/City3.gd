extends Main


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var enemy2 = $Enemy2
onready var enemy3 = $Enemy3


func _ready() -> void:
	enemy2.connect("hit", self, "_on_Enemy2_hit")


func _on_Enemy2_hit() -> void:
	enemy2.player = Globals.player
	enemy3.player = Globals.player
