class_name WaveManager extends Node2D


@export var path: Path2D
@export var enemy_factory: EnemyFactory  # Referência à EnemyFactory
@export var wave_data: Array = []  # Dados das ondas (cada onda será uma lista de inimigos com quantidade)
@export var spawn_delay: float = 1  # Tempo de atraso entre a criação de cada inimigo (em segundos)

var total_waves: int = 0;
var current_wave: int = 0;
var is_spawning: bool = false  # Flag para verificar se os inimigos estão sendo gerados

# Função chamada para iniciar o ciclo de ondas
func start_wave():
	if is_spawning:
		return  # Se já está gerando inimigos, não faça nada

	is_spawning = true
	spawn_wave(current_wave)

# Função que gera uma onda de inimigos
func spawn_wave(wave_index: int):
	if wave_index >= wave_data.size():
		print("Fim do jogo! Todas as ondas concluídas.")
		is_spawning = false
		return;  # Se todas as ondas foram concluídas, sai da função

	# Obtemos os dados da onda (tipos de inimigos e quantidades)
	var wave = wave_data[wave_index]
	for enemy_info in wave:
		var type = enemy_info["type"]
		var quantity = enemy_info["quantity"]
	# Criação dos inimigos para essa onda
		for i in range(quantity):
			spawn_enemy(type)
			await get_tree().create_timer(spawn_delay).timeout

	current_wave += 1

# Função para criar um inimigo
func spawn_enemy(type: String):
	var enemy = enemy_factory.create_enemy(type, 1)
	if enemy:
		enemy.global_position = global_position;
		var new_path = PathFollow2D.new();
		path.add_child(new_path);
		
		# Define um script, progresso e o inimigo ao PathFollow2D criado
		# Script tem as definiçoes de velocidade do path
		new_path.set_script(load("res://scripts/resources/path_follow_rsc.gd"))
		new_path.progress = 0; 
		new_path.add_child(enemy);

		print("Inimigo criado: ", type)
