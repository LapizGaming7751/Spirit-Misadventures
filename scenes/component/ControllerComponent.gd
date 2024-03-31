extends Node
class_name PlayerController

@onready var Entity : CharacterBody2D = get_parent()

var dir : Vector2

func _ready():
	print(Entity)

func _physics_process(delta):
	if Entity.is_on_floor():
		dir.x = Input.get_axis("left","right")
		dir.y = 0
		if Input.is_action_just_pressed("jump"):
			dir.y = -1
