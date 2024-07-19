extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
var animChange = false
const SPEED = 20.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var player = null
var defaultPosition

func _ready():
	defaultPosition = position

func _physics_process(delta):
	if player:
		velocity = position.direction_to(player.position) * SPEED
		move_and_slide()
	elif abs((position-defaultPosition))<Vector2(0.1,0.1):
		animated_sprite_2d.play("idleFront")
		return
	else:
		velocity = position.direction_to(defaultPosition) * SPEED * delta
		move_and_slide()
	if velocity != Vector2(0,0):
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				animated_sprite_2d.flip_h = false
			else: animated_sprite_2d.flip_h = true
			if animChange:
				animated_sprite_2d.play("moveLeftAndRight")
				animChange = false
		elif velocity.y > 0: 
			if animChange:
				animated_sprite_2d.play("moveFront")
				animChange = false
		elif velocity.y < 0:
			if animChange:
				animated_sprite_2d.play("moveBack")
				animChange = false

		
func _on_area_of_sight_body_entered(body):
	player = body

func _on_area_of_sight_body_exited(body):
	player = null

func _on_animated_sprite_2d_animation_finished():
	animChange = true

