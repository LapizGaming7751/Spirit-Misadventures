extends State

func PhysicsUpdate(delta):
	Player.velocity.x = ((Player.dir.x * Player.baseSpeed) * 500) * delta
	
	if Input.is_action_just_released("down"):
		if Player.dir.x != 0:
			parent.transit("Moving")
		else:
			parent.transit("Idle")
	if Input.is_action_just_pressed("dash") && Player.confidence >= 20:
		Player.confidence -= 20
		parent.transit("Dash")
	
