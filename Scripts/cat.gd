extends CharacterBody2D
class_name CatEnemy

func _physics_process(delta):
	rotation = atan2(velocity.y, velocity.x)
	move_and_slide()
