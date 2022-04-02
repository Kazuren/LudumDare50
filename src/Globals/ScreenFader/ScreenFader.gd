extends Node

signal animation_finished


onready var animation_player = $AnimationPlayer


func _ready() -> void:
	animation_player.connect("animation_finished", self, "_on_AnimationPlayer_animation_finished")


func fade_in() -> void:
	animation_player.play("FadeIn")


func fade_out() -> void:
	animation_player.play("FadeOut")


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	emit_signal("animation_finished")
