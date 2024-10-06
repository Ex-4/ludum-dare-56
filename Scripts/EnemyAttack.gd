extends State
class_name EnemyAttack

@export var enemy : CharacterBody2D
@export var hitbox : Area2D

var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("player")

func _on_hit_box_area_entered(area):
	if area.get_collision_layer() == 1:
		player.take_damage()

func Physics_Update(delta: float):
	%Sprite2D.look_at(player.global_position)
	%AnimationPlayer.play("attack")
	%AnimationPlayer.queue("idle")
	
func attack_finished():
	Transitioned.emit(self, "follow")
