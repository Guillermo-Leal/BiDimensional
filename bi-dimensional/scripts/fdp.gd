extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var is_dead = false

func _physics_process(delta: float) -> void:
	if is_dead:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction > 0:
		animated_sprite_2d.flip_h=false
	elif direction <0:
		animated_sprite_2d.flip_h=true
	
	
	if is_on_floor():
		if direction==0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("movementLeft")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
func die():
	is_dead = true
	velocity = Vector2.ZERO
	animated_sprite_2d.play("death")
	
func _on_animated_sprite_2d_animation_finished() -> void:
	print("Animacion terminada")
	if animated_sprite_2d.animation == "death":
		get_tree().reload_current_scene()
