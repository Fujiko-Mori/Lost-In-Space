extends CharacterBody2D
class_name Character

@onready var Anima=get_node("AnimatedSprite2D")



var H_mvt : float = 0.0
var V_mvt : float = 0.0
var speed : float = 200
var facing_direction := Vector2.DOWN

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _process(delta: float) -> void:
	H_mvt=-int(Input.is_action_pressed("ui_left"))+int(Input.is_action_pressed("ui_right"))
	V_mvt=-int(Input.is_action_pressed("ui_up"))+int(Input.is_action_pressed("ui_down"))
	velocity.x=H_mvt
	velocity.y=V_mvt

#Move Animation 1.0
	match(velocity):
		Vector2.RIGHT : Anima.play("Idle Right")
		Vector2.LEFT : Anima.play("Idle Left")
		Vector2.DOWN : Anima.play("Idle Face")
		Vector2.UP : Anima.play("Idle Back")
	
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
	velocity=velocity.normalized()*speed
	
	#Script Du gun pour flip et être derrière
	var pos=get_global_mouse_position()
	if position.x-pos.x>0:
		$Blaster/Gun.flip_v=true
	else:
		$Blaster/Gun.flip_v=false

	move_and_slide()



#func _input(event: InputEvent) -> void:
