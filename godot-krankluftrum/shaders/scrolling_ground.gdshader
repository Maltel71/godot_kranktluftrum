shader_type canvas_item;

uniform vec2 tiling = vec2(1.0,1.0);
void fragment() {
	vec2 tiled_uv = mod(UV * tiling, 1.0);
	COLOR = texture(TEXTURE, tiled_uv);
	
}