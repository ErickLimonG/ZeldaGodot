extends CharacterBody2D
@onready var animacion: AnimatedSprite2D = %animacion

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Handle jump.
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("ui_down"):
		velocity.y = -JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_side := Input.get_axis("ui_left", "ui_right")
	if direction_side:
		velocity.x = direction_side * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var direction := Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
