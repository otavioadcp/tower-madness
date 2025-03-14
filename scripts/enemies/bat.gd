extends Enemy


func _init(): 
	health = 50;
	speed = 250;
	damage = 5;
	level = 1;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super.scale_stats_by_level(level);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
