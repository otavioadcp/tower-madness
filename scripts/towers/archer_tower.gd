extends StaticBody2D

var projectile = preload("res://scenes/bullets/arrow.tscn");
var damage = 5;
var pathname;
var current_targets = [];
var curr;
@onready var aim: Marker2D = $Aim


#TODO: Revisar logica de "detectar inimigos" e determinar alvo atual.
#TODO: Tirar o "hard coded" do "Bat" para conseguir aceitar qualquer inimigo.
#TODO: Revisar se a propria bullet não deveria ser responsavel pelo proprio movimento
#TODO: Tentar nao usar paths para fazer açoes. Ex: "get_node("../")"
#TODO: Controlar 1 disparo por vez.
func _on_tower_body_entered(body: Node2D) -> void:
	if "Bat" in body.name:
		var tempArray = [];
		current_targets = get_node("Tower").get_overlapping_bodies();
		print("entrou", current_targets)
		
		for i in current_targets:
			if "Bat" in i.name:
				tempArray.append(i);
		
		var current_target = null;
		
		for i in tempArray:
			if current_target == null:
				current_target = i.get_node("../")
			else:
				if i.get_parent().get_progress() > current_target.get_progress():
					current_target = i.get_node("../")
		
		curr = current_target;
		pathname = current_target.name;
		
		var tempBullet = projectile.instantiate();
		tempBullet.pathname = pathname;
		tempBullet.damage = damage;
		get_node("Bullet container").add_child(tempBullet);
		tempBullet.global_position = aim.global_position;
		
		
	pass # Replace with function body.
	

#TODO: Adicionar/mover lógica para disparar o projétil
func shoot_target():
	return;


#TODO: Adicionar lógica para trocar de alvo.
# Atualmente atualiza o array de inimigos dentro da area.
func _on_tower_body_exited(body: Node2D) -> void:
	current_targets = get_node("Tower").get_overlapping_bodies();
