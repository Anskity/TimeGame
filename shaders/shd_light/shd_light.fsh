varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D light_surf;

void main()
{
	vec4 base_col = texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 light_col = texture2D(light_surf, v_vTexcoord);
	
	gl_FragColor = base_col * light_col;
}
