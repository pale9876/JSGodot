shader_type canvas_item;

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
