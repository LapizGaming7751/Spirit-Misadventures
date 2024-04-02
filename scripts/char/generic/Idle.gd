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
	Entity.velocity.x = 0
	Entity.velocity.y = Entity.Cont.dir.y * Entity.baseJump * 1000 * delta
	
	if Entity.Cont.dir.x != 0:
		Machine.transit("Walk")
	if not Entity.is_on_floor():
		Machine.transit("Air")

