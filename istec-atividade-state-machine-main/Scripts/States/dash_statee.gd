class_name DashState extends BaseState

func enter() -> void:
	print("dash")
	knight.dash_timer = knight.dash_duration
	#knight.animated_sprite.play("dash")


func exit() -> void:
	knight.velocity = Vector2.ZERO


func tick() -> void:
	knight.dash_timer -= knight.get_physics_process_delta_time()

	knight.velocity = knight.direction_to_cursor.normalized() * knight.dash_speed
	knight.move_and_slide()


func branch() -> BaseState:
	if knight.dash_timer <= 0:
		return CooldownState.new(knight)

	return null
