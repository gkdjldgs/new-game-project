extends Node2D
#physics stuff maybe?
var speed = 100
var temptation = Coinplayer.locating


# Called when the node enters the scene tree for the first time.

var bread = func _physics_process(delta: float) -> void:
	var state = get_world_2d().direct_space_state
#	var check = PhysicsRayQueryParameters2D.create(temposition,pai)
#	check.exclude = [self]
@onready var arrow = preload("res://arrow.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.

func physics_process(delta: float) -> void:
	pass
#angling the cursors
	
func _on_arrow_timer_timeout() -> void:
	_on_childspawn()
#Spawningthecursors
var temposition = Vector2(0,0)

func _on_childspawn():
	var pain = get_parent().get_node('Coinplayer').global_position

	var temposition = Vector2(temposition.x,temposition.y)
	temposition.x = int(randi_range(15,350))
	temposition.y = int(randi_range(25,250))
	var arrowtemp = arrow.instantiate()
	arrowtemp.global_position = Vector2(temposition.x, temposition.y)
	var facing = Vector2(temposition.x,pain.y)
	var angular = atan2(temposition.x-pain.x,temposition.y-pain.y)

	add_child(arrowtemp)
#	arrowtemp.velocity = direction * speed
	arrowtemp.rotation = angular
	facing = 0
	
	pain = 0
	await get_tree().create_timer(1.25).timeout

	_on_arrow_timer_timeout()
	arrowtemp.queue_free()
	print(pain)
	print(arrowtemp.position)
