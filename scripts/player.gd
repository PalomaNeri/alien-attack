extends CharacterBody2D

var speed = 300

var laser_scene = preload("res://scenes/laser.tscn")

@onready var laser_container = $LaserContainer

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	velocity = Vector2(0,0)

	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed

	move_and_slide()

	var screen_size = get_viewport_rect().size

	global_position = global_position.clamp(Vector2(0,0), screen_size)
	#print(global_position) # this is the position of the node that the script (player) is attached to

func shoot():
	var laser_instance = laser_scene.instantiate()
	laser_container.add_child(laser_instance)
	laser_instance.global_position = global_position
	laser_instance.global_position.x += 65
