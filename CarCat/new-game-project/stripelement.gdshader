shader_type canvas_item;
uniform sampler2D noisetex: filter_nearest;
uniform float speed;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
if (texture(TEXTURE,vec2(UV.x,UV.y+TIME*speed))==vec4(1.)){
	COLOR=vec4(vec3(1.),1.);
}
else{ 
	//COLOR=mix( texture(TEXTURE,vec2(UV.x,UV.y+TIME*speed)),texture(noisetex,UV),1.-UV.y+0.2);
//COLOR=texture(TEXTURE,vec2(UV.x,UV.y+TIME*speed))*(UV.y);
}
COLOR=vec4(texture(TEXTURE,vec2(UV.x,UV.y+TIME*speed)).rgb,(UV.y-0.1));
//COLOR=texture(noisetex,vec2(COLOR.r*COLOR.a));
//COLOR=texture(TEXTURE,vec2(UV.x,UV.y+TIME*speed))*(1.-UV.y);

}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
