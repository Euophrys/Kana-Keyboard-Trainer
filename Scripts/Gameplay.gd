extends Control

var gameOverScreen = preload("res://game_over.tscn");
var config = ConfigFile.new();
var err = config.load("user://scores.cfg");

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game_over.connect(on_game_over);
	
func on_game_over():
	config.set_value("scores", Global.current_target, Global.current_score);
	config.save("user://scores.cfg");
	add_child(gameOverScreen.instantiate());
