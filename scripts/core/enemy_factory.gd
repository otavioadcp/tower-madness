class_name EnemyFactory extends Node


# Solução inicial para conseguir criar de forma dinamica e fácil.
# TODO: Encontrar uma forma de receber diretamente um array de {name: string, scene: PackadScene}
# Para tirar a responsabilidade da factory de saber as scenes, e passar para quem esta criando o wave manager
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
