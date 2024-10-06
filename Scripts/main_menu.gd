extends CanvasLayer

func _ready():
	for child in $tutorial.get_children():
		child.hide()

#	main menu section
func _on_play_button_pressed():
	for child in $main.get_children():
		child.hide()	
	for child in $tutorial.get_children():
		child.show()


func _on_quit_button_pressed():
	get_tree().quit()

#	tutorial section


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_level.tscn")


func _on_back_button_pressed():
	for child in $main.get_children():
		child.show()	
	for child in $tutorial.get_children():
		child.hide()
