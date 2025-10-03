extends CharacterBody2D
var locating = Vector2(0,0)
var life = 3
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var alive = true
#(cursor_enemy)
@onready var arrow = preload("res://arrow.tscn")

#movement
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("click") and alive:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction and alive:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
func death():
	if life <= 0:
		alive = false
		get_tree().change_scene_to_file("res://deathscreen.tscn")

func _on_area_2d_body_exited(body: CharacterBody2D) -> void:
	life = 0
	print(life)
	death()

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	life = life - 1
	print(position)
	death()

	


func _on_gameovercollision_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
