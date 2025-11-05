class_name PlayerComponent
extends Node3D

@export var player: Player

func _ready() -> void:
	if player: player._register_component(self)
