class_name PlayerWeaponComponentBullet
extends Area3D

var player_weapon_component: PlayerWeaponComponent

func _ready() -> void:
	if !player_weapon_component: return;
	
	$TimeoutTimerUntilSelfDestruction.start()

func _process(_delta: float) -> void:
	if !player_weapon_component: return;
	
	var direction: Vector3 = (global_transform.basis * Vector3(0, 0, -1)).normalized()
	global_transform.origin += direction * player_weapon_component.bullet_travel_speed
	
func _on_body_entered(_body: Node3D) -> void:
	queue_free()

func _on_timeout_timer_until_self_destruction_timeout() -> void:
	queue_free()
