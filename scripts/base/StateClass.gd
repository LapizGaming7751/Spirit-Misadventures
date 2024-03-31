## State Class is used as a child with StateMachine, allowing the node to pick up States and activate their code.

extends Node
class_name State

var Frames : AnimatedSprite2D ## Refers to animation
var Entity : CharacterBody2D ## On ready, calls for the root node, which is usually the Entity donning a CharacterBody2D node.
var SMP : StateMachine ## On ready, calls for the SMP node. The SMP node MUST be a StateMachine node.

func _ready():
	Entity = get_owner()
	SMP = Entity.SMP
	Frames = Entity.Anims

##Called when the State is activated
func Enter():
	pass

##Called when the state is deactivated
func Exit():
	pass

##Called every frame, similar to _process(delta)
func Update(_delta:float):
	pass

##Called every physics frame, similar to _physics_process(delta). If the state is a skill, autoplay the skill. 
func PhysicsUpdate(delta:float):
	pass
