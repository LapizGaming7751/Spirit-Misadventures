extends State

func PhysicsUpdate(delta):
	Player.velocity.x = 0
	Player.velocity.y += ((Player.dir.y * Player.jumpStr) * 1000) * delta
	
	if !Player.is_on_floor():
		parent.transit("Air")
	if Player.dir.x != 0:
		parent.transit("Moving")
	if Input.is_action_pressed("down"):
		parent.transit("Crouch")
