extends Node

@export var InitialState : State
var currentState : State
var previousState : State
var stateNow : String
var stateLast : String

var states : Dictionary = {}

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

func transit(nextState):
	var newState = states[nextState]
	if newState == currentState:
		return
	print(str(get_parent().name)+": "+stateNow+" transitioning to "+nextState+". Previous state: "+stateLast)
	if states.has(nextState):
		previousState = currentState
		currentState = newState
		stateNow = currentState.name
		stateLast = previousState.name
	
