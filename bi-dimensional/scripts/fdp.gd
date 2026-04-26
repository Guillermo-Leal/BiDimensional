extends CharacterBody2D

@export var PUSH_FORCE = 50.0 # La fuerza con la que empujas la caja
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_izquierda: RayCast2D = $RayCastIzquierda
@onready var ray_cast_derecha: RayCast2D = $RayCastDerecha
@onready var mundo_blanco: Node2D = $"../MundoBlanco"
@onready var mundo_negro: Node2D = $"../MundoNegro"
const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var is_dead = false
var last_direction = 1
var change = false

func _physics_process(delta: float) -> void:
	if is_dead:
		return
		
	if Input.is_action_just_pressed("change"):
		change = !change
		var anim_actual = animated_sprite_2d.animation
		var anim = anim_actual
		cambiarAnim(anim)
		activar_mundo(mundo_blanco, !change)
		activar_mundo(mundo_negro, change)
			# Cambiar qué mundo "existe" para el player
		if change:
			collision_mask = 2
		else:
			collision_mask = 1
			
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	if direction != 0:
		last_direction = direction
		
	if change == false:
		if ray_cast_derecha.is_colliding():
			animated_sprite_2d.play("PushPullWhite")
		elif ray_cast_izquierda.is_colliding():
			animated_sprite_2d.play("PushPullWhite")
		elif is_on_floor():
			if direction != 0:
				if animated_sprite_2d.animation != "movementWhite":
					animated_sprite_2d.play("movementWhite")
			else:
				if animated_sprite_2d.animation != "idleWhite":
					animated_sprite_2d.play("idleWhite")
		else:
			if animated_sprite_2d.animation != "jumpWhite":
					animated_sprite_2d.play("jumpWhite")
	else: 
		if ray_cast_derecha.is_colliding():
			animated_sprite_2d.play("PushPullBlack")
		elif ray_cast_izquierda.is_colliding():
			animated_sprite_2d.play("PushPullBlack")
		elif is_on_floor():
			if direction != 0:
				if animated_sprite_2d.animation != "movementBlack":
					animated_sprite_2d.play("movementBlack")
			else:
				if animated_sprite_2d.animation != "idleBlack":
					animated_sprite_2d.play("idleBlack")
		else:
			if animated_sprite_2d.animation != "jumpBlack":
					animated_sprite_2d.play("jumpBlack")
	
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	for i in range(get_slide_collision_count()):
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

	move_and_slide()
	
func cambiarAnim(anim):
	var frame = animated_sprite_2d.frame
	var progreso = animated_sprite_2d.frame_progress


	animated_sprite_2d.play(anim)
	animated_sprite_2d.frame = frame
	animated_sprite_2d.frame_progress = progreso
	
func die():
	is_dead = true
	velocity = Vector2.ZERO
	if change == false:
		animated_sprite_2d.play("deathWhite")
	else:
		animated_sprite_2d.play("deathBlack")
	
func _on_animated_sprite_2d_animation_finished() -> void:
	print("Animacion terminada")
	if animated_sprite_2d.animation == "deathWhite" or animated_sprite_2d.animation =="deathBlack":
		activar_mundo(mundo_negro, !change)
		get_tree().reload_current_scene()
		
func activar_mundo(nodo, activo):
	if nodo is CanvasItem:
		nodo.visible = activo

	# opcional pero recomendado para rendimiento
	nodo.process_mode = Node.PROCESS_MODE_INHERIT if activo else Node.PROCESS_MODE_DISABLED

	for child in nodo.get_children():
		activar_mundo(child, activo)	
