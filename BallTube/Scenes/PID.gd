extends Node

onready var Machine = get_parent().get_node("Tube")

export var KP = 0.0
export var KI = 0.0
export var KD = 0.0

export var Max_MV = 20.0
export var Min_MV = 0.0

var pv = 0.0
var mv = 0.0
var sp = 0.0
var integral = 0.0
var lastError = 0.0
var isOn = false

signal new_mv(MV,P,I,D)


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if isOn:
		pv = Machine.GetPV()
		sp =Machine.GetSP()
		var error = sp-pv
		
		integral += ((error+lastError)/2.0)*(KI/100.0)*delta
		integral = max(integral,0)
		if KI==0:
			integral = 0
		
		var P = error*KP/100.0
		var I = integral
		var D = (error-lastError)/delta*KD/100.0
		
		mv = clamp(P+I+D,Min_MV,Max_MV)
		
		Machine.SetMV(mv)
		emit_signal("new_mv",mv,P,I,D)
		lastError = error
	else:
		Machine.SetMV(0)
		emit_signal("new_mv",0,0,0,0)
#		integral = 0
		lastError = 0
#	print(str(mv)+"   "+str(Machine.get_node("Ball").velocity.y)+"   "+str(Machine.get_node("Ball").grav))

