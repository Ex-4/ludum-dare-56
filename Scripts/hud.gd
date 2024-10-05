extends CanvasLayer

func update_house():
	var score = int($HouseScore.text)
	score += 1
	$HouseScore.text = str(score)
	
func update_food(num):
	var score = int($FoodScore.text)
	score += num
	$FoodScore.text = str(score)

func update_health(num):
	$HealthBar.value = num

func set_health(num):
	$HealthBar.set_max(num)	
