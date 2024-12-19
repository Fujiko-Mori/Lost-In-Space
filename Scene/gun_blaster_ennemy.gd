extends CharacterBody2D
@onready var bullet_path=preload("res://Scene/Bullet.tscn")
@onready var target=$"../../Character"
var is_ready = true
var on_shoot : float = 200.0


func _physics_process(delta) :
	var pos=(target.position)
	look_at(pos)
	get_parent().position.x
	if get_parent().position.x-pos.x>0:
		$Gun.flip_v=true
	else:
		$Gun.flip_v=false
	#print((target.position-get_parent().position).length())
	if ((target.position-get_parent().position).length()<on_shoot and is_ready):
		fire()
		is_ready=false
		$Calmdown.start()

func fire():
	var bullet=bullet_path.instantiate()
	bullet.dir=rotation
	bullet.pos=$BoutDuCanon.global_position
	bullet.rota=global_rotation
	#Solution TRES NUL. La bullet était en child du player qui bouge, donc la bullet bouge aussi
	#J'ai donc cherché le parent du parent, donc le parent du joeur, le niveau ici... 
	#Ce patch est circonstenciel, j'ai rien trouvé pour éviter ce problème !
	get_parent().get_parent().add_child(bullet)


func _on_calmdown_timeout() -> void:
	is_ready=true
