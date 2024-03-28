extends State

func PhysicsUpdate(delta):
	Player.velocity.x = ((Player.dir.x * Player.baseSpeed) * 1000) * delta
	Player.velocity.y += ((Player.dir.y * Player.jumpStr) * 1000) * delta
	
	if !Player.is_on_floor():
		parent.transit("Air")
	if Player.dir.x == 0:
		parent.transit("Idle")
	if Input.is_action_pressed("down"):
		parent.transit("Crouch")
	if Input.is_action_just_pressed("dash") && Player.confidence >= 20:
		Player.confidence -= 20
		parent.transit("Dash")
