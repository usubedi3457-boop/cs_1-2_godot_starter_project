extends Area2D
var start_time = 2
var timer = start_time
var direction
var speed= 300
var player
func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		body.change_health(-1)
		queue_free()
		
		pass

func _physics_process(_delta):
	position += direction * speed * _delta
															 
func set_direction(target):
	direction = position.direction_to(target)
	
func _process(delta: float) -> void:
	timer -= delta 
	if timer <0:
		queue_free()
