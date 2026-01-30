extends CharacterBody2D
@export var speed:float
@export var laser_scene: PackedScene

func _physics_process(delta: float):
	if Input.is_action_just_pressed("shoot"):
		create_laser()
	process_inputs()
	move_and_slide()
	
func process_inputs():
	var y_input = Input.get_axis("up", "down")
	var x_input = Input.get_axis("move_left","move_right")
	#velocity.y = y_input * speed
	#velocity.x = x_input * 
	velocity = Vector2(x_input, y_input) * speed	
	
func create_laser():
	var laser_scene_instance = laser_scene.instantiate()
	#get_parent().add_child(laser_scene_instance)
	add_sibling(laser_scene_instance)
	laser_scene_instance.position = position


func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("asteroids"):
		queue_free()
