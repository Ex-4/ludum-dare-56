extends interactable

var food = 50
var infected = false

func _ready():
	$InfectedSprite.hide()
	
func action():
	infected = true
	$HouseSprite.hide()
	$InfectedSprite.show()
	
	%HUD.update_house()
	%HUD.update_food(food)
	%Player.update_food(food)
	%Player.take_damage()
