extends Node2D
@onready var why = Coinplayer.locating 
var balls = Vector2(0,0)
func death():
	Coinplayer.death()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
@export var temposition = balls

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	Coinplayer.life = Coinplayer.life - 1
	death()
	
