extends Node2D

func _ready():
	get_node("Botoes base").connect("botaoApertado", self, "quandoBotaoApertado")

func quandoBotaoApertado():
	get_tree().change_scene("res://Fases/Fase 2/Fase 2.tscn")
