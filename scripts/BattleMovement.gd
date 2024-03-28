extends CharacterBody2D
class_name Combat

# Vars
@export var baseSpeed : float = 10.0
@export var maxHP : float = 1500
const GRAVITY = 980

# Onreadies
@onready var Anims = $Anims
@onready var State = $StateMachine

# Stats
var jumpStr : float = 25
var dir : Vector2
var curHP : float = maxHP

func control():
	dir.x = Input.get_axis("left","right")
	dir.y = -Input.get_action_strength("jump")

func _physics_process(delta):
	control()
	
	if State.stateNow != "Air":
		velocity.y += ((dir.y * jumpStr) * 1000) * delta
		velocity.x = ((dir.x * baseSpeed) * 1000) * delta
	else:
		velocity.y += GRAVITY * delta
	
	move_and_slide()
