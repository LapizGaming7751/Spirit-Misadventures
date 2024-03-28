extends State

func PhysicsUpdate(delta):
	Player.velocity.y += Player.GRAVITY * delta
	
	if Player.is_on_floor():
		if Player.dir.x != 0:
			parent.transit("Moving")
		else:
			parent.transit("Idle")
	if Input.is_action_just_pressed("dash") && Player.confidence >= 20:
		Player.confidence -= 20
		parent.transit("Dash")
