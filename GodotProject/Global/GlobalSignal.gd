extends Node

signal button_on_click(count:int)
signal paste_on_click

var window:JavaScriptObject = JavaScriptBridge.get_interface("window")
var document:JavaScriptObject = JavaScriptBridge.get_interface("document")

var add_label_btn:bool = false
var emit_count:int = 0

var paste_btn:bool = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if OS.has_feature('web'):
		if document.title == "GlobalSignal":
			monitoring_test_btn()
		if document.title == "testClipBoard":
			monitoring_paste()

func monitoring_paste() -> void:
	var _btn:bool = JavaScriptBridge.get_interface("is_paste_pressed").valueOf()
	if _btn != paste_btn:
		paste_btn = _btn
		paste_on_click.emit()
		window.complete_paste()
		if DisplayServer.clipboard_has_image():
			var data:Image = DisplayServer.clipboard_get_image()
			print(data)

func monitoring_test_btn() -> void:
	var _btn:bool = JavaScriptBridge.get_interface("is_test_pressed").valueOf()
	if _btn != add_label_btn:
		add_label_btn = _btn
		emit_count += 1
		button_on_click.emit(emit_count)
		window.set_count_label(
			JavaScriptBridge.create_object("Number", emit_count)
			)
