extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var arrow = preload("res://arrow.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	pass
#angling the cursors
#Spawningthecursors
var temposition = Vector2(0,0)

func _on_childspawn():
	print(Coinplayer.locating)
	var temposition = Vector2(temposition.x,temposition.y)
	temposition.x = int(randi_range(15,350))
	temposition.y = int(randi_range(25,250))
	var arrowtemp = arrow.instantiate()
	arrowtemp.global_position = Vector2(temposition.x, temposition.y)
	var direction = arrowtemp.position - Coinplayer.locating
	var angle = direction.angle() 
	add_child(arrowtemp)
	arrowtemp.rotation = angle
	await get_tree().create_timer(4.5).timeout



func _on_arrow_timer_timeout() -> void:
	_on_childspawn()
