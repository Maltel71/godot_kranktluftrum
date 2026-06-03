shader_type canvas_item;

// Allows you to control the speed and direction from the Inspector
uniform vec2 scroll_speed = vec2(0.0, 0.5);

void fragment() {
    // Offset the UV coordinates based on time and speed
    // TIME is a built-in Godot variable that increments every second
    vec2 shifted_uv = UV + (scroll_speed * TIME);
    
    // Sample the texture using the new shifted UV coordinates
    COLOR = texture(TEXTURE, shifted_uv);
}