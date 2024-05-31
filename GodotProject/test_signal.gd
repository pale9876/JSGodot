extends Control

@onready var count: RichTextLabel = $HBoxContainer/VBoxContainer2/Panel/Count
@onready var result: RichTextLabel = $HBoxContainer/VBoxContainer/Panel/Result

func _ready()->void:
	GlobalSignal.press_button.connect(on_press_test_button)
	count.add_text(str(GlobalSignal.emit_count))
	result.add_text("Success")

func on_press_test_button() -> void:
	count.add_text(str(GlobalSignal.emit_count))
	result.add_text("Success")
