GDPC                �                                                                         T   res://.godot/exported/133200997/export-22a0eef0dd91e7d0decbf1cb0789d3c8-shader.scn  �'      o      0�"��O�Ӝ��b��K    T   res://.godot/exported/133200997/export-78c237d4bfdb4e1d02e0b5f38ddfd8bd-scene.scn   `#      z      D����h�(MSv�    ,   res://.godot/global_script_class_cache.cfg  0-             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�      �      �̛�*$q�*�́        res://.godot/uid_cache.bin  1      W       �2n�ċD���UFAq       res://CharacterBody2D.gd        6      4�﷟�M��1��'�       res://Iterations.gdshader   @      �      �A~�'�܆Z��0�U       res://gradient.gdshader @      A      ac��v���)�Ѿ=�^W       res://icon.svg  P-      �      C��=U���^Qu��U3       res://icon.svg.import   p      �       ����%z�v�39�       res://lightcircles.gdshader �            ��w�r���d�
��       res://main.gd   �      x      �O�@2W��θ���\�s       res://project.binaryp1      -      6g��u�^�w�i�o(G�       res://scene.tscn.remap  P,      b       ��w$yWJMX��       res://shader.tscn.remap �,      c       z���~����d��|��                extends CharacterBody2D

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
          shader_type canvas_item;

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
               GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

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
	
	
        RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://CharacterBody2D.gd ��������
   Texture2D    res://icon.svg �Bˑ�hN      local://PackedScene_601ln 9         PackedScene          	         names "         Scene    Node2D    CharacterBody2D 	   position    motion_mode    script 	   Sprite2D    scale    texture    CollisionShape2D    VisibleOnScreenNotifier2D    rect 0   _on_visible_on_screen_notifier_2d_screen_exited    screen_exited    	   variants       
     �C  HC                
      ?   ?         
      �   �             �A  �A      node_count             nodes     1   ��������       ����                      ����                                       ����                          	   	   ����               
   
   ����                         conn_count             conns                                     node_paths              editable_instances              version             RSRC      RSRC                    PackedScene            ��������                                            
      resource_local_to_scene    resource_name    shader    shader_parameter/res    shader_parameter/a_index    shader_parameter/b_index    shader_parameter/c_index    shader_parameter/d_index    script 	   _bundled       Script    res://main.gd ��������   Shader    res://lightcircles.gdshader ��������      local://ShaderMaterial_r67fu �         local://PackedScene_s5rsf �         ShaderMaterial                   
     D  �C         ?   ?   ?      ���>333?���=        �?  �?  �?      �>���>��?         PackedScene    	      	         names "         Node2D    script 
   ColorRect 	   material    offset_right    offset_bottom    	   variants                               �D     �C      node_count             nodes        ��������        ����                            ����                               conn_count              conns               node_paths              editable_instances              version             RSRC [remap]

path="res://.godot/exported/133200997/export-78c237d4bfdb4e1d02e0b5f38ddfd8bd-scene.scn"
              [remap]

path="res://.godot/exported/133200997/export-22a0eef0dd91e7d0decbf1cb0789d3c8-shader.scn"
             list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             �Bˑ�hN   res://icon.svg^�~��|�B   res://scene.tscn(D���9   res://shader.tscn         ECFG	      application/config/name         ShaderInteractive      application/run/main_scene         res://scene.tscn   application/config/features$   "         4.2    Forward Plus       application/config/icon         res://icon.svg  "   display/window/size/viewport_width      X  #   display/window/size/viewport_height      �     dotnet/project/assembly_name         ShaderInteractive   #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility   