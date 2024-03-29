extends CharacterBody2D
class_name Combat

# Vars
@export var baseSpeed : float = 11.5
@export var maxHP : float = 1500
enum face{LEFT=-1,RIGHT=1}
@export var looking : face
@export var lastDir : face
var maxConfidence : int = 100
var confidence : float = 50.0
var hurt : float
var knockbackTaken : Vector2
var damageTaken : float
const GRAVITY = 1250

# Onreadies
@onready var Anims = $Anims
@onready var State = $StateMachine
@onready var CheatTimer = $ConfidenceRegen
@onready var DoubleTap = $DoubleTap
var DTActive : bool

# Stats
var jumpStr : float = 14.5
var dir : Vector2
var curHP : float = maxHP

func _ready():
	looking = face.RIGHT
	lastDir = face.RIGHT

func control():
	dir.x = Input.get_axis("left","right")
	if dir.x != 0:
		lastDir = int(dir.x)
	dir.y = -Input.get_action_strength("jump")

func is_anything_just_released():
	for action in InputMap.get_actions():
		if Input.is_action_just_released(action):
			return true
	return false

func _physics_process(delta):
	control()
	
	if confidence > maxConfidence:
		confidence = maxConfidence
	if confidence < 0.0:
		confidence = 0.0
	
	$Health.text = str(curHP)
	if is_anything_just_released():
		DoubleTap.start()
		print("Listening for DT")
	if DoubleTap.time_left > 0:
		DTActive = true
	else:
		DTActive = false
	move_and_slide()

func _on_confidence_regen_timeout():
	confidence += 2
	print(str(get_name())+": "+str(confidence))

func take_damage(damage : float, knockback : Vector2, hurtTime : float):
	if !State.isCurrentState("SpotDodge") or !State.isCurrentState("Dash"):
		print(str(get_name())+": Took "+str(damage)+" damage!")
		hurt = hurtTime
		knockbackTaken = knockback
		damageTaken = damage
		if !State.isCurrentState("Parry") and !State.isCurrentState("Block"):
			State.transit("Hurt")
			print(State.currentState)
