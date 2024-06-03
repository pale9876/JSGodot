extends Node

var document:JavaScriptObject = JavaScriptBridge.get_interface("document")
var window:JavaScriptObject = JavaScriptBridge.get_interface("window")

func _ready() -> void:
	match document.title:
		"contents":
			to_set_current_scene(load("res://main_ui.gd"))

func to_set_current_scene(scene:PackedScene) -> void:
	var scene_inst:Node = scene.instantiate()
	get_tree().current_scene.add_child(scene_inst)
