extends Node
class_name State

var Player : CharacterBody2D
var parent : Node

func _ready():
	Player = get_owner()
	parent = get_parent()

func Enter():
	pass

func Exit():
	pass

func Update(_delta:float):
	pass

func PhysicsUpdate(_delta:float):
	pass
