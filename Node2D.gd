extends Node2D
#physics stuff maybe?

@onready var arrow = preload("res://arrow.tscn")
@onready var Bottle = preload("res://Bottle.tscn")
@onready var coinae = preload("res://Coin.tscn")
func _on_arrow_timer_timeout() -> void:
	_on_childspawn()

var temposition = Vector2(0,0)
var teposition = Vector2(0,0)
var tposition = Vector2(0,0)
func _on_childspawn():
	var temposition = Vector2(temposition.x,temposition.y)
	temposition.x = int(randi_range(15,350))
	temposition.y = int(randi_range(25,250))
	var arrowtemp = arrow.instantiate()
	arrowtemp.global_position = Vector2(temposition.x, temposition.y)
	add_child(arrowtemp)
	await get_tree().create_timer(0.75).timeout
	_on_arrow_timer_timeout()
	if is_instance_valid(arrowtemp):
		arrowtemp.queue_free()
	else:
		pass


func _on_bottlespawn():
	var teposition = Vector2(teposition.x,teposition.y)
	teposition.x = int(randi_range(15,350))
	teposition.y = int(randi_range(25,250))
	var bottletemp = Bottle.instantiate()
	bottletemp.global_position = Vector2(teposition.x, teposition.y)
	add_child(bottletemp)
	await get_tree().create_timer(1.25).timeout
	_on_bottle_timer_timeout()
	if is_instance_valid(bottletemp):
		bottletemp.queue_free()
	else:
		pass
func _on_bottle_timer_timeout() -> void:
	_on_bottlespawn()


func _on_coinspawn():
	var tposition = Vector2(tposition.x,tposition.y)
	tposition.x = int(randi_range(15,350))
	tposition.y = int(randi_range(25,250))
	var cointemp = coinae.instantiate()
	cointemp.global_position = Vector2(tposition.x, tposition.y)
	add_child(cointemp)
	await get_tree().create_timer(7).timeout
	_on_coin_timer_timeout()
	if is_instance_valid(cointemp):
		cointemp.queue_free()
	else:
		pass
func _on_coin_timer_timeout() -> void:
	_on_coinspawn()
