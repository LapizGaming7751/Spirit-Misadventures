extends State

func PhysicsUpdate(delta):
	Player.velocity.y = 0
	Player.velocity.x = ((Player.lastDir * Player.baseSpeed) * 2500) * delta
	Player.Anims.play("dashing")
	
	if Player.Anims.frame == 4:
		Player.Anims.play("default")
		Player.velocity.x = ((Player.dir.x * Player.baseSpeed) * 1000) * delta
		if !Player.is_on_floor():
			parent.transit("Air")
		elif Player.dir.x != 0:
			parent.transit("Moving")
		elif Input.is_action_pressed("down"):
			parent.transit("Crouch")
		else:
			parent.transit("Idle")
