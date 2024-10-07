extends State
class_name EnemyFollow

@export var enemy : CharacterBody2D
@export var move_speed := 150.0

var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("player")
	%Angry.play()

func Physics_Update(delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 80: # the distance at which the enemy will stop chasing
		%Sprite2D.look_at(player.global_position)
		enemy.velocity = direction.normalized() * move_speed
	else:
		%Sprite2D.look_at(player.global_position)
		enemy.velocity = Vector2()
		Transitioned.emit(self, "attack")
	
	if direction.length() > 300: # how close the player should be to be chased
		Transitioned.emit(self, "idle")
