extends PlayerState

const Bullet = preload("res://src/Game/Player/Bullet.tscn")


func enter(data: Dictionary = {}) -> void:
	player.animation_node.travel("Shoot")
	player.velocity = Vector2.ZERO


func change_state() -> void:
	state_machine.change("Idle")


func shoot() -> void:
	var bullet = Bullet.instance()
	bullet.direction = Vector2(player.looking_direction, 0)
	if player.looking_direction < 0:
		bullet.position = player.bullet_spawn_point_flipped.global_position
	else:
		bullet.position = player.bullet_spawn_point.global_position
	player.get_parent().add_child(bullet)
