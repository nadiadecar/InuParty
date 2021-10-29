shader_type canvas_item;

uniform vec4 color : hint_color;
uniform float width;
uniform bool active;

void fragment() {
	vec4 texture_color = texture(TEXTURE, UV + vec2(0.0, TEXTURE_PIXEL_SIZE.y));
	
	if (active) {
		vec4 up = texture(TEXTURE, UV - vec2(0.0, TEXTURE_PIXEL_SIZE.y) * width + vec2(0.0, TEXTURE_PIXEL_SIZE.y));
		vec4 down = texture(TEXTURE, UV + vec2(0.0, TEXTURE_PIXEL_SIZE.y) * width + vec2(0.0, TEXTURE_PIXEL_SIZE.y));
		vec4 left = texture(TEXTURE, UV - vec2(TEXTURE_PIXEL_SIZE.x, 0.0) * width + vec2(0.0, TEXTURE_PIXEL_SIZE.y));
		vec4 right = texture(TEXTURE, UV + vec2(TEXTURE_PIXEL_SIZE.x, 0.0) * width + vec2(0.0, TEXTURE_PIXEL_SIZE.y));

		float max_a = max(up.a, max(down.a, max(left.a, right.a)));
		
		COLOR.rgb = color.rgb;
		COLOR = mix(texture_color, color, (1.0 - texture_color.a) * max_a);
	} else {
		COLOR = texture_color;
	}
}