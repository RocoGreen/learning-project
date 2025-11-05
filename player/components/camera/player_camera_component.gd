class_name PlayerCameraComponent
extends PlayerComponent

@export var smoothness := 0.5

func _ready():
	$Camera3D.top_level = true

func _physics_process(_delta: float) -> void:
	$Camera3D.global_transform = $Camera3D.global_transform.interpolate_with($".".global_transform, smoothness)
