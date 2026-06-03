shader_type canvas_item;

// Allows you to adjust the scale/tiling amount from the inspector
uniform vec2 tiling = vec2(1.0, 1.0); 

void fragment() {
    // Force the UV coordinates to loop within the atlas region
    vec2 tiled_uv = mod(UV * tiling, 1.0);
    COLOR = texture(TEXTURE, tiled_uv);
}