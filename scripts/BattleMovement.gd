extends CharacterBody2D
class_name Combat

# Vars
@export var baseSpeed : float = 11.5
@export var maxHP : float = 1500
enum face{LEFT,RIGHT}
@export var looking : face
const GRAVITY = 1250

# Onreadies
@onready var Anims = $Anims
@onready var State = $StateMachine

# Stats
var jumpStr : float = 14.5
var dir : Vector2
var curHP : float = maxHP

func control():
	dir.x = Input.get_axis("left","right")
	dir.y = -Input.get_action_strength("jump")

func _physics_process(delta):
	control()
	
	move_and_slide()
