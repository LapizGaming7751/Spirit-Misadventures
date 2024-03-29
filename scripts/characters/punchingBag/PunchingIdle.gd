extends State

func PhysicsUpdate(delta):
	Player.velocity.x = 0
	Player.velocity.y += 0
	Player.Anims.play("default")
	
	if !Player.is_on_floor():
		parent.transit("Air")
