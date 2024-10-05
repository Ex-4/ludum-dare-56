extends CharacterBody2D

#signal health_depleted

var health = 5.0
var food = 0

func _ready():
	pass
	$InfectPrompt.hide()
	%HUD.set_health(health)

func _process(delta):
	pass
	if %RayCast2D.is_colliding() && %RayCast2D.get_collision_mask_value(2) && %RayCast2D.get_collider().infected == false:
		$InfectPrompt.show()
		if Input.is_action_just_pressed("interact"):
			var obj = %RayCast2D.get_collider()
			obj.perform_action()
	else:
		$InfectPrompt.hide()		

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", 
	"move_up", "move_down") #wasd
	
	#	rotating the player sprite when moving
	if Input.is_action_just_pressed("move_left"):
		$Sprite2D.rotation_degrees = 180
	elif Input.is_action_just_pressed("move_right"):
		$Sprite2D.rotation_degrees = 0
	elif Input.is_action_just_pressed("move_down"):
		$Sprite2D.rotation_degrees = 90		
	elif Input.is_action_just_pressed("move_up"):
		$Sprite2D.rotation_degrees = 270
			
	velocity = direction * 400		
	move_and_slide()

func _input(event):

	pass

func take_damage():
	health-=1
	%HUD.update_health(health)
	if health <= 0:
		pass

func update_food(num):
	food += num
