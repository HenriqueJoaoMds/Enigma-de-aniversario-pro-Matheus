extends Node2D

func _ready():
	OS.set_window_title("jooj")
	get_node("Botoes base").connect("botaoApertado", self, "quandoBotaoApertado")

func quandoBotaoApertado():
	get_tree().change_scene("res://GoodEndingScreen.tscn")
