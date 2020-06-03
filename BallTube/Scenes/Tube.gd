extends StaticBody2D


var isOn = false
onready var LED = $Led
export var setpoint = 20.0
export var mv = 0.0

const MAX_SP_Y = 900


# Called when the node enters the scene tree for the first time.
func _ready():
	Turn(true)
	pass # Replace with function body.

func Turn(on:bool):
	if(on):		
		pass
	else:
		pass
	isOn = on
	LED.frame = int(on)


func map(x, in_min, in_max, out_min, out_max):
	return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min


func SetHeliceSpeed(value:float):
	$Ball.inpulse = value;
	pass

func GetBallPostion():
	var pos = $Ball.position.y	
	pos = max(0, map(pos,328,-600,0,90))
	return pos
	

func _physics_process(delta):
	$SP_tag.position.y = -1.0*max(min(10.0*setpoint,MAX_SP_Y),0)
	$Helice.speed = max(min(720.0,$Ball.inpulse*180.0),0) 

# --- Default machine params ----

func GetPV():
	return GetBallPostion()
	pass

func GetSP():
	return setpoint
	pass
	
func SetMV(value:float):
	SetHeliceSpeed(value)
	pass


