extends GridContainer

@export var a_hint = Label;
@export var i_hint = Label;
@export var u_hint = Label;
@export var e_hint = Label;
@export var o_hint = Label;

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.kana_button_pressed.connect(updateHints);
	
func updateHints(kana):
	a_hint.text = kana[0];
	i_hint.text = kana[1];
	u_hint.text = kana[2];
	e_hint.text = kana[3];
	o_hint.text = kana[4];
