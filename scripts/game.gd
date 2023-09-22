extends Node2D

var lives = 3
var score = 0
var game_over_scene = preload("res://scenes/game_over_screen.tscn")

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI

func _ready():
	# sets score to zero on start
	hud.set_score_label(score)

func _on_deathzone_area_entered(area):
	# destroys enemies that pass player offscreen
	area.queue_free()


func _on_player_took_damage():
	#deduct lives and set lives left label
	lives -= 1
	hud.set_lives_left_label(lives)
	# check for death
	if lives == 0:
		player.die()
		#adds delay timer before displaying game over screen
		await get_tree().create_timer(1.5).timeout
		#instantiate game over scene and set score
		var gos_instance = game_over_scene.instantiate()
		gos_instance.set_score(score)
		ui.add_child(gos_instance)


func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)
	
func _on_enemy_died():
	#add score on enemy death
	score += 100
	hud.set_score_label(score)
