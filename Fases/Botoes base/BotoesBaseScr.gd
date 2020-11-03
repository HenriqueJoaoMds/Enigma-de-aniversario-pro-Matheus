extends Node2D

export var Resposta : String
export var VaiPra : String
export var Dica : String

var acendendo : bool = false
var apagando : bool = false
var opacidade : float = 0.0

var pediuAjuda : bool = false
var mensagemDeAjudaEstaAparecendo : bool = false

onready var timer : Timer = get_node("Timer")
onready var mensagemDeErro : Label = get_node("Label2")
onready var opcoesDeAjuda : Control = get_node("OpcoesDeAjuda")
onready var mensagemDeAjuda : Label = get_node("MensagemDeAjuda")
onready var animacoes : AnimationPlayer = get_node("AnimationPlayer")

signal botaoApertado
signal botaoDeAjudaApertado
signal negouAjuda
signal aceitouAjuda

func _ready():
	mensagemDeAjuda.text = Dica

func _process(_delta):
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
		var inputDeTexto : TextEdit = get_node("TextEdit")
		if inputDeTexto.text == Resposta:
			emit_signal("botaoApertado")
		elif inputDeTexto.text == "":
			mensagemDeErro.text = "A caixa de input está vazia."
			acendendo = true
		else:
			mensagemDeErro.text = "Resposta errada."
			acendendo = true

func _on_Timer_timeout():
	print("a")
	apagando = true

func _on_BotaoDeAjuda_button_up():
	emit_signal("botaoDeAjudaApertado")
	
	if pediuAjuda == false:
		if mensagemDeAjudaEstaAparecendo == false:
			mensagemDeAjudaEstaAparecendo = true
			animacoes.play("ConfirmarAjuda")

func _on_BotaoNao_button_up():
	if pediuAjuda == false:
		if animacoes.is_playing() == false:
			emit_signal("negouAjuda")
			animacoes.play("AjudaNegada")
			mensagemDeAjudaEstaAparecendo = false

func _on_BotaoSim_button_up():
	if pediuAjuda == false:
		emit_signal("aceitouAjuda")
		pediuAjuda = true
		animacoes.play("AjudaConfirmada")
