## Basic entity for Combat mode. This specific node class consists of stats and functions for characters.
extends CharacterBody2D
class_name CombatStat

# Enums
enum face{LEFT=-1,RIGHT=1} ## "Face" enum is used for variables using direction. Gives more context as opposed to using Bools.
## "Elemental" buffs for characters. 8 Desires in the game. None counter each other, only gives minor buffs.
enum elm{empty,joy,sorrow,vengeance,power,wealth,fame}

# Properties
## Character name built for different interactions between characters.
## Certain skills can check for character name before activating special interactions.
@export var characterName : String = "BasicChar" 

## Character's maximum health.
## An average character's health is 1500.0. Tankier can go to 2500.0, while the squishiest is 500.0 (Campaign exclusive)
@export var baseHealth : float = 1500.0 
@export var baseSpeed : float = 11.5 ## Character's base speed.
@export var baseJump : float = 25.0 ## Character's base jump height

@export var desire : elm ## Current desire of a character.
@export var looking : face = face.RIGHT ## Where the character is looking. Decides animations and hitboxes.
@export var lastDir : face = face.RIGHT ## The last direction a character has moved, being left or right. Used to decide whether a turnaround should be triggered.
var isHittable : bool = true ## Hidden variable. Decides if the character can be hit or not.
var maxConfidence : float = 100.0 ## Recommended variable to show in UI. Character resource for casting skills AND posture bar for block.
var curConfidence : float = 50.0 ## Initial amount of Confidence.
const GRAVITY = 1250 ## Gravity of the characters.

# Stats
var maxHealth : float
var curHealth : float
var curSpeed : float
var curDamage : float

# Refers
@onready var Gears : EntityGear ## Entity's weapon and passives
@onready var Phase : EnemyPhaser ## An enemy's "brain", so to speak.
@onready var Direc : PlayerController ## A player controller


func _ready():
#region Composition Assignment
	var compos : Dictionary = {}
	for components in get_children():
		if components is Component:
			compos[components.name] = components
	Gears = compos["GearComponent"]
	Phase = compos["PhaseComponent"]
	Direc = compos["MovementComponent"]
#endregion
#region Desire Settings
	match desire:
		elm.joy:
			maxHealth = baseHealth * 1.1
		elm.sorrow:
			curSpeed = baseSpeed * 1.1
		elm.wealth:
			maxHealth = baseHealth * 1.15
		elm.fame:
			curSpeed = baseSpeed * 1.15
			maxHealth = baseHealth * 0.95
		elm.power:
			curSpeed = baseSpeed * 0.95
		_:
			maxHealth = baseHealth
			curSpeed = baseSpeed
	curHealth = maxHealth
	print(maxHealth)
	print(curSpeed)
#endregion

func _physics_process(_delta):
	curConfidence = clamp(curConfidence, 0, maxConfidence)
	curHealth = clamp(curHealth, 0, maxHealth)
	
	if Direc.dir.x != 0:
		lastDir = int(Direc.dir.x)
	
	move_and_slide()
