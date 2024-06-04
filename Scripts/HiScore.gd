extends Label

@export var scoreKey:String;

var config = ConfigFile.new();

# Called when the node enters the scene tree for the first time.
func _ready():
	# Load data from a file.
	var err = config.load("user://scores.cfg")

	# If the file didn't load, ignore it.
	if err != OK:
		return
		
	text = str(config.get_value("scores", scoreKey, 0));
