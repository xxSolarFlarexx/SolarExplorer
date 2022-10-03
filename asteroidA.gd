extends KinematicBody2D


var rng = RandomNumberGenerator.new()
var speed = 20
var velocity = Vector2()
var rotation_dir = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	velocity = Vector2()
	velocity.x += rand_range(-1.5, 1.5)
	velocity.y += rand_range(-1.5, 1.5)
	rotation_dir = rand_range(0, 180)
	velocity = velocity.normalized() * speed
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
