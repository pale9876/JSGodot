extends Node

signal press_button

var test_btn:bool = false
var emit_count:int = 0
var window:JavaScriptObject = JavaScriptBridge.get_interface("window")
var document:JavaScriptObject = JavaScriptBridge.get_interface("document")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if OS.has_feature('web'):
		if document.title == "GlobalSignal":
			monitoring_test_btn()
		elif document.title == "godotToWeb":
			pass

func monitoring_test_btn() -> void:
	if JavaScriptBridge.get_interface("is_test_pressed").valueOf() != test_btn:
		test_btn = JavaScriptBridge.get_interface("is_test_pressed").valueOf()
		emit_count += 1
		press_button.emit()
		window.set_count_label(
			JavaScriptBridge.create_object("Number", emit_count)
			)
