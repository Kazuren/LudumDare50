class_name Enemy
extends KinematicBody2D


export var health: int = 3 setget set_health
export var speed: int = 100
export var damage: int = 3
var velocity: Vector2 = Vector2.ZERO
var gravity: int = 800

var player = null

onready var player_detection_zone = $PlayerDetectionZone
onready var hitbox = $HitBox
onready var animation_player = $AnimationPlayer

func _ready() -> void:
	player_detection_zone.connect("body_entered", self, "_on_PlayerDetectionZone_Body_entered")
	player_detection_zone.connect("body_exited", self, "_on_PlayerDetectionZone_Body_exited")
	hitbox.connect("area_entered", self, "_on_Hitbox_Area_entered")



func _physics_process(delta: float) -> void:
	if can_see_player():
		seek_player()
	else:
		velocity.x = 0
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity)


func hit(damage) -> void:
	self.health -= damage
	animation_player.play("Hit")
	player = Globals.player


func set_health(value: int) -> void:
	health = value
	if health <= 0:
		queue_free()


func can_see_player() -> bool:
	return player != null


func _on_PlayerDetectionZone_Body_entered(body: Node) -> void:
	if body is Player:
		player = body


func _on_PlayerDetectionZone_Body_exited(body: Node) -> void:
	player = null


func _on_Hitbox_Area_entered(area: Area2D) -> void:
	if area.owner.has_method("hit"):
		area.owner.hit(damage)


func seek_player() -> void:
	var direction = position.direction_to(player.global_position)
	if direction.x > 0:
		velocity.x = 1 * speed
	elif direction.x < 0:
		velocity.x = -1 * speed

