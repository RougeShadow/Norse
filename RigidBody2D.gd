extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	 # Replace with function body.
func _process(delta):
	if Input.is_key_pressed(KEY_W):
		self.position.y-=5
	elif Input.is_key_pressed(KEY_D):
		
			$AnimatedSprite.play("Run_L")
			self.position.x+=5
	elif Input.is_key_pressed(KEY_SHIFT):
			self.position.x+=10
	elif Input.is_key_pressed(KEY_S):
		self.position.y+=5
	elif Input.is_key_pressed(KEY_A):
		$AnimatedSprite.play("run")
		self.position.x-=5
		
		if Input.is_key_pressed(KEY_SHIFT):
					self.position.x-=10
					$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.stop()