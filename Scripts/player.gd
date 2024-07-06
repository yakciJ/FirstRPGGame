extends CharacterBody2D


const SPEED = 80.0
@onready var animated_sprite_2d = $AnimatedSprite2D
var directionIdle = "left"

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	if direction.x == 0 and direction.y == 0:
		match directionIdle:
			"leftRight":
				animated_sprite_2d.play("idleRightAndLeft")
			"up":
				animated_sprite_2d.play("idleBack")
			"down":
				animated_sprite_2d.play("idleFront")			
	elif direction.x != 0:
		if direction.x > 0:
			animated_sprite_2d.play("moveLeftAndRight")
			animated_sprite_2d.flip_h = false;
			directionIdle = "leftRight"
		elif direction.x < 0:
			animated_sprite_2d.play("moveLeftAndRight")
			animated_sprite_2d.flip_h = true;
			directionIdle = "leftRight"
	else:
		if direction.y > 0:
			animated_sprite_2d.play("moveDown")
			directionIdle = "down"
		elif direction.y < 0:
			animated_sprite_2d.play("moveUp")
			directionIdle = "up"
	move_and_slide()

