extends Node

signal button_on_click(count:int)
signal paste(count:int, data:Image)
signal clear

var window:JavaScriptObject = JavaScriptBridge.get_interface("window")
var document:JavaScriptObject = JavaScriptBridge.get_interface("document")

var add_label_btn:bool = false
var emit_count:int = 0

var paste_btn:bool = false
var clear_btn:bool = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if OS.has_feature('web'):
		if document.title == "GlobalSignal":
			monitoring_test_btn()
			monitoring_clear_btn()

func monitoring_test_btn() -> void:
	var _btn:bool = JavaScriptBridge.get_interface("is_test_pressed").valueOf()
	if _btn != add_label_btn:
		add_label_btn = _btn
		emit_count += 1
		button_on_click.emit(emit_count)

func monitoring_paste() -> void:
	var _btn:bool = JavaScriptBridge.get_interface("is_paste_pressed").valueOf()
	if _btn != paste_btn:
		paste_btn = _btn
		emit_count += 1
		if DisplayServer.clipboard_has_image():
			var data:Image = DisplayServer.clipboard_get_image()
			paste.emit(emit_count, data)

func monitoring_clear_btn() -> void:
	var btn:bool = JavaScriptBridge.get_interface("is_clear_pressed").valueOf()
	if btn != clear_btn:
		clear_btn = btn
		clear.emit()
