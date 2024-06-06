extends CharacterBody2D

var window:JavaScriptObject = JavaScriptBridge.get_interface("window")
var console:JavaScriptObject = JavaScriptBridge.get_interface("console")

var current_velo:Vector2 = Vector2.ZERO
var spd:float = 500.

var pos:Vector2
var input:Vector2
var dir:Vector4

func _ready() -> void:
	$VisibleOnScreenNotifier2D.screen_exited.connect(_on_visible_on_screen_notifier_2d_screen_exited)

func _physics_process(delta: float) -> void:
	get_input()

	if input != Vector2.ZERO:
		current_velo = lerp(current_velo, input * spd, .115)
	else:
		current_velo = lerp(current_velo, Vector2.ZERO, .115)

	velocity = current_velo

	move_and_slide()

	output()

func get_input() -> void:
	input = Input.get_vector(
		"ui_left",
		"ui_right",
		"ui_up",
		"ui_down"
		)

	var x_input = Input.get_axis("ui_left","ui_right")
	var y_input = Input.get_axis("ui_down","ui_up")
	
	if x_input != 0:
		if x_input < 0:
			dir.x = 1.
			dir.y = 0.
		elif x_input > 0:
			dir.y = 1.
			dir.x = 0.
	else:
		dir.x = 0
		dir.y = 0
	if y_input != 0:
		if y_input < 0:
			dir.z = 1.
			dir.w = 0.
		elif y_input > 0:
			dir.z = 0.
			dir.w = 1.
	else:
		dir.z = 0
		dir.w = 0

func output() -> void:
	var pos_x:JavaScriptObject = JavaScriptBridge.create_object("Number", floor(global_position.x))
	var pos_y:JavaScriptObject = JavaScriptBridge.create_object("Number", floor(global_position.y))

	var dir_x:JavaScriptObject = JavaScriptBridge.create_object("Number", dir.x)
	var dir_y:JavaScriptObject = JavaScriptBridge.create_object("Number", dir.y)
	var dir_z:JavaScriptObject = JavaScriptBridge.create_object("Number", dir.z)
	var dir_w:JavaScriptObject = JavaScriptBridge.create_object("Number", dir.w)

	window.set_pos(pos_x, pos_y)
	window.set_dir(dir_x, dir_y, dir_z, dir_w)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	reset_pos()
	window.alert("Out Screen : Set position Default")

func reset_pos() -> void:
	global_position = Vector2(300,200)
