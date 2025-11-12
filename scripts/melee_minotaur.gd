extends CharacterBody2D
var in_range = false
var attacking = false
var speed = 250
var health  = 3
var chasing = false
var direction = Vector2(0,0)
var start_time = 1
var timer =  start_time

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D


	
@onready var player: CharacterBody2D = %Player
var projectile_original = preload("res://scenes/enemy_projectile2.tscn")

func _process(delta: float) -> void:
	if direction:
		anim.flip_h = true
	else:
		anim.flip_h = false

	if in_range:
		timer -= delta
	if timer < 0:
		shoot(player)
		timer = start_time
	
		pass
	elif chasing and !attacking:
		velocity = Vector2.ZERO
		direction = position.direction_to(player.position)
		position += direction * delta * speed 
		
	elif !chasing and !attacking:
		pass
		

	
	
	if !in_range and chasing:
		print("chasing, not in range")
	
	
	

func _on_melee_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		attacking = true 
		chasing = false 
	  
	

func _on_melee_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		attacking = false 
		chasing = true 


func _on_chase_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		chasing = true
		attacking = false
		in_range = false

func _on_chase_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		chasing = false
		in_range = true

func _on_ranged_body_entered(body: Node2D) -> void:
	
	if body.name == "Player":
		in_range = true
		attacking = false


func _on_ranged_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_range = false

func shoot(player):
	# TODO: Create a new projectile instance
	var projectile_clone = projectile_original.instantiate()
	
	# TODO: Set projectile position to player position
	projectile_clone.global_position = position 
	
	# TODO: Set projectile direction using facing variable 
	projectile_clone.set_direction(player.position)
	
	# TODO: Add projectile to the game world
	get_tree().get_root().add_child(projectile_clone)
