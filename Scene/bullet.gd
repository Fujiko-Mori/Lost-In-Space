extends CharacterBody2D
var pos:Vector2
var rota:float
var dir : float
var speed = 466

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position=pos
	global_rotation=rota


func _physics_process(delta):
	velocity=Vector2(speed,0).rotated(dir)
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		queue_free()
	move_and_slide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
