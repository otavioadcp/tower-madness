class_name WaveManager extends Node

@export var enemy_factory: EnemyFactory
@export var waves_data: Dictionary
var current_wave: int = 0
var current_round: int = 1
var current_stage: String = "fase_1"

func _ready():
	start_wave()

func start_wave():
	var wave_data = waves_data[current_stage][current_wave]
	print("Starting Wave ", current_wave, " for stage ", current_stage)
	spawn_enemies(wave_data["enemies"])

func spawn_enemies(enemy_data: Array):
	for enemy_info in enemy_data:
		var enemy_type = enemy_info["type"]
		var enemy_count = enemy_info["count"]
		var difficulty = enemy_info["difficulty"]

		for i in range(enemy_count):
			var enemy = enemy_factory.create_enemy(enemy_type, difficulty)
			add_child(enemy)
	
	current_round += 1
	if current_round > len(waves_data[current_stage][current_wave]["enemies"]):
		current_wave += 1
		current_round = 1
		if current_wave > len(waves_data[current_stage]):
			print("All waves completed for this stage!")
