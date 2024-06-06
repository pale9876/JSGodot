extends Control

@onready var count_panel: VBoxContainer = $HBoxContainer/VBoxContainer2/Count/VBoxContainer
@onready var result_panel: VBoxContainer = $HBoxContainer/VBoxContainer/Result/VBoxContainer

func _ready()->void:
	GlobalSignal.button_on_click.connect(on_press_test_button)
	GlobalSignal.paste.connect(on_paste_button_click)
	GlobalSignal.clear.connect(clear)
	
func on_press_test_button(count:int) -> void:
	var count_label:Label = Label.new()
	count_label.text = str(count) + ":"
	count_panel.add_child(count_label)
	var result_label:Label = Label.new()
	result_label.text = "You Pressed The Button"
	result_panel.add_child(result_label)

func on_paste_button_click(count:int, data:Image) -> void:
	var count_label:Label = Label.new()
	count_label.text = str(count) + "번에 사진을 붙여넣었습니다:"
	count_panel.add_child(count_label)
	var result_texture:TextureRect = TextureRect.new()
	result_texture.texture = ImageTexture.create_from_image(data)
	result_panel.add_child(result_texture)

func clear() -> void:
	for node in count_panel.get_children():
		node.queue_free()
	for node in result_panel.get_children():
		node.queue_free()
