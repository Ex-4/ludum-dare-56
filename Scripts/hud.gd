extends CanvasLayer

func _ready():
	$TotalHouses.text = str(%Houses.get_child_count())
	
func update_house():
	var score = int($HouseScore.text)
	score += 1
	$HouseScore.text = str(score)
	if score == int($TotalHouses.text):
		get_tree().change_scene_to_file("res://Scenes/game_win.tscn")
	
func update_food(num):
	var score = int($FoodScore.text)
	score += num
	$FoodScore.text = str(score)

func update_health(num):
	$HealthBar.value = num

func set_health(num):
	$HealthBar.set_max(num)	

func update_prompt(text):
	$InfectPrompt.text = text
func show_prompt():
	$InfectPrompt.show()
func hide_prompt():
	$InfectPrompt.hide()
