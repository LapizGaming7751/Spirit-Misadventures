extends State

var rememberDir

func Enter():
	rememberDir = Player.lastDir
	if Player.confidence >= 20:
		Player.confidence -= 20
		print(Player.name+": Enough confidence. Dashing")
	else:
		print(Player.name+": Not enough confidence. Dash not registered")
		if !Player.is_on_floor():
			parent.transit("Air")
		elif Player.dir.x != 0:
			parent.transit("Moving")
		elif Input.is_action_pressed("down"):
			parent.transit("Crouch")
		else:
			parent.transit("Idle")

func PhysicsUpdate(delta):
	Player.velocity.y = 0
	Player.velocity.x = ((rememberDir * Player.baseSpeed) * 2500) * delta
	Player.Anims.play("dashing")
	
	if Player.Anims.frame == 4:
		Player.Anims.play("default")
		Player.velocity.x = ((rememberDir * Player.baseSpeed) * 1000) * delta
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
		Player.confidence += Player.damageTaken / 20
		Player.damageTaken = 0.0
