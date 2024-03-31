# meta-name: State Template
# meta-description: Functions for states
# meta-default: true
# meta-space-indent: 4

## State Class is used as a child with StateMachine, allowing the node to pick up States and activate their code.

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
