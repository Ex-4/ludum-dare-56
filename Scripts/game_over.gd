extends CanvasLayer

func _on_retry_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_level.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
