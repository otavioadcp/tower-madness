class_name Enemy extends Node2D

@export var health: float
@export var damage: float
@export var speed: float
@export var level: float

func scale_stats_by_level(initial_level: float) -> void:
	health *= initial_level
	speed += (initial_level * 10)
	damage += (initial_level * 5)

func attack(_target):
	print("Enemy attacks for ", damage, " damage!")

func take_damage(amount: int):
	health -= amount
	print("Enemy took ", amount, " damage. Remaining health: ", health)
	if health <= 0:
		die()

func die():
	print("Enemy defeated!")
	queue_free()
