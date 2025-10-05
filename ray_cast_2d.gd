extends RayCast2D
var detect = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	while not is_colliding():
		rotate(20)
	if is_colliding():
		print('f')
	else:
		pass
		
		
	
