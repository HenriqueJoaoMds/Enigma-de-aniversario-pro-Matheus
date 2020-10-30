extends Node2D

export (String) var Resposta
export (String) var VaiPra

var acendendo = false
var apagando = false
var opacidade = 0

onready var timer = get_node("Timer")
onready var mensagemDeErro = get_node("Label2")

func _process(delta):
	if acendendo:
		opacidade += 0.1
		mensagemDeErro.modulate = Color(1, 1, 1, opacidade)
		if int(opacidade) == 1:
			acendendo = false
			timer.start()
	
	if apagando:
		opacidade -= 0.1
		mensagemDeErro.modulate = Color(1, 1, 1, opacidade)
		if int(opacidade) == -1:
			opacidade = 0
			apagando = false

func _on_Button_pressed():
	if !apagando and !acendendo and int(opacidade) == 0:
		var inputDeTexto = get_node("TextEdit")
		if inputDeTexto.text == Resposta:
			get_tree().change_scene(VaiPra)
		elif inputDeTexto.text == "":
			mensagemDeErro.text = "Você é estupido? Essa caixa é um input de texto."
			acendendo = true
		else:
			mensagemDeErro.text = "Caralho, sério?"
			acendendo = true

func _on_Timer_timeout():
	timer.stop()
	apagando = true
