extends State

func PhysicsUpdate(delta):
	if Player.damageTaken > 0:
		Player.confidence += Player.damageTaken / 15
		Player.curHP -= Player.damageTaken * 0.8
		Player.damageTaken = 0
	else:
		if Input.is_action_just_released("block"):
			parent.transit("Idle")
