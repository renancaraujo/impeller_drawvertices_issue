#version 460 core

precision lowp float;

#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;


out vec4 fragColor;
void main() { 
    vec2 pos = FlutterFragCoord().xy / uSize;

    fragColor = vec4(1.0, 0.0, 0.0, pos.y + 1.0 - pos.y);
}
