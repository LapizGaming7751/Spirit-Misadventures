extends CharacterBody2D
class_name Combat

# Vars
@export var baseSpeed : float = 11.5
@export var maxHP : float = 1500
enum face{LEFT=-1,RIGHT=1}
@export var looking : face
@export var lastDir : face
var maxConfidence : int = 100
var confidence : int = 0
const GRAVITY = 1250

# Onreadies
@onready var Anims = $Anims
@onready var State = $StateMachine
@onready var CheatTimer = $ConfidenceRegen

# Stats
var jumpStr : float = 14.5
var dir : Vector2
var curHP : float = maxHP

func _ready():
	looking = face.RIGHT
	lastDir = face.RIGHT

func control():
	dir.x = Input.get_axis("left","right")
	if dir.x == 1:
		lastDir = face.RIGHT
	elif dir.x == -1:
		lastDir = face.LEFT
	dir.y = -Input.get_action_strength("jump")

func _physics_process(delta):
	if State.stateNow != "Dash":
		control()
	
	move_and_slide()

func _on_confidence_regen_timeout():
	confidence += 2
	if confidence > maxConfidence:
		confidence = maxConfidence
	print(confidence)
