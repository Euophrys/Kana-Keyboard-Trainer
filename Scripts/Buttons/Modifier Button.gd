extends Button

const validDakuten = "かきくけこさしすせそたちつてとはひふへほう";
const afterDakuten = "がぎぐげござじずぜぞだぢづでどばびぶべぼゔ";
const validHandakuten = "はひふへほばびぶべぼ";
const afterHandakuten = "ぱぴぷぺぽぱぴぷぺぽ";
const validSmall = "つやゆよあいうえお";
const afterSmall = "っゃゅょぁぃぅぇぉ";

@export var outputField = Label;

var was_pressed = false;
var mouse_start = Vector2();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _pressed():
	mouse_start = get_viewport().get_mouse_position();
	was_pressed = true;

func _input(event):
	if (!was_pressed): return;
	
	if event is InputEventMouseButton:
		was_pressed = false;
		
		if (outputField.text.length() < 1): return;
		alter_from_points(mouse_start, get_viewport().get_mouse_position());

func alter_from_points(start:Vector2, end:Vector2):
	var kana = outputField.text.right(1);
	var dx = end.x - start.x;
	var dy = end.y - start.y;
	var index = -1;
	
	if (abs(dx) + abs(dy)) < 20:
		index = validDakuten.find(kana);
		if (index >= 0):
			return alter_to(afterDakuten[index]);
			
		index = validHandakuten.find(kana);
		if (index >= 0):
			return alter_to(afterHandakuten[index]);
		
		index = afterDakuten.find(kana);
		if (index >= 0):
			return alter_to(validDakuten[index]);
			
		index = afterHandakuten.find(kana);
		if (index >= 0):
			return alter_to(validHandakuten[index]);
			
	if (abs(dx) > abs(dy)):
		if (dx >= 0):
			# Right
			index = validHandakuten.find(kana);
			if (index >= 0):
				alter_to(afterHandakuten[index]);
		else:
			# Left
			index = validDakuten.find(kana);
			if (index >= 0):
				alter_to(afterDakuten[index]);
	else:
		if (dy < 0):
			# Up
			return;
		else:
			# Down
			index = validSmall.find(kana);
			if (index >= 0):
				return alter_to(afterSmall[index]);
			
			index = afterSmall.find(kana);
			if (index >= 0):
				return alter_to(validSmall[index]);

func alter_to(kana:String):
	outputField.text = outputField.text.substr(0, outputField.text.length() - 1) + kana;
