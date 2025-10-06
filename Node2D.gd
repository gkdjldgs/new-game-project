extends Node2D
#physics stuff maybe?

@onready var arrow = preload("res://arrow.tscn")

func _on_arrow_timer_timeout() -> void:
	_on_childspawn()
#Spawningthecursors
var temposition = Vector2(0,0)

func _on_childspawn():
	var temposition = Vector2(temposition.x,temposition.y)
	temposition.x = int(randi_range(15,350))
	temposition.y = int(randi_range(25,250))
	var arrowtemp = arrow.instantiate()
	arrowtemp.global_position = Vector2(temposition.x, temposition.y)
	add_child(arrowtemp)
	await get_tree().create_timer(1.25).timeout
	_on_arrow_timer_timeout()
	arrowtemp.queue_free()
