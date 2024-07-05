#version 460 core

precision lowp float;

#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;

out vec4 fragColor;
void main() { 
    vec2 pos = FlutterFragCoord().xy;

    fragColor = vec4(1.0, 0.0, 1.0, 1.0);
}
