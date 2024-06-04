extends Node

var speed = 1;
var targetPool = ["な","に","ぬ","ね","の"];
var current_target = "hiragana";
var current_score = 0;

signal attack_fired(input);
signal kana_button_pressed(kana);
signal kana_destroyed();
signal kana_got_through();
signal game_over();
signal change_scene(scene);
