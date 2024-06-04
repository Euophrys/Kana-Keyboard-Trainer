extends Button

@export var kana = ["あ", "い", "う", "え", "お"];
@export var outputField:Label;

var was_pressed = false;
var mouse_start = Vector2();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _pressed():
	mouse_start = get_viewport().get_mouse_position();
	was_pressed = true;
	Global.kana_button_pressed.emit(kana);

func _input(event):
	if (!was_pressed): return;
	
	if event is InputEventMouseButton:
		outputField.text = outputField.text + kana_from_points(mouse_start, get_viewport().get_mouse_position());
		was_pressed = false;

func kana_from_points(start:Vector2, end:Vector2):
	var dx = end.x - start.x;
	var dy = end.y - start.y;
	
	if (abs(dx) + abs(dy)) < 20:
		return kana[0];
	
	if (abs(dx) > abs(dy)):
		if (dx >= 0):
			# Right
			return kana[3];
		else:
			# Left
			return kana[1];
	else:
		if (dy < 0):
			# Up
			return kana[2];
		else:
			# Down
			return kana[4];
