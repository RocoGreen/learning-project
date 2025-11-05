class_name PlayerComponentManager
extends Node

var components: Array[PlayerComponent] = []

func _register(component: PlayerComponent):
	components.append(component)
