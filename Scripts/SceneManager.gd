extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.change_scene.connect(change_scene);

func change_scene(scene):
	for child in get_children():
		remove_child(child);
	add_child(scene.instantiate());
