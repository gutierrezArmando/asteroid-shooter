extends Area2D

@export var min_speed: float
@export var max_speed: float
@export var min_rotation_speed: float
@export var max_rotation_speed: float


var random_speed
var random_rotation_speed

func _ready() -> void:
	random_speed = randf_range(min_speed,max_speed)
	random_rotation_speed = randf_range(min_rotation_speed,max_rotation_speed)
	

func _process(delta: float) -> void:
	position.x -= random_speed * delta
	rotation_degrees += random_rotation_speed * delta
	
func _on_area_entered(area: Area2D) -> void:
	var isPlayer = area.is_in_group("player")
	var isLaser = area.is_in_group("laser")
	if isPlayer or isLaser :
		queue_free()
