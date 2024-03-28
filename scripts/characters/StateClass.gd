## State Class is used as a child with StateMachine, allowing the node to pick up States and activate their code.

extends Node
class_name State

var Player : CharacterBody2D ## On ready, calls for the root node, which is usually the player donning a CharacterBody2D node.
var parent : Node ## On ready, calls for the parent node. The parent node MUST be a StateMachine node.

func _ready():
	Player = get_owner()
	parent = get_parent()

##Called when the State is activated
func Enter():
	pass

##Called when the state is deactivated
func Exit():
	pass

##Called every frame, similar to _process(delta)
func Update(_delta:float):
	pass

##Called every physics frame, similar to _physics_process(delta)
func PhysicsUpdate(_delta:float):
	pass
