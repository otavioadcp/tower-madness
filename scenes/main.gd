extends Node2D

@onready var enemy_factory: EnemyFactory = $EnemyFactory
@onready var wave_manager: WaveManager = $"Wave manager"

var waves = [
		[ {"type": "bat", "quantity": 5} ],
		[ {"type": "bat", "quantity": 10} ]
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wave_manager.wave_data = waves;
	
	var start_button = get_node("Wave button");
	
	start_button.pressed.connect(wave_manager.start_wave)
