extends Button

@export var targetScenePath:String;
var targetScene;

func _ready():
	targetScene = load(targetScenePath);
	
# Called when the node enters the scene tree for the first time.
func _pressed():
	Global.change_scene.emit(targetScene);
