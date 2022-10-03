extends Node2D

var Timerstarted = false
var PointPlanet = ""
var PlanetList = []
var PlanetListIndex = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	PlanetList = [$Earth, $Venus, $Sun, "aaaaaaa"]
	PointPlanet = $Earth
	$Timer.stop()
	Player.health = 100
func _process(delta):
	$Player/Camera2D/CanvasLayer/ProgressBar.value = Player.health
	if Player.health <= 0 and Timerstarted == false:
		$Timer.start()
		Timerstarted = true
	var Y = PointPlanet.position.y - $Player.position.y
	var X = PointPlanet.position.x - $Player.position.x
	var a = atan2(Y, X)
	var degree = a * 180/PI
	$Player.set_arrow_degrees(degree)
	print(Player.whichplanet)
	if Player.whichplanet == "Earth":
		PointPlanet = $Venus
		print(PointPlanet)

func _on_Area2D_body_entered(body):
	$Button.visible = true


func _on_Area2D_body_exited(body):
	$Button.visible = false
	$Label.visible = false


func _on_Button_pressed():
	$Label.visible = true


func _on_Timer_timeout():
	print("timer off")
	get_tree().change_scene("res://restart.tscn")



func _on_Player_interacted():
	PlanetListIndex += 1
	PointPlanet = PlanetList[PlanetListIndex]


func _on_SunSurrounding_body_exited(body):
	pass # Replace with function body.
