extends Control

@onready var count_panel: Panel = $HBoxContainer/VBoxContainer2/Count
@onready var result_panel: Panel = $HBoxContainer/VBoxContainer/Result

func _ready()->void:
	GlobalSignal.press_button.connect(on_press_test_button)
	GlobalSignal.paste_on_click.connect(on_paste_button_click)
	
func on_press_test_button(count:int) -> void:
	create_label(count)

func on_paste_button_click(data:Image) -> void:
	create_img(data)

func create_label(count:int) -> void:
	var count_label:Label = Label.new()
	count_label.text = str(count) + "번:"
	count_panel.add_child(count_label)
	var result_label:Label = Label.new()
	result_label.text = "버튼을 눌렀습니다."
	result_panel.add_child(result_label)
	
func create_img(data:Image) -> void:
	var result_texture:TextureRect = TextureRect.new()
	result_texture.texture = ImageTexture.create_from_image(data)
	
