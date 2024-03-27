extends CharacterBody2D

# Vars
@export var baseSpeed : float = 10.0
@export var maxHP : float = 1500
const GRAVITY = 980

# Stats
var jumpStr : float = 25
var dir : Vector2
var curHP : float = maxHP

func control():
	if is_on_floor():
		dir.x = Input.get_axis("left","right")
	dir.y = -Input.get_action_strength("jump")

func _physics_process(delta):
	control()
	
	velocity.x = ((dir.x * baseSpeed) * 1000) * delta
	
	if is_on_floor():
		velocity.y += ((dir.y * jumpStr) * 1000) * delta
	else:
		velocity.y += GRAVITY * delta
	
	move_and_slide()
