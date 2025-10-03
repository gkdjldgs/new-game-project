extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var arrow = preload("res://arrow.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	pass
var temposition = Vector2(0,0)

func _on_childspawn():
	print('wow')
	var temposition = Vector2(temposition.x,temposition.y)
	temposition.x = int(randi_range(-190,190))
	temposition.y = int(randi_range(-130,130))
	var arrowtemp = arrow.instantiate()
	arrowtemp.global_position = Vector2(temposition.x, temposition.y)
	add_child(arrowtemp)
	print(arrowtemp.position)
	await get_tree().create_timer(4.5).timeout
	print('woahdd')


func _on_arrow_timer_timeout() -> void:
	_on_childspawn()
