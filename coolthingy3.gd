extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	velocity.x = 20
	velocity.y = 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
