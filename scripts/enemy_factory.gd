class_name EnemyFactory extends Node

@onready var enemy_scenes: Dictionary = {
	"bat": { 
		"scene": preload("res://scenes/enemies/bat.tscn")
	}
}

func create_enemy(type: String, difficulty: float) -> Enemy:
	var enemy_scene = enemy_scenes[type];
	if enemy_scene == null || enemy_scene.scene == null:
		push_error("Enemy type not found: " + type)
		return null

	var enemy = enemy_scene.scene.instantiate()
	enemy.level = difficulty;
	
	return enemy
