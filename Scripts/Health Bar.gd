extends ColorRect

@export var healthText:Label;

const maxHealth:float = 10;
var currentHealth:float = maxHealth;
var healthLostParticles = preload("res://lost_health_particles.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.kana_got_through.connect(take_damage);
	
func take_damage():
	currentHealth -= 1;
	healthText.text = "%d / %d" % [currentHealth, maxHealth];
	anchor_right = currentHealth / maxHealth;
	
	#spawn particles
	var particles:CPUParticles2D = healthLostParticles.instantiate();
	particles.emission_rect_extents.y = size.y / 2.0;
	add_child(particles);
	particles.position.x = size.x;
	particles.position.y = size.y / 2.0;
	
	if (currentHealth == 0):
		Global.game_over.emit();
		Global.kana_got_through.disconnect(take_damage);
