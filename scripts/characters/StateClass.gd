extends Node
class_name State

var Player : CharacterBody2D

func _ready():
	Player = get_owner()

func Enter():
	pass

func Exit():
	pass

func Update(_delta:float):
	pass

func PhysicsUpdate(_delta:float):
	pass
