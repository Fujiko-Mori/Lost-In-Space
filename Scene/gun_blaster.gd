extends CharacterBody2D
var bullet_path=preload("res://Scene/Bullet.tscn")
   



func _physics_process(delta) :
	var pos=get_global_mouse_position()
	look_at(get_global_mouse_position())
	if pos.x>0:
		$Gun.flip_v=true
	else:
		$Gun.flip_v=false
	if Input.is_action_just_pressed("left_click"):
		fire()

func fire():
	var bullet=bullet_path.instantiate()
	bullet.dir=rotation
	bullet.pos=$BoutDuCanon.global_position
	bullet.rota=global_rotation
	get_parent().add_child(bullet)
