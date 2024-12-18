extends CharacterBody2D

@export var flap_force: int = 300
var gravity: float = 981

func _physics_process(delta: float) -> void:
	### ADD COMMENT ABOUT WHAT THIS CODE DOES
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("Flap"):
		velocity.y = -flap_force
	move_and_slide()
	
func _process(_delta: float) -> void:
	### ADD COMMENT ABOUT WHAT THIS CODE DOES
	if velocity.y > 0:
		$AnimationPlayer.play("Down")
	elif velocity.y < 0:
		$AnimationPlayer.play("Up")
	else:
		$Sprite2D.frame = 6


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	### ADD COMMENT ABOUT WHAT THIS CODE DOES
	get_tree().call_deferred("reload_current_scene")
