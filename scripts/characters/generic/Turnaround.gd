extends State

func Enter():
	if Player.looking != Player.lastDir:
		Player.looking = Player.lastDir
		print(Player.name+": Turned player around. Now facing "+str(Player.looking))
	else:
		print(Player.name+": Did not turn player around. Same face as moving direction.")
		parent.transit("Idle")

func PhysicsUpdate(delta):
	Player.Anims.play("turnaround")
	
	match Player.Anims.frame:
		3:
			parent.transit("Idle")
