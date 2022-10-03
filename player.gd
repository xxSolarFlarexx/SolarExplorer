extends RigidBody2D
signal interacted
export (int) var engine_power
export (int) var spin_power

var thrust = Vector2()
var health = 100
var whichplanet = ""
var rotation_dir = 0

func _process(delta):
	#$Camera2D/CanvasLayer/ProgressBar.value = health
	get_input()

func get_input():
	thrust = Vector2()
	rotation_dir = 0
	if Input.is_action_pressed("Thrust"):
		thrust = Vector2(engine_power, 0)
	if Input.is_action_pressed("RotateLeft"):
		rotation_dir -= 1
	if Input.is_action_pressed("RotateRight"):
		rotation_dir +=1
func _integrate_forces(physics_state):
	set_applied_force(thrust.rotated(rotation))
	set_applied_torque(spin_power * rotation_dir)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _ready():
	#apply_impulse(Vector2(-2000, 0), Vector2(-2000, 0))
	pass

func _on_AsteroidSensor_body_entered(body):
	print(body)
	if body == Player:
		health -= 20
		$Camera2D/CanvasLayer/ProgressBar.value -= 20

func _on_Button_pressed():
	emit_signal("interacted")
	if whichplanet == "Venus":
		$Camera2D/CanvasLayer/VenusTextureRect.visible = true
	if whichplanet == "Earth":
		$Camera2D/CanvasLayer/EarthTextureRect.visible = true
	if whichplanet == "Sun":
		$Camera2D/CanvasLayer/SunTextureRect.visible = true
	$Camera2D/CanvasLayer/Button.visible = false
	$Camera2D/CanvasLayer/Label.visible = false


#func _on_AsteroidSensor_area_entered(area):
	#print(area)
	#if area.is_in_group("asteroids"):
		#health -= 20
		#$Camera2D/CanvasLayer/ProgressBar.value -= 20


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		whichplanet = "Venus"
		print("entered")
		$Camera2D/CanvasLayer/Button.visible = true
		$Camera2D/CanvasLayer/Label.visible = true
func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		print("exited")
		$Camera2D/CanvasLayer/Button.visible = false
		$Camera2D/CanvasLayer/Label.visible = false
		$Camera2D/CanvasLayer/VenusTextureRect.visible = false 

func _on_EarthSurrounding_body_entered(body):
	if body.is_in_group("Player"):
		whichplanet = "Earth"
		$Camera2D/CanvasLayer/Button.visible = true
		$Camera2D/CanvasLayer/Label.visible = true
func _on_EarthSurrounding_body_exited(body):
	if body.is_in_group("Player"):
		$Camera2D/CanvasLayer/Button.visible = false
		$Camera2D/CanvasLayer/Label.visible = false
		$Camera2D/CanvasLayer/EarthTextureRect.visible = false

func set_arrow_degrees(degree):
	$Arrow.global_rotation_degrees = degree


func _on_SunSurrounding_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene("res://EmptyScreen.tscn")


func _on_SunSurrounding_body_exited(body):
	if body.is_in_group("Player"):
		$Camera2D/CanvasLayer/Button.visible = false
		$Camera2D/CanvasLayer/Label.visible = false
		$Camera2D/CanvasLayer/SunTextureRect.visible = false
