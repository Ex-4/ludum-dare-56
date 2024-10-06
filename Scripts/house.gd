extends interactable

var food = 5
var infected = false
var timeHeld = 0.0

func _ready():
	$InfectedSprite.hide()
	
func action():
	if Input.is_action_pressed("interact"):
			timeHeld = timeHeld + get_process_delta_time()
	else:
		timeHeld = 0.0
		
	if timeHeld >= 0.7:
		infected = true
		$HouseSprite.hide()
		$InfectedSprite.show()
		
		%HUD.update_house()
		%HUD.update_food(food)
		%Player.update_food(food)
