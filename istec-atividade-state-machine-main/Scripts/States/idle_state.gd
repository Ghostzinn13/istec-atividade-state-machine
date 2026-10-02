class_name IdleState extends BaseState

func enter() -> void:
	print("idle")
	knight.velocity = Vector2.ZERO
	knight.animated_sprite.play("idle")


func exit() -> void:
	pass


func tick() -> void:
	pass

func branch() -> BaseState:
	if Input.is_action_just_pressed("dash"):
		return DashState.new(knight)

	var within_attack: bool = knight.cursor_within_attack_range()
	var within_vision: bool = knight.cursor_within_vision_range()
	if within_attack:
		return AttackState.new(knight)
	elif within_vision:
		return ChaseState.new(knight)
	else:
		return null
