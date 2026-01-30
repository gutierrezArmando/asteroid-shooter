extends Marker2D

@export var big_asteroid_scene: PackedScene

func add_asteroid():
	var big_asteroid_instance = big_asteroid_scene.instantiate()
	var random_y = randf_range(87, 565)
	add_child(big_asteroid_instance)
	big_asteroid_instance.global_position.y = random_y
	

func _on_timer_timeout() -> void:
	add_asteroid()
