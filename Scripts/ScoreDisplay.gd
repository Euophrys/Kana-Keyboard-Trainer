extends Label

var streak = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.kana_destroyed.connect(increment_score);
	Global.kana_got_through.connect(reset_streak);
	Global.current_score = 0;
	
func increment_score():
	Global.current_score += 1;
	streak += 1;
	update_text();
	
func reset_streak():
	streak = 0;
	update_text();
	
func update_text():
	if (streak > 1):
		text = "Score: %d\nStreak: %d" % [Global.current_score, streak];
	else:
		text = "Score: %d" % Global.current_score;
