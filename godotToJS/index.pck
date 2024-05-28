GDPC                �                                                                         T   res://.godot/exported/133200997/export-22a0eef0dd91e7d0decbf1cb0789d3c8-shader.scn  `(      o      W̝ �v��h�� �    T   res://.godot/exported/133200997/export-78c237d4bfdb4e1d02e0b5f38ddfd8bd-scene.scn   `#             �ӛuȖC���"P�    ,   res://.godot/global_script_class_cache.cfg  �-             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctexP             �u�-�Q��^����R�       res://.godot/uid_cache.bin  �1      W       �2n�ċD���UFAq       res://CharacterBody2D.gd        �      ��\��F������       res://Iterations.gdshader   @      �      �A~�'�܆Z��0�U       res://gradient.gdshader        A      ac��v���)�Ѿ=�^W       res://icon.svg  �-      �      C��=U���^Qu��U3       res://icon.svg.import   p      �       ����%z�v�39�       res://lightcircles.gdshader �            ��w�r���d�
��       res://main.gd   �      x      �O�@2W��θ���\�s       res://project.binary�1      -      6g��u�^�w�i�o(G�       res://scene.tscn.remap  �,      b       ��w$yWJMX��       res://shader.tscn.remap @-      c       z���~����d��|��                extends CharacterBody2D

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

func reset_pos() -> void:
	global_position = Vector2(300,200)
    shader_type canvas_item;

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
               GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�m�m۬�}�p,�젮�N{2n�d��5���$I������ԇ$W�NT���H�ɊȌ�j���k��f�v칢�����n�d'��3���Gu��^�6R�Lw��@m��B���fZ��X�m���n�ضgֶm۶1�Iw=Ou*��۶����O�ii;@T�֏ٶڶ���vzw�WK��Cp#I��\ރخ}C\A6���$
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
                shader_type canvas_item;

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
		
		vec3 col = palette(length(uv0) + i * .4 + TIME * .4);
		
		d = sin(d * 8. + TIME) / 8.;
		d = abs(d);
		
		d = pow(.01/d, 1.2);
		
		finalColor += col * d;
	}
	COLOR = vec4(finalColor, 1.0);
}
   extends Node2D

var a:Vector3 = Vector3(.5, .5, .5)
var b:Vector3 = Vector3(.4, .7, .1)
var c:Vector3 = Vector3(1., 1., 1.)
var d:Vector3 = Vector3(.263, .416, .557)

@onready var color_rect: ColorRect = $ColorRect

func _process(delta: float) -> void:
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

	color_rect.material.set("shader_parameter/a_index",a)
	color_rect.material.set("shader_parameter/a_index",b)
	color_rect.material.set("shader_parameter/a_index",c)
	color_rect.material.set("shader_parameter/a_index",d)
	
	
        RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    script 	   _bundled       Script    res://CharacterBody2D.gd ��������
   Texture2D    res://icon.svg �Bˑ�hN      local://CircleShape2D_wpb4k �         local://PackedScene_su2lx �         CircleShape2D             PackedScene          	         names "         Scene    Node2D    CharacterBody2D 	   position    motion_mode    script 	   Sprite2D    scale    texture    CollisionShape2D    shape    VisibleOnScreenNotifier2D    rect 0   _on_visible_on_screen_notifier_2d_screen_exited    screen_exited    	   variants       
     �C  HC                
      ?   ?                   
      �   �             �A  �A      node_count             nodes     3   ��������       ����                      ����                                       ����                          	   	   ����   
                       ����                         conn_count             conns                                     node_paths              editable_instances              version             RSRCRSRC                    PackedScene            ��������                                            
      resource_local_to_scene    resource_name    shader    shader_parameter/res    shader_parameter/a_index    shader_parameter/b_index    shader_parameter/c_index    shader_parameter/d_index    script 	   _bundled       Script    res://main.gd ��������   Shader    res://lightcircles.gdshader ��������      local://ShaderMaterial_r67fu �         local://PackedScene_jjcan �         ShaderMaterial                   
     D  �C         ?   ?   ?      ���>333?���=        �?  �?  �?      �>���>��?         PackedScene    	      	         names "         Node2D    script 
   ColorRect 	   material    offset_right    offset_bottom    	   variants                               �D     �C      node_count             nodes        ��������        ����                            ����                               conn_count              conns               node_paths              editable_instances              version             RSRC [remap]

path="res://.godot/exported/133200997/export-78c237d4bfdb4e1d02e0b5f38ddfd8bd-scene.scn"
              [remap]

path="res://.godot/exported/133200997/export-22a0eef0dd91e7d0decbf1cb0789d3c8-shader.scn"
             list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             �Bˑ�hN   res://icon.svg^�~��|�B   res://scene.tscn(D���9   res://shader.tscn         ECFG	      application/config/name         ShaderInteractive      application/run/main_scene         res://scene.tscn   application/config/features$   "         4.2    Forward Plus       application/config/icon         res://icon.svg  "   display/window/size/viewport_width      X  #   display/window/size/viewport_height      �     dotnet/project/assembly_name         ShaderInteractive   #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility   