GDPC                	                                                                         T   res://.godot/exported/133200997/export-22a0eef0dd91e7d0decbf1cb0789d3c8-shader.scn   ;      �      +Ci�~�7=Ʈ�����    \   res://.godot/exported/133200997/export-4510df89ff7f6ed9e4e05cb3e923d4b5-scene_controller.scn�8      {      �S�'s,��t:n|v�    T   res://.godot/exported/133200997/export-78c237d4bfdb4e1d02e0b5f38ddfd8bd-scene.scn   �1             �Z.��ʺR�f�����2    \   res://.godot/exported/133200997/export-7ea337783c9fd8f9c7ca81a0685e9a7e-global_signal.scn   �      |      V+>��!'�e�b��8    T   res://.godot/exported/133200997/export-a7794a7b19edfc30a871f9c03e21652b-main_ui.scn �,      �      
�����W���9/��    X   res://.godot/exported/133200997/export-d3a43e660236ca3f2800afadf16e7ddd-test_signal.scn @C      �      W�V�*;��[�u�?�Ѿ    ,   res://.godot/global_script_class_cache.cfg  �M             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex`             �u�-�Q��^����R�       res://.godot/uid_cache.bin  �Q      �       Č���ڗ��&t��Z�       res://CharacterBody2D.gd0      .      :�� ݐOU/v�f�4�       res://Global/GlobalSignal.gd        u      �p�eS�QG����$�yp    (   res://Global/global_signal.tscn.remap    K      j       ����=����N%"�       res://SceneController.gd�6      �      ߝ{p��"�C��>G޷        res://Shader/Iterations.gdshaderP	      �      �A~�'�܆Z��0�U        res://Shader/gradient.gdshader         A      ac��v���)�Ѿ=�^W    $   res://Shader/lightcircles.gdshader  �      O      ��[D������q��ae       res://icon.svg  �M      �      C��=U���^Qu��U3       res://icon.svg.import   �&      �       ����%z�v�39�       res://main.gd   P'      �      ̕Q��CYXa9�w��2       res://main_ui.gd0,      �       /�-����Y܊g#0�       res://main_ui.tscn.remappK      d       ~_��
v�O�׀t�1�       res://project.binarypR      r      ֑�0�x6Z8 ,K�       res://scene.tscn.remap  �K      b       ��w$yWJMX��    $   res://scene_controller.tscn.remap   PL      m       p@o�C!}((�j.��       res://shader.tscn.remap �L      c       z���~����d��|��       res://test_signal.gd�?      c      $;�A�҆���fcZ�       res://test_signal.tscn.remap0M      h       �7�u*�����fԄ/Q                extends Node

signal button_on_click(count:int)
signal paste_on_click(data)
signal clear_btn_pressed

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
		if document.title == "testClipBoard":
			monitoring_paste()

func monitoring_paste() -> void:
	var _btn:bool = JavaScriptBridge.get_interface("is_paste_pressed").valueOf()
	if _btn != paste_btn:
		paste_btn = _btn
		paste_on_click.emit()
		if DisplayServer.clipboard_has_image():
			var data:Image = DisplayServer.clipboard_get_image()
			paste_on_click.emit(data)
		window.complete_paste()

func monitoring_test_btn() -> void:
	var _btn:bool = JavaScriptBridge.get_interface("is_test_pressed").valueOf()
	if _btn != add_label_btn:
		add_label_btn = _btn
		emit_count += 1
		button_on_click.emit(emit_count)
		window.set_count_label(
			JavaScriptBridge.create_object("Number", emit_count)
			)

func monitoring_clear_btn() -> void:
	var btn:bool = JavaScriptBridge.get_interface("is_clear_pressed").valueOf()
	if btn != clear_btn:
		clear_btn = btn
		clear_btn_pressed.emit()
           RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://Global/GlobalSignal.gd ��������      local://PackedScene_dwul2          PackedScene          	         names "         GlobalSignal    script    Node    	   variants                       node_count             nodes     	   ��������       ����                    conn_count              conns               node_paths              editable_instances              version             RSRC    shader_type canvas_item;

uniform vec2 resolution = vec2(600., 400.);

void fragment() {
	vec2 ires = 1. / SCREEN_PIXEL_SIZE;
	vec2 uv = UV - .5;
	uv.x *= ires.x / ires.y;
	
	float d = length(uv);
	float r = .3;
	
	float c = smoothstep(r, r - .01, d);
	
	//if(d<.3) c = 1.; else c = 0.;
	
	COLOR = vec4(vec3(c), 1.0); 
}
               shader_type canvas_item;

uniform vec2 resolution = vec2(600,400);
uniform float index:hint_range(0.0, 2.0, 0.05) = 1.5;

#define AA 2

vec3 shape(in vec2 uv)
{
	float time = TIME * .05 + 47.0;
	vec2 z = -1. + 2. * uv;
	z *= index;
	vec3 col = vec3(1.);
	for (int j = 0; j < 48; j++)
	{
		float s = float(j) / 16.;
		float f = .2 * (.5 + 1. * fract(sin(s * 20.)));
		
		vec2 c = .5 * vec2(cos(f * time + 17. * s), sin(f * time + 19. * s));
		z -= c;
		float zr = length(z);
		float ar = atan(z.y, z.x) + zr * .6;
		z = vec2(cos(ar), sin(ar)) / zr;
		z += c;
		col -= .5 * exp(-10. * dot(z, z)) * (.25 + .4 * sin(5.5 + 1.5 * s + vec3(1.6,.8,.5)));
	}
	return col;
}

void fragment() {
	vec2 ires = 1./ SCREEN_PIXEL_SIZE;
	float e = 1.0 / ires.x;
	
	vec3 tot = vec3(.0);
	for(int m = 0; m < AA; m++)
	for(int n = 0; n < AA; n++)
	{
		vec2 uv = (FRAGCOORD.xy + vec2(float(m),float(n)) / float(AA))/ires.xy;
		vec3 col = shape(uv);
		float f = dot(col, vec3(.333));
		vec3 nor = normalize(
			vec3(
				dot(shape(uv + vec2(e,0.)), vec3(.333)) - f,
				dot(shape(uv + vec2(0.,e)), vec3(.333)) - f,
				e
		));
		col += .2 * vec3(1., .9, .5) * dot(nor,vec3(.8,.4,.2));
		col += .3 * nor.z;
		tot += col;
	}
	tot /= float(AA*AA);
	tot = pow(clamp(tot,0.,1.), vec3(.8, 1.1, 1.3));
	vec2 uv = FRAGCOORD.xy / ires.xy;
	tot *= .4 + .6 * pow(16. * uv.x * uv.y * (1. - uv.x) * (1. - uv.y), .1);
	COLOR = vec4(tot, 1.);
}

               shader_type canvas_item;

uniform vec2 res = vec2(600., 400.);
uniform vec3 a_index = vec3(.5,.5,.5);
uniform vec3 b_index = vec3(.4,.7,.1);
uniform vec3 c_index = vec3(1.,1.,1.);
uniform vec3 d_index = vec3(.263,.416,.557);
uniform float time_scale:hint_range(0.0, 4.0, 0.01) = .4;

vec3 palette(float t)
{
	return a_index + b_index * cos(6.28318 * (c_index * t + d_index));
}

void fragment()
{
	vec2 ires = 1. / SCREEN_PIXEL_SIZE;
	vec2 uv = (FRAGCOORD.xy * 2. - ires.xy) / ires.y;
	vec2 uv0 = uv;
	vec3 finalColor = vec3(.0);
	
	for (float i = 0.; i < 4.; i++)
	{
		uv = fract(uv * 1.5) - .5;
		float d = length(uv) * exp(-length(uv0));
		
		vec3 col = palette(length(uv0) + i * .4 + TIME * time_scale);
		
		d = sin(d * 8. + TIME) / 8.;
		d = abs(d);
		
		d = pow(.01/d, 1.2);
		
		finalColor += col * d;
	}
	COLOR = vec4(finalColor, 1.0);
}
 extends CharacterBody2D

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
  GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�m�m۬�}�p,�젮�N{2n�d��5���$I������ԇ$W�NT���H�ɊȌ�j���k��f�v칢�����n�d'��3���Gu��^�6R�Lw��@m��B���fZ��X�m���n�ضgֶm۶1�Iw=Ou*��۶����O�ii;@T�֏ٶڶ���vzw�WK��Cp#I��\ރخ}C\A6���$
2#�E.@$���A.��	G��( RD!F�JWl��$@G����� ����:ȁ�)��D]Rٴ"����P��ZK�*�F�Ww$+�wz=˻>�Ӗn�8�]�f���bw��C�AK�����貂���-ݺq��EO��U��1b8���KK���]�h�{Bb�k@#�Nu��m�h
�C��Cȩ��[�U�P.e�F�#��jqc���m�w��,ݺ�|���AfZ_���u2�Żm�ҭS�wj [ȅq=K�\�����q�G���� ����>�.W6�?�(ݺh���|��y��o��FRo�����w����N��I��e��Y��L�78�c%��ڔ[.�7l�NH�9�ʘ�\�Yʶ)vO\~�P��!�?�\��+P�o��Ⱥ�ŬZ���R�w�^5:!�Ta:Y�p��`��CJ���	)�z5�RF�u�5��$�,�M�0���n�m1�j�	�5��6h%sË�ص�R�:TB��W�q��6�o�=���V�_¡E0��y�ѬWT U�b�6Y�����?�xJJ1��z��ǃ�V���������Y�O�I����;����mM��d)sN��K�|)�z-Z�=��=�JI����J�k�OF��R��Te;m���m�$G��6�Ka����X�$�s�(�W�o��3!�l8s?+Ő�WS�t`��gojQ��F�Ӣ�VS���wuZRl�ס���^T�(_�^�*$��!�,����T�P���o�#��%�	����?�K������'Yʂ&9]����ˢ�Y��N�/YaZY�¦JƧ�#�?�R8��ʅ���,�R9�Q	�ZJ��`x�j݋�̝�!��X��,�o5�?���J�-��㳨փ�*L�R=4�;-��'���Pq�{1�YL�����	Q�:ET�:!�"ng%"�}�P	�L�ף����B.o��/�r���5,=���5���\�>�Ĺ��������/l�p�=d���{�_E�G��{���_��Y��θ���`X�3Pq���I+���@ 8;��>��	��+��o�6��
PEL�B�H�N�`������c�Q7Q2�+qQ�y�j�OC�C��?��DDb=�5~ħA ����Y���2���J]_�� A��zb�4/��ݏ:4o���$�+�B�  :���W�L |�����U+5�-�A�l�Ol}�ͭvD=��p"V��S��`�q|r�l	F� 4�1{�V'&�Y 鉡|pj� ߫'�?��Ȩ&�o�H#b��K����@D�˅ �x?Y-�pfV� ,!f�.�"86��j"�� '�J��CM�+ � Ĝ��"���,� ���Wo��	�0C����q'�5.��z@�S1,5ڴ�^��~L�t"�"�RS��Xw.�m[/����;�P�9��L��L�*]_����ur��s�3Ȗ+�^� �>�nnq�E�!R,<�D?����K�n�f�����m�QP�n�:b3�+��6�Yd)� e��-�� �z�`b=�;q�~�k��,�ܝj�?�W�X� @OwV�Џ�j��c��Ds�V�X ���\f�E���y��c��⋹�hx���ӗի�R�]�g�r�˶/����n�;�SSup`�S��6��u����f;Z�INs�|�oh�f�Pc�����^��gzt����x��)wq�Q�My53jƓa���8�6��,�F�ڸ����2��#�)���"�u���}'�"�>�����ǯ[����82һ�n�ٵ0�<v�ݑa}.+n��'����W:4Y�����P��(�k�Mȫۿ�Ϗ��?����Ӧ�K�|y�@suy��<�����{��x}~������~�IN=�s�ޝ�GG�����[�L}~�`�f%T�R!1�no���������v!�G���]��qw��m���E�Br�5���\1/.�j���c��g�\���p�,50l�>=}��
0���l�b�Y�+��dz����v+2ǚ�Ȋl	�Ȭ��"�H�Y&5�M���	ɗN�e؈�3�����n���|0X���
�W�C%�&5<��u�L��&9�6�#e��I��^e_ �G=�I�cΆ�J���>���N�/��׷�G��[���\��T��Ͷh���Qg?1��O��4{s{�����1�Y�����91Qry��=����y=/~٦h'�����[�tD�j��P����� *b��QN��������7��+K�e��T�@j��)��9;�J��JF�#������c��l���I{x�O��K��U��_]>>=_~}�����?��h�:� 5~}���/���߷˿˅8=+����ӝu��;镜�����\Ir�c��,���װ��ު�L�G���8�� �lG��Jr�){�|[�`��iO?޿�$�>�X��-<���r��r�x�������]_n�\
�^������o��u�w	������n�t{8���揫/�������7K�sp��~/{�$'mm�s�`z�wY������i�*��I�)���8t �?i�g�;].� ^ױ�[�o��[��R��w�*A��,�2h�f������}F��[�z!�p5���2hѥ�K���^	d��,������ps6��{���y;�2���=�<��s2�f��#=�bFsТ��i�CZ�A,��d���:T�;X�5�&hхͻ��1C�!hѮ^��7�������o�,��l@b��ze�� 1�w}���l�D.��Yz�r���T�#O�<��l��i#�S��!GĶ�EO}r�K����A�\�<N�zd!E��
R��z�S����x�ö�\.�2)"E �@3o9u�.y�@��e*H�m����]�h�HB.�#bD�j��V8ߥ��Eh���\�ejL�ku�;����l�>N{;����)�P���ʘ�R(E�����n�P.�5a��R7 �0bo��Y���k�%E��;����ÆB�2]m��ր^�Ȗ�4���1h�O������
(�WX[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cmq4fdp2buf2j"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                extends Node2D

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
          extends Control

func _ready() -> void:
	pass

func paste_label() -> void:
	pass
	
func paste_image() -> void:
	pass

func clear() -> void:
	pass
              RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://main_ui.gd ��������      local://PackedScene_v4qy1          PackedScene          	         names "      
   ClipBoard    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    MarginContainer %   theme_override_constants/margin_left $   theme_override_constants/margin_top &   theme_override_constants/margin_right '   theme_override_constants/margin_bottom    HBoxContainer    Label    TextureRect    	   variants                        �?                                  node_count             nodes     K   ��������       ����                                                          	   	   ����
                                       
                                         ����                          ����                          ����                   conn_count              conns               node_paths              editable_instances              version             RSRC      RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    script 	   _bundled       Script    res://CharacterBody2D.gd ��������
   Texture2D    res://icon.svg �Bˑ�hN      local://CircleShape2D_wpb4k �         local://PackedScene_blwpx �         CircleShape2D             PackedScene          	         names "         Scene    Node2D    CharacterBody2D 	   position    motion_mode    script 	   Sprite2D    scale    texture    CollisionShape2D    shape    VisibleOnScreenNotifier2D    rect 0   _on_visible_on_screen_notifier_2d_screen_exited    screen_exited    	   variants       
     �C  HC                
      ?   ?                   
      �   �             �A  �A      node_count             nodes     3   ��������       ����                      ����                                       ����                          	   	   ����   
                       ����                         conn_count             conns                                     node_paths              editable_instances              version             RSRCextends Node

var document:JavaScriptObject = JavaScriptBridge.get_interface("document")
var window:JavaScriptObject = JavaScriptBridge.get_interface("window")

func _ready() -> void:
	match document.title:
		"contents":
			to_set_current_scene(load("res://main_ui.gd"))

func to_set_current_scene(scene:PackedScene) -> void:
	var scene_inst:Node = scene.instantiate()
	get_tree().current_scene.add_child(scene_inst)
               RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://SceneController.gd ��������      local://PackedScene_km2wi          PackedScene          	         names "         SceneController    script    Node    	   variants                       node_count             nodes     	   ��������       ����                    conn_count              conns               node_paths              editable_instances              version             RSRC     RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    shader    shader_parameter/res    shader_parameter/a_index    shader_parameter/b_index    shader_parameter/c_index    shader_parameter/d_index    shader_parameter/time_scale    script 	   _bundled       Script    res://main.gd ��������   Shader #   res://Shader/lightcircles.gdshader ��������      local://ShaderMaterial_r67fu           local://PackedScene_0gple �         ShaderMaterial                   
     D  �C         ?   ?   ?      ���>333?���=        �?  �?  �?      �>���>��?   )   �(\����?	         PackedScene    
      	         names "         Node2D    y_sort_enabled    script 
   ColorRect 	   material    offset_right    offset_bottom    	   variants                                      D     �C      node_count             nodes        ��������        ����                                  ����                               conn_count              conns               node_paths              editable_instances              version       	      RSRC       extends Control

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
	
             RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    content_margin_left    content_margin_top    content_margin_right    content_margin_bottom 	   bg_color    draw_center    skew    border_width_left    border_width_top    border_width_right    border_width_bottom    border_color    border_blend    corner_radius_top_left    corner_radius_top_right    corner_radius_bottom_right    corner_radius_bottom_left    corner_detail    expand_margin_left    expand_margin_top    expand_margin_right    expand_margin_bottom    shadow_color    shadow_size    shadow_offset    anti_aliasing    anti_aliasing_size    script 	   _bundled       Script    res://test_signal.gd ��������      local://StyleBoxFlat_xdiiv w         local://PackedScene_3u3ju �         StyleBoxFlat          �;f>iT`>c�z>  �?         PackedScene          	         names "         TestSignal    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    HBoxContainer    VBoxContainer2    size_flags_horizontal    VBoxContainer    Count    size_flags_vertical    Panel    size_flags_stretch_ratio    Result    theme_override_styles/panel    	   variants                        �?                           @@                node_count             nodes     X   ��������       ����                                                          	   	   ����                                                     
   ����                                 ����                                 ����                                       ����                                conn_count              conns               node_paths              editable_instances              version             RSRC  [remap]

path="res://.godot/exported/133200997/export-7ea337783c9fd8f9c7ca81a0685e9a7e-global_signal.scn"
      [remap]

path="res://.godot/exported/133200997/export-a7794a7b19edfc30a871f9c03e21652b-main_ui.scn"
            [remap]

path="res://.godot/exported/133200997/export-78c237d4bfdb4e1d02e0b5f38ddfd8bd-scene.scn"
              [remap]

path="res://.godot/exported/133200997/export-4510df89ff7f6ed9e4e05cb3e923d4b5-scene_controller.scn"
   [remap]

path="res://.godot/exported/133200997/export-22a0eef0dd91e7d0decbf1cb0789d3c8-shader.scn"
             [remap]

path="res://.godot/exported/133200997/export-d3a43e660236ca3f2800afadf16e7ddd-test_signal.scn"
        list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             �x��
f   res://Global/global_signal.tscn�Bˑ�hN   res://icon.svg5#����?   res://main_ui.tscn^�~��|�B   res://scene.tscnzxn���HG   res://scene_controller.tscn(D���9   res://shader.tscn(9S�6Hs   res://test_signal.tscn       ECFG
      application/config/name         WebInteractive     application/run/main_scene         res://shader.tscn      application/config/features$   "         4.2    Forward Plus       application/config/icon         res://icon.svg     autoload/GlobalSignal(         *res://Global/GlobalSignal.gd   "   display/window/size/viewport_width      X  #   display/window/size/viewport_height      �     dotnet/project/assembly_name         ShaderInteractive   #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility              