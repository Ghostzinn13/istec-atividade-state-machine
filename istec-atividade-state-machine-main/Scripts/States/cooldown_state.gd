class_name CooldownState extends BaseState

func enter() -> void:
	print("cooldown")
	knight.cooldown_timer = knight.dash_cooldown
	knight.velocity = Vector2.ZERO


func exit() -> void:
	pass


func tick() -> void:
	knight.cooldown_timer -= knight.get_physics_process_delta_time()
	knight.velocity = Vector2.ZERO


func branch() -> BaseState:
	if knight.cooldown_timer <= 0:
		return IdleState.new(knight)

	return null
