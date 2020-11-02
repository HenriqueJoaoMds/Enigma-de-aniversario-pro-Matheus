extends Node

var timer : Timer = Timer.new()
var segundos : int = 0

var usuario : String = OS.get_user_data_dir().split("/")[2]

func _ready():
	timer.connect("timeout", self, "cicloDeTimer")
	timer.autostart = true
	timer.name = "Contador de segundos"
	add_child(timer)
	print(timer)

func cicloDeTimer() -> void:
	segundos += 1

func criarTxt(nome : String, texto : String):
	var nomeDaPasta : String = "Ah, finalmente, um jogador"
	
	var file : File = File.new()
	file.open("C:/Users/" + usuario + "/Desktop/" + nomeDaPasta + "/" + nome + ".txt", File.WRITE)
	file.store_string(texto)
	file.close()
