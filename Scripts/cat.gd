extends CharacterBody2D
class_name CatEnemy

func _physics_process(delta):
	move_and_slide()
	
	rotation = atan2(velocity.y, velocity.x)
