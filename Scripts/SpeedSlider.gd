extends HSlider

func _ready():
	value = Global.speed;
	drag_ended.connect(on_drag);
	
func on_drag(changed):
	Global.speed = value;
