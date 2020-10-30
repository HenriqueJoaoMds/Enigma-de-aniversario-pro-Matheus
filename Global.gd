extends Node

var timer = Timer.new()
var segundos = 0

func _ready():
	timer.connect("timeout", self, "cicloDeTimer")
	timer.autostart = true
	timer.name = "Contador de segundos"
	add_child(timer)
	print(timer)

func cicloDeTimer():
	segundos += 1
