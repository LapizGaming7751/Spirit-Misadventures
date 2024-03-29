extends State

var hurtTime : float
var knockbackTake : Vector2
var frameProg : float

func Enter():
	hurtTime = Player.hurt
	knockbackTake = Player.knockbackTaken
	
	Player.curHP -= Player.damageTaken
	if Player.curHP > Player.maxHP:
		Player.curHP = Player.maxHP
	elif Player.curHP < 0:
		Player.curHP = 0

func PhysicsUpdate(delta):
	Player.Anims.play("hurt")
	hurtTime -= delta
	
	if hurtTime >= 0.0:
		Player.velocity = knockbackTake
	
	Player.hurt = hurtTime
	
	if hurtTime <= 0:
		Player.Anims.play("default")
		Player.damageTaken = 0.0
		parent.transit("Idle")
		print("I'm out of stun!")
