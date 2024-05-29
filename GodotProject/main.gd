extends Node2D

var window:JavaScriptObject = JavaScriptBridge.get_interface("window")

var a:Vector3 = Vector3(.5, .5, .5)
var b:Vector3 = Vector3(.4, .7, .1)
var c:Vector3 = Vector3(1., 1., 1.)
var d:Vector3 = Vector3(.263, .416, .557)

var t_scale:float = .4

@onready var color_rect: ColorRect = $ColorRect

func _process(delta: float) -> void:
	if OS.has_feature('web'):
		a.x = JavaScriptBridge.get_interface("a_r").valueOf()
		a.x = JavaScriptBridge.get_interface("a_g").valueOf()
		a.y = JavaScriptBridge.get_interface("a_b").valueOf()
		
		b.z = JavaScriptBridge.get_interface("b_r").valueOf()
		b.y = JavaScriptBridge.get_interface("b_g").valueOf()
		b.z = JavaScriptBridge.get_interface("b_b").valueOf()
		
		c.z = JavaScriptBridge.get_interface("c_r").valueOf()
		c.z = JavaScriptBridge.get_interface("c_g").valueOf()
		c.y = JavaScriptBridge.get_interface("c_b").valueOf()
		
		d.z = JavaScriptBridge.get_interface("d_r").valueOf()
		d.y = JavaScriptBridge.get_interface("d_g").valueOf()
		d.z = JavaScriptBridge.get_interface("d_b").valueOf()

		t_scale = JavaScriptBridge.get_interface("t_scale").valueOf()

		window.set_values()
	
	color_rect.material.set("shader_parameter/a_index", a)
	color_rect.material.set("shader_parameter/b_index", b)
	color_rect.material.set("shader_parameter/c_index", c)
	color_rect.material.set("shader_parameter/d_index", d)
	color_rect.material.set("shader_parameter/time_scale", t_scale)

