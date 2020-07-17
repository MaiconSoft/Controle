extends KinematicBody2D

const WALK_FORCE = 600
const WALK_MAX_SPEED = 200
const STOP_FORCE = 1300
const JUMP_SPEED = 200

var velocity = Vector2()
var inpulse = 0;
var grav = 0.0

onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func ApplyImpulse(pulse:float):
	inpulse = pulse


func _physics_process(delta):
	# Horizontal movement code. First, get the player's input.
#	var walk = WALK_FORCE * (Input.get_action_strength("move_right") - Input.get_action_strength("move_left"))
	# Slow down the player if they're not trying to move.
#	if abs(walk) < WALK_FORCE * 0.2:
#		# The velocity, slowed down a bit, and then reassigned.
#		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
#	else:
#	velocity.x += walk * delta
#	# Clamp to the maximum horizontal movement speed.
#	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)
	velocity.x  = 0
	# Vertical movement code. Apply gravity.
	#grav = gravity * delta
	velocity.y += gravity * delta - inpulse

	# Move based on the velocity and snap to the ground.
#	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)
	
	velocity = move_and_slide(velocity, Vector2.DOWN)

	# Check for jumping. is_on_floor() must be called after movement code.
#	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
#		velocity.y = -JUMP_SPEED
#
#	if Input.is_action_just_pressed("ui_up"):
#		inpulse += 1.0
#
#	if Input.is_action_just_pressed("ui_down"):		
#		inpulse = max(0,inpulse-1.0)
