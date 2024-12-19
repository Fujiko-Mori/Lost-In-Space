extends CharacterBody2D
class_name Ennemy

@onready var target=$"../Character"
@onready var Anima=get_node("AnimatedSprite2D")



var H_mvt : float = 0.0
var V_mvt : float = 0.0
var speed : float = 50
var COVID : float = 50.0

var facing_direction := Vector2.DOWN

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _process(delta: float) -> void:
	var direction=(target.position-position).normalized()

#Move Animation 1.0
	var FACING = Vector2(abs(direction.x),abs(direction.y))
	if FACING.min_axis_index()==1:
		if direction.x>0:
			Anima.play("Idle Right")
		if direction.x<0:
			Anima.play("Idle Left")
	else:
		if direction.y>0:
			Anima.play("Idle Face")
		if direction.y<0:
			Anima.play("Idle Back")
	#Pour savoir où on regarde pour l'overlap de l'arme
	if velocity != Vector2.ZERO:
		facing_direction = velocity
	
	#Pour mettre le perso en Idle quand il bouge pas vers la direction où il regarde
	if (velocity == Vector2(0,0)):
		match(facing_direction):
			Vector2.RIGHT : Anima.play("Idle Right")
			Vector2.LEFT : Anima.play("Idle Left")
			Vector2.DOWN : Anima.play("Idle Face")
			Vector2.UP : Anima.play("Idle Back")
	velocity=direction.normalized()*speed
	
	if((target.position-position).length()>COVID):
		move_and_slide()
