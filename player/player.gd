class_name Player
extends CharacterBody3D

var components: Array[PlayerComponent] = []

func _register_component(component: PlayerComponent):
	components.append(component)
