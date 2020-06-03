extends Sprite


var state = false

signal state_changed(new_state)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func updateGraphics():
	frame = int(state)

func Click():
	state = not state
	updateGraphics()
	emit_signal("state_changed",state)
	pass

func _on_HitBox_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		Click()
