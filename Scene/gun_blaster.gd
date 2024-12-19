extends CharacterBody2D
@onready var bullet_path=preload("res://Scene/Bullet.tscn")
   
var is_ready = true


func _physics_process(delta) :
	var pos=get_global_mouse_position()
	look_at(get_global_mouse_position())
	if pos.x>0:
		$Gun.flip_v=true
	else:
		$Gun.flip_v=false
	if Input.is_action_just_pressed("left_click") and is_ready:
		fire()
		is_ready=false
		$Cooldown.start()
		

func fire():
	var bullet=bullet_path.instantiate()
	bullet.dir=rotation
	bullet.pos=$BoutDuCanon.global_position
	bullet.rota=global_rotation
	#Solution TRES NUL. La bullet était en child du player qui bouge, donc la bullet bouge aussi
	#J'ai donc cherché le parent du parent, donc le parent du joeur, le niveau ici... 
	#Ce patch est circonstenciel, j'ai rien trouvé pour éviter ce problème !
	get_parent().get_parent().add_child(bullet)


func _on_cooldown_timeout() -> void:
	is_ready=true
