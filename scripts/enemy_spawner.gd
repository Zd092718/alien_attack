extends Node2D

signal enemy_spawned(enemy_insance)

var enemy_scene = preload("res://scenes/enemy.tscn")

@onready var spawn_positions = $SpawnPositions

func _on_timer_timeout():
	#spawn enemy at intervals
	spawn_enemy()
	
func spawn_enemy():
	#pick random spawn point
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_position = spawn_positions_array.pick_random()
	#instantiate enemy
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_spawn_position.global_position
	emit_signal("enemy_spawned", enemy_instance)
