extends Area2D
class_name Hurtbox

var damage : float
var requiredConfidence : float
var returnsConfidence : float

@onready var Shape = $Shape
var active : bool
var hurtTime : float
var sentKnockback : Vector2

func _ready():
	hurtTime = get_parent().stunsFor
	damage = get_parent().damage
	requiredConfidence = get_parent().requiredConfidence
	returnsConfidence = get_parent().returnsConfidence

func _physics_process(delta):
	sentKnockback.x = get_parent().knockback.x * 1000 * get_parent().Player.looking * delta
	sentKnockback.y = get_parent().knockback.y * 1000 * delta
	self.scale.x = get_owner().looking
	if active:
		Shape.disabled = false
		Shape.visible = true
		position = get_owner().position
	else:
		Shape.disabled = true
		Shape.visible = false
	
	var hitting = get_overlapping_bodies()
	
	if hitting:
		for victim in hitting:
			if victim.is_in_group("Characters") and victim != self.get_owner():
				var theoryHP = victim.curHP
				victim.take_damage(damage, sentKnockback, hurtTime)
				Shape.disabled=true
				if victim.curHP < theoryHP:
					get_owner().confidence += get_parent().returnsConfidence
				break
			else:
				print("ignored "+ str(victim) +" (Is either floor or self)")
