extends CharacterBody2D

var window:JavaScriptObject = JavaScriptBridge.get_interface("window")
var console:JavaScriptObject = JavaScriptBridge.get_interface("console")

var current_velo:Vector2 = Vector2.ZERO
var spd:float = 500.

var pos:Vector2
var input:Vector2
var dir:Vector4

func _physics_process(delta: float) -> void:
	get_input()

	if input != Vector2.ZERO:
		current_velo = lerp(Vector2.ZERO, input * spd, .277)
	else:
		current_velo = lerp(current_velo, Vector2.ZERO, .277)

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
	var monitor_x:JavaScriptObject = JavaScriptBridge.get_interface("monitor_x")
	var monitor_y:JavaScriptObject = JavaScriptBridge.get_interface("monitor_y")
	
	monitor_x.value = pos.x
	monitor_y.value = pos.y
	
	var monitor_dir_x:JavaScriptObject = JavaScriptBridge.get_interface("dir_x")
	var monitor_dir_y:JavaScriptObject = JavaScriptBridge.get_interface("dir_y")
	var monitor_dir_z:JavaScriptObject = JavaScriptBridge.get_interface("dir_z")
	var monitor_dir_w:JavaScriptObject = JavaScriptBridge.get_interface("dir_w")
	
	monitor_dir_x.value = dir.x
	monitor_dir_y.value = dir.y
	monitor_dir_z.value = dir.z
	monitor_dir_w.value = dir.w

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	reset_pos()

func reset_pos() -> void:
	global_position = Vector2(300,200)
