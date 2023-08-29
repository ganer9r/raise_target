extends Node

@export var basic_weapon_scene: PackedScene

@onready var target = get_tree().get_first_node_in_group("target") as Node2D

var SPAWN_RADIUS = 600


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if Input.is_action_pressed('click'):
		new_weapon()
		
func new_weapon():
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var spawn_position = target.global_position + (random_direction * SPAWN_RADIUS)

	var new_weapon = basic_weapon_scene.instantiate()
	new_weapon.global_position = spawn_position
	get_parent().add_child(new_weapon)
	
	
func _on_timer_timeout():
	new_weapon()
