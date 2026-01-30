extends Marker2D

@export var asteroids: Array[PackedScene]

func add_asteroid():
	var random_asteroid_scene = asteroids.pick_random()
	var random_asteroid_instance = random_asteroid_scene.instantiate()
	var random_y = randf_range(87, 565)
	add_child(random_asteroid_instance)
	random_asteroid_instance.global_position.y = random_y
	pass

func _on_timer_timeout() -> void:
	add_asteroid()
