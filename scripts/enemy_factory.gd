class_name EnemyFactory extends Node

@export var enemy_scenes: Array[PackedScene]

func create_enemy(type: String, difficulty: float) -> Enemy:
	var enemy_scene = enemy_scenes.find(func(e): return e.resource_name == type)
	if enemy_scene == null:
		push_error("Enemy type not found: " + type)
		return null

	var enemy = enemy_scene.instantiate()
	
	# Ajustando atributos com base na dificuldade
	enemy.health *= difficulty
	enemy.speed *= difficulty
	enemy.damage *= difficulty
	
	return enemy
