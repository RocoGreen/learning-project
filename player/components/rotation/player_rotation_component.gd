class_name PlayerRotationComponent
extends PlayerComponent

@export var mouse_sensitivity := 0.010

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is not InputEventMouseMotion: return

	var final_transform_basis = $"../..".transform.basis.rotated(Vector3.UP, -event.screen_relative.x * mouse_sensitivity)
	var final_transform_rotation = final_transform_basis.orthonormalized().get_euler()
	
	final_transform_rotation.x = clampf(final_transform_rotation.x + -event.screen_relative.y * mouse_sensitivity, -PI / 2, PI / 2)
	
	$"../..".rotation = final_transform_rotation
