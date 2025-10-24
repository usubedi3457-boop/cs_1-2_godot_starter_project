extends Node
var on = false
var in_range = false



func _process(_delta):
	if Input.is_action_just_pressed("number+=1"):
		in_range = true
