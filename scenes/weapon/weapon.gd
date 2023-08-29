extends Area2D

@onready var target = get_tree().get_first_node_in_group("target")

var tween
var rate = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	rate = randf_range(0.0, 1)
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var target_position = target.global_position + (random_direction * 40 * rate)

	var direction = (target_position - global_position).normalized()
	var angle = direction.angle() + deg_to_rad(90)
	rotation = angle

	tween = target.create_tween()
	tween.tween_property(self, "position", target_position, 0.3).set_trans(Tween.TRANS_LINEAR)
	tween.tween_callback(func(): 
		end()
	)
	tween.play()

func short_angle_dist(from, to):
	var max_angle = TAU
	var difference = fmod(to - from, max_angle)
	return fmod(2 * difference, max_angle) - difference
		

func end():
	if rate < 0.03:
		print("Critical!!!")
	$AnimationPlayer.play("hit")
	
