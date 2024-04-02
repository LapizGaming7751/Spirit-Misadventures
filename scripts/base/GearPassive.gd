extends Gear
class_name Passive

@export var active : bool

func _ready():
	Entity = get_owner()
	Inventory = get_parent()
	print(str(Entity)+" "+name)

func Effect():
	pass
