extends CharacterBody2D


var H_mvt : float = 0.0
var V_mvt : float = 0.0
var speed : float = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _process(delta: float) -> void:
	H_mvt=-int(Input.is_action_pressed("ui_left"))+int(Input.is_action_pressed("ui_right"))
	V_mvt=-int(Input.is_action_pressed("ui_up"))+int(Input.is_action_pressed("ui_down"))
	velocity.x=H_mvt
	velocity.y=V_mvt
	velocity=velocity.normalized()*speed
	move_and_slide()

#func _input(event: InputEvent) -> void:
