extends State

@export var parryUptime : float = 0.35
var parryTime : float

func Enter():
	parryTime = parryUptime

func PhysicsUpdate(delta):
	parryTime -= delta
	if parryTime >= 0.0 && Player.damageTaken > 0:
		Player.confidence += Player.damageTaken / 10
		if Input.is_action_pressed("block"):
			Player.damageTaken = 0
			parent.transit("Block")
		else:
			Player.damageTaken = 0
			parent.transit("Idle")
	elif parryTime <= 0.0:
		Player.confidence -= 10
		if Input.is_action_pressed("block"):
			parent.transit("Block")
		else:
			parent.transit("Idle")
