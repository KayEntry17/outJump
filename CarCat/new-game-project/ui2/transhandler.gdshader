shader_type canvas_item;
uniform vec4 coly:source_color;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 col=texture(TEXTURE,UV);
	
	COLOR=vec4(coly.rgb,col.a);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
