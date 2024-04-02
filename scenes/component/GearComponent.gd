extends Component
class_name EntityGear

@export var CurrentWeapon : Weapon

var Entity : CharacterBody2D = get_parent()

var WeaponCollection : Dictionary
var PassiveCollection : Dictionary

func _ready():
	for item in get_children():
		if item is Weapon:
			WeaponCollection[item.name] = item
		if item is Passive:
			PassiveCollection[item.name] = item

func _physics_process(delta):
	for passive in PassiveCollection:
		if PassiveCollection[passive].active:
			PassiveCollection[passive].Effect()
	if CurrentWeapon:
		CurrentWeapon.Effect()
