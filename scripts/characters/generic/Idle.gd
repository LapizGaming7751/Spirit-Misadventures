extends State

func PhysicsUpdate(delta):
	Player.velocity.x = 0
	Player.velocity.y += ((Player.dir.y * Player.jumpStr) * 1000) * delta
	Player.Anims.play("default")
	
	if !Player.is_on_floor():
		parent.transit("Air")
	if Player.dir.x != 0:
		if Player.DTActive && parent.isPreviousState("Moving"):
			parent.transit("Turnaround")
		else:
			parent.transit("Moving")
	if Input.is_action_pressed("down"):
		parent.transit("Crouch")
	if Input.is_action_just_pressed("dash"):
		parent.transit("SpotDodge")
	
	if Input.is_action_just_pressed("block"):
		parent.transit("Parry")
	
	if Input.is_action_just_pressed("skillOne"):
		parent.transit("1")
	if Input.is_action_just_pressed("skillTwo"):
		parent.transit("2")
	if Input.is_action_just_pressed("skillThree"):
		parent.transit("3")
	if Input.is_action_just_pressed("skillFour"):
		parent.transit("4")
