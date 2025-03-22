extends Enemy


func _init(): 
	health = 10;
	speed = 10;
	damage = 5;
	level = 1;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super.scale_stats_by_level(level);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_parent().set_progress(get_parent().get_progress() + speed * delta);
	
	if get_parent().get_progress_ratio() == 1:
		get_parent().queue_free();
	
	if health <= 0:
		get_parent().queue_free();
	
