# meta-name: Empty Basic State
# meta-description: Lays out the functions within states for usage. Used for basic, generic states.
# meta-default: true
# meta-space-indent: 4
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
	pass
