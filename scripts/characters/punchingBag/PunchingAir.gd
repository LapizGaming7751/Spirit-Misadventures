extends State

func PhysicsUpdate(delta):
	Player.velocity.y += Player.GRAVITY * delta
	
	if Player.is_on_floor():
		parent.transit("Idle")
