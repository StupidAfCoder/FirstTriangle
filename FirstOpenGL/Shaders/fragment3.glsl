#version 330 core

out vec4 fragColor;

in vec2 myTex;
in vec3 myNormal;
in vec3 fragPos;

uniform vec3 lightPos;
uniform sampler2D myTexture;
uniform vec3 objectColor;
uniform vec3 lightColor;

void main() {
    vec3 norm = normalize(myNormal);
    vec3 lightDir = normalize(lightPos - fragPos);
    float diff = max(dot(norm , lightDir) , 0.0);
    vec3 diffuse = diff * lightColor;
    float ambientStrength = 0.1;
    vec3 ambient = ambientStrength * lightColor;
    vec4 texColor = texture(myTexture , myTex);
    vec3 result = (ambient + diffuse)* objectColor;
    fragColor = vec4(result , 1.0) * texColor;
}