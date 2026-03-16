extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@export var PUSH_FORCE = 50.0 # La fuerza con la que empujas la caja

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var is_dead = false

func _physics_process(delta: float) -> void:
	if is_dead:
		return

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("movementLeft")
	else:
		animated_sprite_2d.play("jump")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if collider is RigidBody2D:
			var normal = collision.get_normal()
			
			if abs(normal.x) > 0.5 and abs(normal.y) < 0.5:
				var push_speed = 40.0 
				
				if direction != 0:
					collider.linear_velocity.x = direction * push_speed
				else:
					collider.linear_velocity.x = 0
