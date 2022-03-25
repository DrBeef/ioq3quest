attribute vec3 attr_Position;
attribute vec4 attr_TexCoord0;

// Uniforms
layout(shared) uniform ViewMatrices
{
    uniform highp mat4 u_ViewMatrices[NUM_VIEWS];
};
layout(shared) uniform ProjectionMatrix
{
    uniform highp mat4 u_ProjectionMatrix;
};
uniform highp mat4 u_ModelMatrix;

varying vec2   var_TexCoords;


void main()
{
	gl_Position = u_ProjectionMatrix * (u_ViewMatrices[gl_ViewID_OVR] * (u_ModelMatrix * vec4(attr_Position, 1.0)));

	var_TexCoords = attr_TexCoord0.st;
}
