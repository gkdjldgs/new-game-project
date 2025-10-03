extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func resetti():
	get_tree().change_scene_to_file("res://ballin.tscn")
	
pass # Replace with function body.
##Input.is_action_just_pressed("reset")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		resetti()
		print('grease')


func _on_button_button_down() -> void:
	resetti()
