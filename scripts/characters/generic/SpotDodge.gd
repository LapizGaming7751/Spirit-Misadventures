extends State

func Enter():
	if Player.confidence >= 20:
		Player.confidence -= 20
		print(Player.name+": Enough confidence. Dodging")
	else:
		print(Player.name+": Not enough confidence. Spot Dodge not registered")
		if !Player.is_on_floor():
			parent.transit("Air")
		elif Player.dir.x != 0:
			parent.transit("Moving")
		elif Input.is_action_pressed("down"):
			parent.transit("Crouch")
		else:
			parent.transit("Idle")

func PhysicsUpdate(delta):
	Player.Anims.play("dashing")
	Player.dir.x = 0
	
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

func Exit():
	if Player.damageTaken > 0.0:
		Player.confidence += Player.damageTaken / 10
		Player.damageTaken = 0.0
