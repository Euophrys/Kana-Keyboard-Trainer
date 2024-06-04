extends Button

@export var outputField: Label;

# Called when the node enters the scene tree for the first time.
func _pressed():
	var length = outputField.text.length();
	
	if (length > 0):
		outputField.text = outputField.text.substr(0, length - 1);
