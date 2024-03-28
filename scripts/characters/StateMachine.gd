extends Node
class_name StateMachine

## The State Machine. Used to manage states.

@export var InitialState : State ## The starting state, exported for ease of access.
var currentState : State ## The current state that this machine is handling. Any state here will have its script run.
var previousState : State ## When a new state is activated via transit(nextState), the currentState will instead become the previous State, being stored for 1 state. Useful for keystrokes
var stateNow : String ## currentState in a string form.
var stateLast : String = "None" ## previousState in a string form.

var states : Dictionary = {} ## A Dictionary that on ready, takes all children that are type States into itself, with the key being their names.

func _ready():
	for child in get_children():
		if child is State:
			states[child.name] = child
	
	if InitialState:
		InitialState.Enter()
		currentState = InitialState
		stateNow = currentState.name

func _process(delta):
	if currentState:
		currentState.Update(delta)

func _physics_process(delta):
	if currentState:
		currentState.PhysicsUpdate(delta)

## Transitions the current state into the listed next state, pushing itself to the Previous state while pulling the selected state into the new Current
func transit(nextState):
	var newState = states[nextState]
	if newState == currentState:
		return
	print(str(get_parent().name)+": "+stateNow+" --> "+nextState+". Prev: "+stateLast)
	if states.has(nextState):
		previousState = currentState
		currentState = newState
		stateNow = currentState.name
		stateLast = previousState.name
	
