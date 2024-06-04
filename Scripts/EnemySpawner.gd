extends Control

@export var particleParent:Control;

var interval = 2;
var current_interval = 0;
const enemy_scene = preload("res://Enemy.tscn");
const death_sparks = preload("res://DeathSparks.tscn")
var rng = RandomNumberGenerator.new();

func _ready():
	Global.attack_fired.connect(_on_attack);
	interval = interval * (1 / Global.speed);
	current_interval = interval / 2;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_interval += delta;
	
	if (current_interval > interval): 
		current_interval -= interval;
		_spawn_enemy();
		
func _spawn_enemy():
	var enemy = enemy_scene.instantiate();
	enemy.speed = 60 * Global.speed;
	var target = Global.targetPool.pick_random();
	if target is String:
		enemy.display = target;
		enemy.weakness = target;
	else:
		enemy.display = target[0];
		enemy.weakness = target[1];
	add_child(enemy);
	enemy.position.x = (size.x - 120) * rng.randf();
	enemy.position.y = -50;

func _on_attack(input):
	if (input == "" || get_child_count() == 0): return;
	
	for enemy in get_children() as Array[Label]:
		if (enemy.weakness == input):
			var particles:CPUParticles2D = death_sparks.instantiate();
			particleParent.add_child(particles);
			particles.set_global_position(enemy.get_global_position() + (enemy.size / 2.0));
			remove_child(enemy);
			enemy.queue_free();
			Global.kana_destroyed.emit();
			break;
