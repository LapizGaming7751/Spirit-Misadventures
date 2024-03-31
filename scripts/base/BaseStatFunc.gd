## Basic entity for Combat mode. This specific node class consists of stats and functions for characters.
extends CharacterBody2D
class_name CombatStat

# Enums
enum face{LEFT=-1,RIGHT=1} ## "Face" enum is used for variables using direction. Gives more context as opposed to using Bools.
## "Elemental" buffs for characters. 8 Desires in the game. None counter each other, only gives minor buffs.
enum elm{empty,joy,sorow,vengance,fear,power,wealth,fame}

# Properties
## Character name built for different interactions between characters.
## Certain skills can check for character name before activating special interactions.
@export var characterName : String = "BasicChar" 

## Character's maximum health.
## An average character's health is 1500.0. Tankier can go to 2500.0, while the squishiest is 500.0 (Campaign exclusive)
@export var baseHealth : float = 1500.0 
@export var baseSpeed : float = 11.5 ## Character's base speed.

@export var desire : elm ## Current desire of a character.
@export var looking : face = face.RIGHT ## Where the character is looking. Decides animations and hitboxes.
@export var lastDir : face = face.RIGHT ## The last direction a character has moved, being left or right. Used to decide whether a turnaround should be triggered.
var isHittable : bool = true ## Hidden variable. Decides if the character can be hit or not.
const GRAVITY = 1250 ## Gravity of the characters.

# Refers
@onready var Animate : AnimatedSprite2D = $Sprite ## Animated Sprite for the character. Used to handle anims and frame data
@onready var SMP : StateMachine = $StateMachine ## State machine for the character.
var Gears : EntityGear ## Entity's weapon and passives
var Phase : EnemyPhaser ## An enemy's "brain", so to speak.
var Cont : PlayerController ## A player controller


func _ready():
	if get_tree().root.get_child(0).has_node("ControllerComponent"):
		Cont = $ControllerComponent
	if get_tree().root.get_child(0).has_node("GearComponent"):
		Gears = $GearComponent
	if get_tree().root.get_child(0).has_node("PhaseComponent"):
		Phase = $PhaseComponent

func _physics_process(_delta):
	move_and_slide()
