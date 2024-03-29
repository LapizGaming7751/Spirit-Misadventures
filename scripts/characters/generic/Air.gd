extends State

func PhysicsUpdate(delta):
	Player.velocity.y += Player.GRAVITY * delta
	
	if Input.is_action_just_pressed("block"):
		parent.transit("Parry")
	
	if Player.is_on_floor():
		if Player.dir.x != 0:
			parent.transit("Moving")
		else:
			parent.transit("Idle")
	if Input.is_action_just_pressed("dash"):
		parent.transit("Dash")
