extends State

##Called when the State is activated
func Enter():
	pass

##Called when the state is deactivated
func Exit():
	pass

##Called every frame, similar to _process(delta)
func Update(_delta:float):
	pass

##Called every physics frame, similar to _physics_process(delta). If the state is a skill, autoplay the skill. 
func PhysicsUpdate(delta:float):
	Entity.velocity.y += Entity.GRAVITY * delta
	
	if Entity.is_on_floor():
		if Entity.velocity.x != 0:
			Machine.transit("Walk")
		else:
			Machine.transit("Idle")

