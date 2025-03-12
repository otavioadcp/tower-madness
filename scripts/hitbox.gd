class_name HitBox extends Area2D

signal Damaged(damage: int)

func Take_Damage(damage: int):
	print("Damage!", damage);
	Damaged.emit(damage);
