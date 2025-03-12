class_name Enemy extends Node2D

@export var health: int = 100
@export var damage: int = 10
@export var speed: int = 200
@export var level: int = 1

func _ready() -> void:
	scale_stats_by_level()

func scale_stats_by_level() -> void:
	health *= level
	speed += (level * 10)
	damage += (level * 5)

func attack(target):
	print("Enemy attacks for ", damage, " damage!")

func take_damage(amount: int):
	health -= amount
	print("Enemy took ", amount, " damage. Remaining health: ", health)
	if health <= 0:
		die()

func die():
	print("Enemy defeated!")
	queue_free()
