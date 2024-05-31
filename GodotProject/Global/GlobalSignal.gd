extends Node

signal press_button

var test_btn:bool = false
var emit_count:int = 0
var window:JavaScriptObject = JavaScriptBridge.get_interface("window")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if OS.has_feature('web'):
		if JavaScriptBridge.get_interface("is_test_pressed") != null:
			monitoring_test_btn()

func monitoring_test_btn() -> void:
	if JavaScriptBridge.get_interface("is_test_pressed").valueOf() != test_btn:
		emit_count += 1
		press_button.emit()
		window.set_count_label(
			JavaScriptBridge.create_object("count", emit_count)
			)
	
