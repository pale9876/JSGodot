extends Control

@onready var count: VBoxContainer = $HBoxContainer/Count
@onready var result: VBoxContainer = $HBoxContainer/Result


func _ready()->void:
	GlobalSignal.press_button.connect(on_press_test_button)

func on_press_test_button() -> void:
	var _count:Label = Label.new()
	count.add_child(_count)
	_count.text = str(GlobalSignal.emit_count)
	
	var _result:Label = Label.new()
	result.add_child(_result)
	_result.text = "Success"
