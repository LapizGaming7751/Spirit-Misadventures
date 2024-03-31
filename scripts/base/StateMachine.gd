extends Node
class_name StateMachine

## The State Machine. Used to manage states.

@export var InitialState : State ## The starting state, exported for ease of access.
var currentState : State ## The current state that this machine is handling. Any state here will have its script run.
var previousState : State ## When a new state is activated via transit(nextState), the currentState will instead become the previous State, being stored for 1 state. Useful for keystrokes

var states : Dictionary = {} ## A Dictionary that on ready, takes all children that are type States into itself, with the key being their names.

func _ready():
	for child in get_children():
		if child is State:
			if not child.isSkill:
				states[child.name] = child
			elif child.skillStatus != child.slot.DISABLED and child.skillStatus != child.slot.HIDDEN:
				states[str(child.skillStatus)] = child
	if states:
		print(states)
	else: 
		print("You should probably insert some states in this guy. This place is mad empty")
	
	if InitialState:
		InitialState.Enter()
		currentState = InitialState
		previousState = InitialState

func _process(delta):
	if currentState:
		currentState.Update(delta)

func _physics_process(delta):
	if currentState:
		currentState.PhysicsUpdate(delta)

## Transitions the current state into the listed next state, pushing itself to the Previous state while pulling the selected state into the new Current
func transit(nextState):
	if not states.has(nextState):
		print("No state found")
		return
	
	var newState = states[nextState]
	if newState == currentState:
		return
	print(
		str(get_parent().name)+": "+str(currentState.get_name())+
		" --> "+nextState+". Prev: "+str(previousState.get_name()))
	if states.has(nextState):
		previousState = currentState
		currentState = newState
	previousState.Exit()
	currentState.Enter()

## Asks for the current state in string form. Returns true if current state is what's requested
func isCurrentState(request : String):
	if currentState.name == request:
		return true
	else:
		return false

## Asks for the previous state in string form. Returns true if previous state is what's requested.
func isPreviousState(request : String):
	if previousState.name == request:
		return true
	else:
		return false
