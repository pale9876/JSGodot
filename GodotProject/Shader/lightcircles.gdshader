shader_type canvas_item;

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
