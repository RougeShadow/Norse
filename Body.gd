extends KinematicBody2D
const KICKOFF =  50000
var GRAVITY = 4
const DRAG = 0.05
const ACCELERATION =7
var motion = Vector2()
var on_air_time = 100
var jumping = false
var jump = 165
var walltime = 5
var timer = Timer.new()
var air = false
func _ready():
	timer = Timer.new()
	timer.set_wait_time(0.5)
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)

func _on_timer_timeout():

		
		print(5)
#jump height
func _physics_process(delta):
	
	motion.y += GRAVITY
	move_and_slide(motion)
	if is_on_floor() == false and is_on_ceiling() == false and is_on_wall() ==false:
		air = true
		
	if Input.is_key_pressed(KEY_D):
		print(motion.x)
		if is_on_floor() and is_on_wall() ==false:
			motion.x += ACCELERATION / 15
		if air == true:
			motion.x += ACCELERATION
 		move_and_slide(motion)
	if Input.is_key_pressed(KEY_A):
        motion.x -= ACCELERATION
 
        
	
        
	if is_on_floor():
		on_air_time = 0
		motion.y = 0
		
	motion.x -= motion.x * DRAG
	if motion.x <= 5 and motion.x >= 0 or  motion.x >= -5 and motion.x <= 0 :
	    motion.x = 0
	move_and_slide(motion,Vector2(0,-1))
	
	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		
		
		motion.y = -jump
		
	if Input.is_key_pressed(KEY_SPACE):
		$AnimatedSprite.play("jumpe")
		
	if is_on_wall():
		
		GRAVITY = 1
		
	if is_on_wall() == false:
		GRAVITY = 4
		
	if is_on_wall() and Input.is_key_pressed(KEY_SPACE):
		if motion.x > 0 and Input.is_key_pressed(KEY_D) :
				
				motion.x = -ACCELERATION*50
				motion.y = -jump/1.2
				
				
					
				
		
		if motion.x < 0 and Input.is_key_pressed(KEY_A):
			motion.x = ACCELERATION*50
			motion.y = -jump/1.2
		
	else:
		$AnimatedSprite.frame = 0
		$AnimatedSprite.stop()



		

func _on_Camera2D_move():
	pass # Replace with function body.
