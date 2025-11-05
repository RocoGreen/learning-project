class_name PlayerWeaponComponent
extends PlayerComponent

var bullet = preload("res://player/components/weapons/bullet/player_weapon_component_bullet.tscn")

@export var bullet_travel_speed := 1

func _ready() -> void:
	$WeaponPivot/Weapon.top_level = true

func _process(_delta: float) -> void:
	if !player: return
	
	$WeaponPivot/Weapon.global_position = $WeaponPivot.global_position
	$WeaponPivot/Weapon.global_rotation = player.global_rotation
	
	if !Input.is_action_just_pressed("primary_fire"): return
	
	var bullet_instance: PlayerWeaponComponentBullet = bullet.instantiate()
	bullet_instance.player_weapon_component = self
	
	$WeaponPivot/Weapon/BulletInstanceTarget.add_child(bullet_instance)
	
	bullet_instance.global_position = $WeaponPivot/Weapon/BulletInstanceTarget.global_position
	bullet_instance.global_rotation = $WeaponPivot/Weapon/BulletInstanceTarget.global_rotation
