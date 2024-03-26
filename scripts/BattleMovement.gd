extends CharacterBody2D

# Vars
@export var baseSpeed : float = 10.0
@export var maxHP : float = 1500
@export var elm : Array = ["empty","joy","sorrow","vengance","fear","power","wealth","fame"]

# StateMachine
@onready var State = $StateMachinePlayer

# Stats

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
