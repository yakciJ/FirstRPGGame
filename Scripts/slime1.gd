extends CharacterBody2D


const SPEED = 20.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var player = null


func _physics_process(delta):
	var motion = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position) * SPEED
		move_and_slide()


func _on_area_of_sight_body_entered(body):
	player = body
	pass # Replace with function body.
