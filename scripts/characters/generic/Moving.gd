extends State

func PhysicsUpdate(_delta):
	if !Player.is_on_floor():
		get_parent().transit("Air")
	if Player.dir.x == 0:
		get_parent().transit("Idle")
