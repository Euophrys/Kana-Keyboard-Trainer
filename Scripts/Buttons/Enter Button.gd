extends Button

@export var outputField = Label;

# Called when the node enters the scene tree for the first time.
func _pressed():
	Global.attack_fired.emit(outputField.text);
	outputField.text = "";
