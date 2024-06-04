extends Label

@export var display = "";
@export var weakness = "";
@export var speed = 60;

func _ready():
	text = display;

func _process(delta):
	position.y += speed * delta;
	
	if position.y > get_parent().size.y * 0.625:
		Global.kana_got_through.emit();
		get_parent().remove_child(self);
		queue_free();

func setSpeed(val):
	speed = val;
