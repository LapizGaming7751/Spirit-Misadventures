extends Gear
class_name Weapon

@export var baseDamage : float

var curDamage

func _ready():
	Entity = get_owner()
	Inventory = get_parent()
	print(str(Entity)+" "+name)

func Effect():
	pass