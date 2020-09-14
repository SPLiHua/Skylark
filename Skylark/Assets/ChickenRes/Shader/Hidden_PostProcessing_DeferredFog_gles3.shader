//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/PostProcessing/DeferredFog" {
Properties {
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 3737
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in highp vec3 in_POSITION0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _FogColor;
uniform 	vec3 _FogParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0 = (-unity_OrthoParams.w) + 1.0;
    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat3 * _ZBufferParams.x;
    u_xlat0 = u_xlat0 * u_xlat3 + _ZBufferParams.y;
    u_xlat3 = (-unity_OrthoParams.w) * u_xlat3 + 1.0;
    u_xlat0 = u_xlat3 / u_xlat0;
    u_xlat0 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat0 = u_xlat0 * _FogParams.x;
    u_xlat0 = u_xlat0 * (-u_xlat0);
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_1) + _FogColor;
    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in highp vec3 in_POSITION0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _FogColor;
uniform 	vec3 _FogParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0 = (-unity_OrthoParams.w) + 1.0;
    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat3 * _ZBufferParams.x;
    u_xlat0 = u_xlat0 * u_xlat3 + _ZBufferParams.y;
    u_xlat3 = (-unity_OrthoParams.w) * u_xlat3 + 1.0;
    u_xlat0 = u_xlat3 / u_xlat0;
    u_xlat0 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat0 = u_xlat0 * _FogParams.x;
    u_xlat0 = u_xlat0 * (-u_xlat0);
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_1) + _FogColor;
    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in highp vec3 in_POSITION0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _FogColor;
uniform 	vec3 _FogParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0 = (-unity_OrthoParams.w) + 1.0;
    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat3 * _ZBufferParams.x;
    u_xlat0 = u_xlat0 * u_xlat3 + _ZBufferParams.y;
    u_xlat3 = (-unity_OrthoParams.w) * u_xlat3 + 1.0;
    u_xlat0 = u_xlat3 / u_xlat0;
    u_xlat0 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat0 = u_xlat0 * _FogParams.x;
    u_xlat0 = u_xlat0 * (-u_xlat0);
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_1) + _FogColor;
    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in highp vec3 in_POSITION0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _FogColor;
uniform 	vec3 _FogParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0 = (-unity_OrthoParams.w) + 1.0;
    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat3 * _ZBufferParams.x;
    u_xlat0 = u_xlat0 * u_xlat3 + _ZBufferParams.y;
    u_xlat3 = (-unity_OrthoParams.w) * u_xlat3 + 1.0;
    u_xlat0 = u_xlat3 / u_xlat0;
    u_xlat0 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat0 = (-u_xlat0) + _FogParams.z;
    u_xlat3 = (-_FogParams.y) + _FogParams.z;
    u_xlat0 = u_xlat0 / u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_1) + _FogColor;
    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in highp vec3 in_POSITION0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _FogColor;
uniform 	vec3 _FogParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0 = (-unity_OrthoParams.w) + 1.0;
    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat3 * _ZBufferParams.x;
    u_xlat0 = u_xlat0 * u_xlat3 + _ZBufferParams.y;
    u_xlat3 = (-unity_OrthoParams.w) * u_xlat3 + 1.0;
    u_xlat0 = u_xlat3 / u_xlat0;
    u_xlat0 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat0 = (-u_xlat0) + _FogParams.z;
    u_xlat3 = (-_FogParams.y) + _FogParams.z;
    u_xlat0 = u_xlat0 / u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_1) + _FogColor;
    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in highp vec3 in_POSITION0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _FogColor;
uniform 	vec3 _FogParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0 = (-unity_OrthoParams.w) + 1.0;
    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat3 * _ZBufferParams.x;
    u_xlat0 = u_xlat0 * u_xlat3 + _ZBufferParams.y;
    u_xlat3 = (-unity_OrthoParams.w) * u_xlat3 + 1.0;
    u_xlat0 = u_xlat3 / u_xlat0;
    u_xlat0 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat0 = (-u_xlat0) + _FogParams.z;
    u_xlat3 = (-_FogParams.y) + _FogParams.z;
    u_xlat0 = u_xlat0 / u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_1) + _FogColor;
    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat16_1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 123110
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in highp vec3 in_POSITION0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _FogColor;
uniform 	vec3 _FogParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0 = (-unity_OrthoParams.w) + 1.0;
    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat3 * _ZBufferParams.x;
    u_xlat0 = u_xlat0 * u_xlat3 + _ZBufferParams.y;
    u_xlat3 = (-unity_OrthoParams.w) * u_xlat3 + 1.0;
    u_xlat0 = u_xlat3 / u_xlat0;
    u_xlat3 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.999899983);
#else
    u_xlatb0 = u_xlat0<0.999899983;
#endif
    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3 = u_xlat3 * _FogParams.x;
    u_xlat3 = u_xlat3 * (-u_xlat3);
    u_xlat3 = exp2(u_xlat3);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_1) + _FogColor;
    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in highp vec3 in_POSITION0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _FogColor;
uniform 	vec3 _FogParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0 = (-unity_OrthoParams.w) + 1.0;
    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat3 * _ZBufferParams.x;
    u_xlat0 = u_xlat0 * u_xlat3 + _ZBufferParams.y;
    u_xlat3 = (-unity_OrthoParams.w) * u_xlat3 + 1.0;
    u_xlat0 = u_xlat3 / u_xlat0;
    u_xlat3 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.999899983);
#else
    u_xlatb0 = u_xlat0<0.999899983;
#endif
    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3 = u_xlat3 * _FogParams.x;
    u_xlat3 = u_xlat3 * (-u_xlat3);
    u_xlat3 = exp2(u_xlat3);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_1) + _FogColor;
    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in highp vec3 in_POSITION0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _FogColor;
uniform 	vec3 _FogParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0 = (-unity_OrthoParams.w) + 1.0;
    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat3 * _ZBufferParams.x;
    u_xlat0 = u_xlat0 * u_xlat3 + _ZBufferParams.y;
    u_xlat3 = (-unity_OrthoParams.w) * u_xlat3 + 1.0;
    u_xlat0 = u_xlat3 / u_xlat0;
    u_xlat3 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.999899983);
#else
    u_xlatb0 = u_xlat0<0.999899983;
#endif
    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3 = u_xlat3 * _FogParams.x;
    u_xlat3 = u_xlat3 * (-u_xlat3);
    u_xlat3 = exp2(u_xlat3);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_1) + _FogColor;
    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in highp vec3 in_POSITION0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _FogColor;
uniform 	vec3 _FogParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0 = (-unity_OrthoParams.w) + 1.0;
    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat3 * _ZBufferParams.x;
    u_xlat0 = u_xlat0 * u_xlat3 + _ZBufferParams.y;
    u_xlat3 = (-unity_OrthoParams.w) * u_xlat3 + 1.0;
    u_xlat0 = u_xlat3 / u_xlat0;
    u_xlat3 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.999899983);
#else
    u_xlatb0 = u_xlat0<0.999899983;
#endif
    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3 = (-u_xlat3) + _FogParams.z;
    u_xlat6 = (-_FogParams.y) + _FogParams.z;
    u_xlat3 = u_xlat3 / u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_1) + _FogColor;
    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in highp vec3 in_POSITION0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _FogColor;
uniform 	vec3 _FogParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0 = (-unity_OrthoParams.w) + 1.0;
    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat3 * _ZBufferParams.x;
    u_xlat0 = u_xlat0 * u_xlat3 + _ZBufferParams.y;
    u_xlat3 = (-unity_OrthoParams.w) * u_xlat3 + 1.0;
    u_xlat0 = u_xlat3 / u_xlat0;
    u_xlat3 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.999899983);
#else
    u_xlatb0 = u_xlat0<0.999899983;
#endif
    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3 = (-u_xlat3) + _FogParams.z;
    u_xlat6 = (-_FogParams.y) + _FogParams.z;
    u_xlat3 = u_xlat3 / u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_1) + _FogColor;
    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in highp vec3 in_POSITION0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _FogColor;
uniform 	vec3 _FogParams;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0 = (-unity_OrthoParams.w) + 1.0;
    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat3 = u_xlat3 * _ZBufferParams.x;
    u_xlat0 = u_xlat0 * u_xlat3 + _ZBufferParams.y;
    u_xlat3 = (-unity_OrthoParams.w) * u_xlat3 + 1.0;
    u_xlat0 = u_xlat3 / u_xlat0;
    u_xlat3 = u_xlat0 * _ProjectionParams.z + (-_ProjectionParams.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.999899983);
#else
    u_xlatb0 = u_xlat0<0.999899983;
#endif
    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3 = (-u_xlat3) + _FogParams.z;
    u_xlat6 = (-_FogParams.y) + _FogParams.z;
    u_xlat3 = u_xlat3 / u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2 = (-u_xlat16_1) + _FogColor;
    SV_Target0 = vec4(u_xlat0) * u_xlat2 + u_xlat16_1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
}
}
}
}