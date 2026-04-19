#version 330 core

out vec4 FragColor;

in vec3 myColor;
in vec2 myTex;

uniform sampler2D myTexture;
uniform sampler2D myOtherTex;

void main() 
{
    FragColor = mix(texture(myTexture , myTex) , texture(myOtherTex , vec2(1.0 - myTex.x , myTex.y)) , 0.2);
}