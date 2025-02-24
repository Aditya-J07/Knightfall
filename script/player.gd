extends CharacterBody2D


const NORMALSPEED = 150.0
const JUMP_VELOCITY = -300.0

const dashspeed = 680.0
const dashlength = 0.1

var footstepframes : Array = [1,5,9,13]

@onready var dash: Node = $"Dash"
@onready var sfx_jump: AudioStreamPlayer2D = $sfx_jump
@onready var sfx_run: AudioStreamPlayer2D = $sfx_run


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	var SPEED = dashspeed if dash.is_dashing() else NORMALSPEED
	if Input.is_action_just_pressed("dash"):
		dash.start_dash(dashlength)
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sfx_jump.play()
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	#to flip
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	#play animation
	if is_on_floor():
		if direction == 0 and SPEED != 680.0:
			animated_sprite_2d.play("idle")
		elif direction !=0 and SPEED != 680.0:
			animated_sprite_2d.play("run")
			
		else:
			animated_sprite_2d.play("dash")
	else:
		animated_sprite_2d.play("jump") 
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	

 

func _on_animated_sprite_2d_frame_changed() -> void:
	if animated_sprite_2d.animation == "idle" : return
	if animated_sprite_2d.frame in footstepframes : sfx_run.play()
	
