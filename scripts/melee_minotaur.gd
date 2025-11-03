extends CharacterBody2D
var in_range = false
var attacking = false
var speed = 200
var health  = 3
var chasing = false
@onready var player: CharacterBody2D = %Player
var projectile_original = preload("res://scenes/enemy_projectile.tscn")

func _process(delta: float) -> void:
	pass



func _on_melee_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		attacking = true 
		chasing = false 
	   

func _on_melee_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		attacking = false 
		


func _on_chase_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		pass

func _on_chase_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		pass


func _on_ranged_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		pass


func _on_ranged_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		pass
