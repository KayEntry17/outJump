shader_type spatial;
uniform sampler2D noisetex: filter_nearest;
//uniform float speed;
render_mode unshaded;
render_mode cull_disabled;
uniform float speed = 2.0;
uniform float frequency_y = 5.0;
uniform float frequency_x = 5.0;
uniform float amplitude_y = 50.0;
uniform float amplitude_x = 25.0;
uniform float inclination = 50.0;

void vertex() {
	VERTEX.y += sin((UV.x - TIME * speed) * frequency_y) * amplitude_y * UV.x;
	VERTEX.x += cos((UV.y - TIME * speed) * frequency_x) * amplitude_x * UV.x;
	VERTEX.x -= UV.y * inclination;
}
void fragment() {
	ALBEDO=texture(noisetex,UV).xyz;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
