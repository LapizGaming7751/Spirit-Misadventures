## State Class is used as a child with StateMachine, allowing the node to pick up States and activate their code.

extends Node
class_name State

@export var isSkill : bool ## If this state is a skill, activates various other variables
@export var activeFrame : int ## The active hurtbox of the skill
@export var endFrame : int ## Ending frame of the hurtbox of the skill.
@export var knockback : Vector2 ##Knockback dealt to the enemy on active frame
@export var selfKnockback : Vector2 ##Knockback dealt to yourself on active frame, granted the attack hits.
@export var lunge : Vector2 ##Knockback preemtively dealt to yourself before active frames. 
@export var stunsFor : float ##The amount of stun in frames
@export var defaultTransit : State ## The default transition of the node.
@export var damage : float ## The amount of damage this skill does
@export var requiredConfidence : float ## The amount of confidence required to use this move
@export var returnsConfidence : float ## The amount of confidence regained if this move were to successfully hit.

enum slot{DISABLED,ONE,TWO,THREE,FOUR,HIDDEN}
@export var skillStatus : slot ## The current status in which the skill is active. DISABLED means not used and HIDDEN means not shown.

var Frames : AnimatedSprite2D ## Refers to animation
var Hurtbox : Hurtbox ## Refers to node Hurtbox
var Player : CharacterBody2D ## On ready, calls for the root node, which is usually the player donning a CharacterBody2D node.
var parent : Node ## On ready, calls for the parent node. The parent node MUST be a StateMachine node.

func _ready():
	Player = get_owner()
	parent = get_parent()
	Frames = Player.Anims

##Called when the State is activated
func Enter():
	Player = get_owner()
	parent = get_parent()
	Frames = Player.Anims
	if isSkill:
		Hurtbox = $Hurtbox
		Hurtbox.active = false
		if Player.confidence > Hurtbox.requiredConfidence:
			Player.confidence -= Hurtbox.requiredConfidence
		else:
			parent.transit(defaultTransit.get_name())

##Called when the state is deactivated
func Exit():
	pass

##Called every frame, similar to _process(delta)
func Update(_delta:float):
	pass

##Called every physics frame, similar to _physics_process(delta). If the state is a skill, autoplay the skill. 
func PhysicsUpdate(delta:float):
	if isSkill:
		var animFrames = Frames.sprite_frames.get_frame_count(self.get_name()) -1
		Frames.play(self.get_name())
		Player.velocity.x = (lunge.x * 1000) * delta * Player.looking
		Player.velocity.y = (lunge.y * 1000) * delta
		match Frames.frame:
			activeFrame:
				Hurtbox.active = true
				Player.velocity.x = (selfKnockback.x * 1000) * delta * Player.looking
				Player.velocity.y = (selfKnockback.y * 1000) * delta
			endFrame:
				Hurtbox.active = false
		if Frames.frame == animFrames:
			parent.transit(defaultTransit.get_name())
