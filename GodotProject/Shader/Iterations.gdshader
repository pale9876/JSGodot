shader_type canvas_item;

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

