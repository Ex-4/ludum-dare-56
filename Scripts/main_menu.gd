extends CanvasLayer

func _ready():
	$tutorial.hide()
	$Bg2.hide()

#	main menu section
func _on_play_button_pressed():
	$main.hide()
	$tutorial.show()
	$Bg2.show()
	$Bg1.hide()

func _on_quit_button_pressed():
	get_tree().quit()

#	tutorial section


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_level.tscn")


func _on_back_button_pressed():
	$main.show()	
	$tutorial.hide()
	$Bg2.hide()
	$Bg1.show()
