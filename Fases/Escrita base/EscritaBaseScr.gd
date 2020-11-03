extends Node2D

export var NumeroDaFase : String
export var TextoPrincipal : String

func _ready():
	get_node("RichTextLabel").text = "Fase: " + NumeroDaFase
	get_node("RichTextLabel2").text = TextoPrincipal
