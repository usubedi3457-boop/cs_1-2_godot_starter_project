extends CharacterBody2D
var projectile_original = preload("res://scenes/enemy_projectile.tscn")
@export var offset : Vector2 = Vector2(0, -25)

var facing
var start_time = 2
var timer =  start_time
var in_range = false
var player

func _ready():
	
	pass

func _process(delta: float) -> void:
	
	if in_range:
		timer -= delta
		if timer < 0:
			shoot(player)
			timer = start_time
	pass


	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player": 
		player = body
		in_range = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		@warning_ignore("standalone_expression")
		player == null
		in_range = false
	pass # Replace with function body.
	
func shoot(body):
	# TODO: Create a new projectile instance
	var projectile_clone = projectile_original.instantiate()
	
	# TODO: Set projectile position to player position
	projectile_clone.global_position = position + offset
	
	# TODO: Set projectile direction using facing variable
	projectile_clone.set_direction(body.position)
	
	# TODO: Add projectile to the game world
	get_tree().get_root().add_child(projectile_clone)

	pass
