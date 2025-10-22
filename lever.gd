extends Area2D

@export var door_to_open: NodePath

var is_active = false
var player_is_in_area = false

@onready var sprite = $Sprite2D

func _ready():
	
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _on_body_entered(body: Node2D):
	
	if body.is_in_group("player"):
		player_is_in_area = true


func _on_body_exited(body: Node2D):
	if body.is_in_group("player"):
		player_is_in_area = false


func _toggle_lever():
	is_active = not is_active
	
	if is_active:
		
		sprite.texture = preload("res://scenes/lever.tscn::AtlasTexture_qxmkn")
		print("Lever is ON")
	else:
		
		sprite.texture = preload("res://scenes/lever.tscn::AtlasTexture_3341j")
		print("Lever is OFF")
