extends CharacterBody2D

var target;
var pathname = "";
var speed = 600;
var damage;


#TODO: Revisar lógica. Parece depender demais da localizaçao dos nodes e nomes.
func _physics_process(delta: float):
	var enemiesRootPath = get_tree().get_root().get_node("Main/Path2D");
	var enemiesPathFollowCount = enemiesRootPath.get_child_count();
	
	for i in enemiesPathFollowCount:
		if enemiesRootPath.get_child(i).name == pathname:
			target = enemiesRootPath.get_child(i).get_child(0).global_position;
	velocity = global_position.direction_to(target) * speed;
	
	look_at(target);
	
	move_and_slide();


#TODO: Refatorar: passar a responsabilidade de controlar a vida para o "enemy"
func _on_area_2d_body_entered(body: Node2D) -> void:
	if "Bat" in body.name:
		body.health -= damage;
		queue_free();
