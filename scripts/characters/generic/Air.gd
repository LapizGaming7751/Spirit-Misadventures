extends State

func PhysicsUpdate(_delta):
	if Player.is_on_floor():
		if Player.dir.x != 0:
			get_parent().transit("Moving")
		else:
			get_parent().transit("Idle")
