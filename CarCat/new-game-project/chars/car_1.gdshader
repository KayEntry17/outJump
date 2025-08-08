shader_type spatial;
render_mode unshaded;
render_mode cull_disabled;
uniform float bend;
uniform vec3 albedo: source_color;

void vertex() {
	float vecy=VERTEX.y;
	//VERTEX.y+=sin((VERTEX.x+TIME)*1.)*1.;
	VERTEX.x+=abs(VERTEX.y)*(bend);

	//VERTEX.x+=sin((vecy+TIME)*7.)*0.1;
}

void fragment() {
	ALBEDO=albedo;
}
//
//void light() {
	//ALBEDO=-(albedo);
	//// Called for every pixel for every light affecting the material.
	//// Uncomment to replace the default light processing function with this one.
//}
