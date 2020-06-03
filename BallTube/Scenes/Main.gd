extends Node2D


func _ready():
	yield(get_tree(), "idle_frame")
	var PID = Storage.LoadProperty("PID",[$PID.KP,$PID.KI,$PID.KD])
	
	$UI/edP.text = str(PID[0])
	$UI/edI.text = str(PID[1])
	$UI/edD.text = str(PID[2])

func savPID(P,I,D):	
	Storage.StoreProperty("PID",[P,I,D])

	
func _on_btnSetPID_pressed():
	$PID.KP = float($UI/edP.text)
	$PID.KI = float($UI/edI.text)
	$PID.KD = float($UI/edD.text)
	savPID($PID.KP,$PID.KI,$PID.KD)


func _physics_process(delta):
	var pv = $Tube.GetPV()
	var sp = $Tube.GetSP()
	$UI/lbPV.text = str(round(pv))
	$UI/lbSP.text = str(round(sp))


func _on_PID_new_mv(MV, P, I, D):
	$UI/Debug/P.text = "P  = "+str(P)
	$UI/Debug/I.text = "I  = "+str(I)
	$UI/Debug/D.text = "D  = "+str(D)
	$UI/Debug/MV.text ="MV = "+str(MV)
	pass # Replace with function body.


func _on_on_off_state_changed(new_state):
	$PID.isOn = new_state
	pass # Replace with function body.
