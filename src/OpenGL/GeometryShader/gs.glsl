// gl_in 内置变量，内部结构大概如下
// in gl_Vertex
// {
//     vec4 gl_Position;
//     float gl_PositionSize;
//     float gl_ClipDistance[];
// } gl_in[];

#version 330 core
layout (points) in;
layout (triangle_strip, max_vertices = 3) out;  // 仅仅对于一个顶点着色器的图元

in VS_OUT {
    vec3 color;
} gs_in[];

out vec3 fColor;

void build_triangle(vec4 position)
{    
    fColor = gs_in[0].color; // gs_in[0] since there's only one input vertex
    gl_Position = position + vec4(0.0, 0.3, 0.0, 0.0);
    EmitVertex();   
    gl_Position = position + vec4( -0.2, -0.1, 0.0, 0.0);
    EmitVertex();
    gl_Position = position + vec4(0.2, -0.1, 0.0, 0.0);
    EmitVertex();
    EndPrimitive();
}

void main() {    
    build_triangle(gl_in[0].gl_Position);
}