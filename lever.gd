extends Area2D 

@onready var activiation_range: CollisionShape2D = $Area2D/CollisionShape2D
@onready var animation_lever: AnimatedSprite2D = $AnimatedSprite2D
var jewel_original = preload("res://scenes/jewel.tscn")
var jewel_created
var in_range = false 
@onready var player: CharacterBody2D = %Player

func _ready() -> void:
	animation_lever.play("off")
	
	
func _process(_delta):
	if Input.is_action_just_pressed("lever_switch") and in_range:
		
		if name== "Lever":
			if !player.lever1:
				animation_lever.play("on")
				player.lever1 = true
				
			else: 
				animation_lever.play("off")
				player.lever1 = false 
				
		if name == "Lever2":
			if !player.lever2:
				animation_lever.play("on")
				player.lever2 = true
				
			else:
				animation_lever.play("off")
				player.lever2 = false 
				
		if name == "Lever3":
			if !player.lever3:
				animation_lever.play("on")
				player.lever3 = true
				
			else:
				animation_lever.play("off")
				player.lever3 = false 
	
	if player.lever1 and player.lever2 and player.lever3 and !jewel_created:
	
		var jewel = jewel_original.instantiate()
		jewel_created = true
		jewel.global_position = position + Vector2(-13, 27)

		get_tree().get_root().add_child(jewel)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		in_range = true
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		in_range = false
