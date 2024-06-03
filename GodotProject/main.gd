extends Node2D

var window:JavaScriptObject = JavaScriptBridge.get_interface("window")

var a:Vector3
var b:Vector3
var c:Vector3
var d:Vector3

var t_scale:float = .4

@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	a = color_rect.material.get("shader_parameter/a_index")
	b = color_rect.material.get("shader_parameter/b_index")
	c = color_rect.material.get("shader_parameter/c_index")
	d = color_rect.material.get("shader_parameter/d_index")
	t_scale = color_rect.material.get("shader_parameter/time_scale")
	
func _process(delta: float) -> void:
	if OS.has_feature('web'):
		get_values(a, "a")
		get_values(b, "b")
		get_values(c, "c")
		get_values(d, "d")

		get_time_scale()
		
		window.set_values()
	

func get_values(color_vec3:Vector3, index:String) -> void:
	color_vec3.x = JavaScriptBridge.get_interface(index + "_r").valueOf()
	color_vec3.y = JavaScriptBridge.get_interface(index + "_g").valueOf()
	color_vec3.z = JavaScriptBridge.get_interface(index + "_b").valueOf()
	color_rect.material.set("shader_parameter/" + index +"_index", color_vec3)

func get_time_scale() -> void:
	t_scale = JavaScriptBridge.get_interface("t_scale").valueOf()
	color_rect.material.set("shader_parameter/time_scale", t_scale)
