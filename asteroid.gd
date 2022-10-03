extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _healthdecrease():
	Player.health -= 15

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
	velocity = velocity.normalized() * speed
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	move_and_collide(velocity * delta)
	collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

signal asteroidsensed
func _on_Area2D_area_entered(area):
	print("collision")


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		print("body collision")
		Player.health -= 20
