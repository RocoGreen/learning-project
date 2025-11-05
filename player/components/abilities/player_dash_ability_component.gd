class_name PlayerDashAbilityComponent
extends PlayerComponent

@export var dash_velocity := 30.0
@export var deceleration := 0.9

var _ongoing := false

func _physics_process(_delta: float) -> void:
	if !player: return
	
	if _ongoing:
		var final_player_velocity = player.velocity
		
		final_player_velocity.x = move_toward(final_player_velocity.x, 0, deceleration)
		final_player_velocity.y = move_toward(final_player_velocity.y, 0, deceleration)
		final_player_velocity.z = move_toward(final_player_velocity.z, 0, deceleration)
		
		var player_velocity_abs = player.velocity.abs()
		
		if player_velocity_abs.x <= $"../PlayerMovementComponent".move_speed and player_velocity_abs.y <= $"../PlayerMovementComponent".move_speed and player_velocity_abs.z <= $"../PlayerMovementComponent".move_speed:
			_ongoing = false
			$"../PlayerMovementComponent".disabled = false
		else:
			player.velocity = final_player_velocity
	
	else:
		if !Input.is_action_just_pressed("ability_1"): return
		
		_ongoing = true
		$"../PlayerMovementComponent".disabled = true
		
		var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
		var direction: Vector3
		
		if input_dir == Vector2.ZERO: direction = (player.transform.basis * Vector3(0, 0, -1)).normalized()
		else: direction = (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		
		player.velocity.x = direction.x * dash_velocity
		player.velocity.y = direction.y * dash_velocity
		player.velocity.z = direction.z * dash_velocity
	
	player.move_and_slide()
