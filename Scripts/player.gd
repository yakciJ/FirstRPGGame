extends CharacterBody2D


const SPEED = 80.0
@onready var animated_sprite_2d = $AnimatedSprite2D
var directionRightLeft = true

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	if direction.x == 0:
		animated_sprite_2d.play("idleRightAndLeft")
	else:
		if direction.x > 0:
			animated_sprite_2d.play("moveLeftAndRight")
			animated_sprite_2d.flip_h = false;
			directionRightLeft = true
		elif direction.x < 0:
			animated_sprite_2d.play("moveLeftAndRight")
			animated_sprite_2d.flip_h = true;
			directionRightLeft = false
	move_and_slide()

