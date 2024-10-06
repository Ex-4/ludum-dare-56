extends CharacterBody2D

#signal health_depleted

var health = 5.0
var food = 0
var house_inrange = false
var speed = 200

func _ready():
	pass
	%HUD.hide_prompt()
	%HUD.set_health(health)

func _process(delta):	
	# checking for houses, prompting to infect 
	if %RayCast2D.is_colliding() && %RayCast2D.get_collision_mask_value(3) && %RayCast2D.get_collider().infected == false:
		%HUD.show_prompt()
		house_inrange = true
	else:
		%HUD.hide_prompt()	
		house_inrange = false	
		

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", 
	"move_up", "move_down") #wasd
	
	#	rotating the player sprite when moving
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right") or Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down"):
		rotation = atan2(velocity.y, velocity.x)
			
	velocity = direction * speed		
	move_and_slide()

func _input(event):
	if Input.is_action_pressed("interact") && house_inrange:
		%HUD.update_prompt("Infecting..")	
		var obj = %RayCast2D.get_collider()
		obj.perform_action()
	else:
		%HUD.update_prompt("Hold E To Infect")
func take_damage():
	health-=1
	%HUD.update_health(health)
	if health <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func update_food(num):
	food += num
