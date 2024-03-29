extends State

var breakTime : float
@export var breakUpTime : float = 5.0

func Enter():
	breakTime = breakUpTime

func PhysicsUpdate(delta):
	Player.Anims.play("hurt")
	breakTime -= delta
	
	if breakTime >= 0.0:
		Player.velocity.x += Player.velocity.x * -clamp(breakTime, 0.0, 0.3)
		Player.velocity.y += Player.GRAVITY * delta
	if breakTime <= 0:
		Player.Anims.play("default")
		parent.transit("Idle")
		Player.confidence = Player.maxConfidence / 2
		print("I'm out of Confidence Break!")
