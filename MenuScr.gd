extends Node2D

func _ready():
	var nomeDaPasta : String = "Ah, finalmente, um jogador"
	var pasta : String = "C:/Users/" + Global.usuario + "/Desktop/" + nomeDaPasta
	
	var diretorio : Directory = Directory.new()
	var diretorioExiste : bool = diretorio.dir_exists(pasta)
	if diretorioExiste == false:
		print("bunda")
		diretorio.make_dir(pasta)
		Global.criarTxt("Bem vindo", "Sim, este jogo é uma cópia de I'm Scared com DNBHL.\nNão me juuj.\n\n\n\nBtw, a resposta é: arrozcomfeijao\nAs respostas sempre vão sem minuscualas, sem espaços e sem pontos")

func _on_Button_button_up():
	get_tree().change_scene("res://Fases/Fase 1/Fase 1.tscn")

func _on_BotaoDeSair_button_up():
	get_node("AnimationPlayer").play("fechandoJogo")

func quit():
	get_tree().quit()
