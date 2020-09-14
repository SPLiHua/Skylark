//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/PostProcessing/FinalPass" {
Properties {
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 45002
Program "vp" {
}
Program "fp" {
}
}
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 73575
Program "vp" {
}
Program "fp" {
}
}
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 154787
}
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 261448
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Dithering_Coords;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_0 = texture2D(_DitheringTex, u_xlat0.xy).w;
    u_xlat16_0 = u_xlat10_0 * 2.0 + -1.0;
    u_xlat16_2 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = u_xlat16_0 * 3.40282347e+38 + 0.5;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = (-u_xlat16_2) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Dithering_Coords;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_0 = texture2D(_DitheringTex, u_xlat0.xy).w;
    u_xlat16_0 = u_xlat10_0 * 2.0 + -1.0;
    u_xlat16_2 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = u_xlat16_0 * 3.40282347e+38 + 0.5;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = (-u_xlat16_2) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Dithering_Coords;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_0 = texture2D(_DitheringTex, u_xlat0.xy).w;
    u_xlat16_0 = u_xlat10_0 * 2.0 + -1.0;
    u_xlat16_2 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = u_xlat16_0 * 3.40282347e+38 + 0.5;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = (-u_xlat16_2) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Dithering_Coords;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_0 = texture2D(_DitheringTex, u_xlat0.xy).w;
    u_xlat16_0 = u_xlat10_0 * 2.0 + -1.0;
    u_xlat16_2 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = u_xlat16_0 * 3.40282347e+38 + 0.5;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = (-u_xlat16_2) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Dithering_Coords;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_0 = texture2D(_DitheringTex, u_xlat0.xy).w;
    u_xlat16_0 = u_xlat10_0 * 2.0 + -1.0;
    u_xlat16_2 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = u_xlat16_0 * 3.40282347e+38 + 0.5;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = (-u_xlat16_2) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Dithering_Coords;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_0 = texture2D(_DitheringTex, u_xlat0.xy).w;
    u_xlat16_0 = u_xlat10_0 * 2.0 + -1.0;
    u_xlat16_2 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = u_xlat16_0 * 3.40282347e+38 + 0.5;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = (-u_xlat16_2) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA_KEEP_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Dithering_Coords;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_0 = texture2D(_DitheringTex, u_xlat0.xy).w;
    u_xlat16_0 = u_xlat10_0 * 2.0 + -1.0;
    u_xlat16_2 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = u_xlat16_0 * 3.40282347e+38 + 0.5;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = (-u_xlat16_2) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA_KEEP_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Dithering_Coords;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_0 = texture2D(_DitheringTex, u_xlat0.xy).w;
    u_xlat16_0 = u_xlat10_0 * 2.0 + -1.0;
    u_xlat16_2 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = u_xlat16_0 * 3.40282347e+38 + 0.5;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = (-u_xlat16_2) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA_KEEP_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Dithering_Coords;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_0 = texture2D(_DitheringTex, u_xlat0.xy).w;
    u_xlat16_0 = u_xlat10_0 * 2.0 + -1.0;
    u_xlat16_2 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = u_xlat16_0 * 3.40282347e+38 + 0.5;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = (-u_xlat16_2) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA_KEEP_ALPHA" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Dithering_Coords;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_0 = texture2D(_DitheringTex, u_xlat0.xy).w;
    u_xlat16_0 = u_xlat10_0 * 2.0 + -1.0;
    u_xlat16_2 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = u_xlat16_0 * 3.40282347e+38 + 0.5;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = (-u_xlat16_2) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA_KEEP_ALPHA" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Dithering_Coords;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_0 = texture2D(_DitheringTex, u_xlat0.xy).w;
    u_xlat16_0 = u_xlat10_0 * 2.0 + -1.0;
    u_xlat16_2 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = u_xlat16_0 * 3.40282347e+38 + 0.5;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = (-u_xlat16_2) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA_KEEP_ALPHA" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Dithering_Coords;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_0 = texture2D(_DitheringTex, u_xlat0.xy).w;
    u_xlat16_0 = u_xlat10_0 * 2.0 + -1.0;
    u_xlat16_2 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = u_xlat16_0 * 3.40282347e+38 + 0.5;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat16_2 = sqrt(u_xlat16_2);
    u_xlat16_2 = (-u_xlat16_2) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_0;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    SV_Target0.xyz = vec3(u_xlat16_0) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
ivec4 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
int u_xlati8;
bool u_xlatb8;
vec2 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
mediump float u_xlat16_14;
lowp float u_xlat10_14;
bool u_xlatb14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
vec2 u_xlat16;
float u_xlat19;
float u_xlat20;
mediump float u_xlat16_20;
lowp float u_xlat10_20;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat22;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0);
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).w;
    u_xlat1.y = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).w;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat1.z = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).w;
    u_xlat1.w = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).w;
    u_xlat2.x = max(u_xlat0.w, u_xlat1.x);
    u_xlat8.x = min(u_xlat0.w, u_xlat1.x);
    u_xlat2.x = max(u_xlat1.y, u_xlat2.x);
    u_xlat8.x = min(u_xlat1.y, u_xlat8.x);
    u_xlat14.x = max(u_xlat1.w, u_xlat1.z);
    u_xlat20 = min(u_xlat1.w, u_xlat1.z);
    u_xlat2.x = max(u_xlat2.x, u_xlat14.x);
    u_xlat8.x = min(u_xlat8.x, u_xlat20);
    u_xlat14.x = u_xlat2.x * 0.063000001;
    u_xlat2.x = (-u_xlat8.x) + u_xlat2.x;
    u_xlat8.x = max(u_xlat14.x, 0.0311999992);
    u_xlatb8 = u_xlat2.x>=u_xlat8.x;
    if(u_xlatb8){
        u_xlat8.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_8 = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).w;
        u_xlat14.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat14.xy, 0.0).w;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_20 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).w;
        u_xlat10_3 = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).w;
        u_xlat9.xy = u_xlat1.xy + u_xlat1.zw;
        u_xlat2.x = float(1.0) / u_xlat2.x;
        u_xlat21 = u_xlat9.y + u_xlat9.x;
        u_xlat9.x = u_xlat0.w * -2.0 + u_xlat9.x;
        u_xlat15.x = u_xlat0.w * -2.0 + u_xlat9.y;
        u_xlat16_4 = u_xlat10_14 + u_xlat10_20;
        u_xlat16_20 = u_xlat10_20 + u_xlat10_8;
        u_xlat10.x = u_xlat1.y * -2.0 + u_xlat16_4;
        u_xlat20 = u_xlat1.z * -2.0 + u_xlat16_20;
        u_xlat16_8 = u_xlat10_8 + u_xlat10_3;
        u_xlat16_14 = u_xlat10_14 + u_xlat10_3;
        u_xlat3.x = abs(u_xlat9.x) * 2.0 + abs(u_xlat10.x);
        u_xlat20 = abs(u_xlat15.x) * 2.0 + abs(u_xlat20);
        u_xlat9.x = u_xlat1.w * -2.0 + u_xlat16_8;
        u_xlat14.x = u_xlat1.x * -2.0 + u_xlat16_14;
        u_xlat3.x = u_xlat3.x + abs(u_xlat9.x);
        u_xlat14.x = u_xlat20 + abs(u_xlat14.x);
        u_xlat16_8 = u_xlat16_4 + u_xlat16_8;
        u_xlatb14 = u_xlat3.x>=u_xlat14.x;
        u_xlat8.x = u_xlat21 * 2.0 + u_xlat16_8;
        u_xlat1.xz = (bool(u_xlatb14)) ? u_xlat1.xz : u_xlat1.yw;
        u_xlat7 = (u_xlatb14) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat19 = u_xlat8.x * 0.0833333358 + (-u_xlat0.w);
        u_xlat8.xz = (-u_xlat0.ww) + u_xlat1.zx;
        u_xlat1.xz = u_xlat0.ww + u_xlat1.xz;
        u_xlatb3 = abs(u_xlat8.x)>=abs(u_xlat8.z);
        u_xlat8.x = max(abs(u_xlat8.z), abs(u_xlat8.x));
        u_xlat7 = (u_xlatb3) ? (-u_xlat7) : u_xlat7;
        u_xlat19 = u_xlat2.x * abs(u_xlat19);
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
        u_xlat2.x = u_xlatb14 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat2.w = (u_xlatb14) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat9.xy = vec2(u_xlat7) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat9.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat9.x;
        u_xlat9.y = (u_xlatb14) ? u_xlat9.y : vs_TEXCOORD0.y;
        u_xlat4.xy = (-u_xlat2.xw) + u_xlat9.xy;
        u_xlat5.xy = u_xlat2.xw + u_xlat9.xy;
        u_xlat9.x = u_xlat19 * -2.0 + 3.0;
        u_xlat15.xy = u_xlat4.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).w;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat16.xy = u_xlat5.xy;
        u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
        u_xlat16.xy = u_xlat16.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_21 = texture2DLodEXT(_MainTex, u_xlat16.xy, 0.0).w;
        u_xlat1.x = (u_xlatb3) ? u_xlat1.z : u_xlat1.x;
        u_xlat13 = u_xlat8.x * 0.25;
        u_xlat8.x = (-u_xlat1.x) * 0.5 + u_xlat0.w;
        u_xlat19 = u_xlat19 * u_xlat9.x;
        u_xlati8 = int((u_xlat8.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat1.x) * 0.5 + u_xlat10_15;
        u_xlat3.y = (-u_xlat1.x) * 0.5 + u_xlat10_21;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
        u_xlat16.x = (-u_xlat2.x) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat16.x;
        u_xlat22 = (-u_xlat2.w) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat22;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat22 = u_xlat2.x * 1.5 + u_xlat5.x;
        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
        u_xlat22 = u_xlat2.w * 1.5 + u_xlat5.y;
        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat22;
        if(u_xlati10.x != 0) {
            if(u_xlati15.x == 0) {
                u_xlat10.xz = u_xlat4.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            if(u_xlati15.y == 0) {
                u_xlat10.xz = u_xlat5.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
            u_xlati10.xz = op_not(u_xlati15.xy);
            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
            if(u_xlati10.x != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat10.xz = u_xlat4.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                if(u_xlati15.y == 0) {
                    u_xlat10.xz = u_xlat5.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                u_xlati10.xz = op_not(u_xlati15.xy);
                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                if(u_xlati10.x != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat10.xz = u_xlat4.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat10.xz = u_xlat5.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                    u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                    u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                    u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                    u_xlati10.xz = op_not(u_xlati15.xy);
                    u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                    u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                    u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                    u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                    u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                    if(u_xlati10.x != 0) {
                        if(u_xlati15.x == 0) {
                            u_xlat10.xz = u_xlat4.xz;
                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                        }
                        if(u_xlati15.y == 0) {
                            u_xlat10.xz = u_xlat5.xz;
                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                        }
                        u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                        u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                        u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                        u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                        u_xlati10.xz = op_not(u_xlati15.xy);
                        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                        u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                        u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                        if(u_xlati10.x != 0) {
                            if(u_xlati15.x == 0) {
                                u_xlat10.xz = u_xlat4.xz;
                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                            }
                            if(u_xlati15.y == 0) {
                                u_xlat10.xz = u_xlat5.xz;
                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                            }
                            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                            u_xlati10.xz = op_not(u_xlati15.xy);
                            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                            if(u_xlati10.x != 0) {
                                if(u_xlati15.x == 0) {
                                    u_xlat10.xz = u_xlat4.xz;
                                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                }
                                if(u_xlati15.y == 0) {
                                    u_xlat10.xz = u_xlat5.xz;
                                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                }
                                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                u_xlati10.xz = op_not(u_xlati15.xy);
                                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                if(u_xlati10.x != 0) {
                                    if(u_xlati15.x == 0) {
                                        u_xlat10.xz = u_xlat4.xz;
                                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                    }
                                    if(u_xlati15.y == 0) {
                                        u_xlat10.xz = u_xlat5.xz;
                                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                    }
                                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                    u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                    u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                    u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                    u_xlati10.xz = op_not(u_xlati15.xy);
                                    u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                    u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                                    u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                    u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                                    u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                    if(u_xlati10.x != 0) {
                                        if(u_xlati15.x == 0) {
                                            u_xlat10.xz = u_xlat4.xz;
                                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                        }
                                        if(u_xlati15.y == 0) {
                                            u_xlat10.xz = u_xlat5.xz;
                                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                        }
                                        u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                        u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                        u_xlat10.x = (-u_xlat2.x) * 4.0 + u_xlat4.x;
                                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                        u_xlat10.x = (-u_xlat2.w) * 4.0 + u_xlat4.z;
                                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                        u_xlati10.xz = op_not(u_xlati15.xy);
                                        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                        u_xlat22 = u_xlat2.x * 4.0 + u_xlat5.x;
                                        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                        u_xlat22 = u_xlat2.w * 4.0 + u_xlat5.z;
                                        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                        if(u_xlati10.x != 0) {
                                            if(u_xlati15.x == 0) {
                                                u_xlat10.xz = u_xlat4.xz;
                                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                            }
                                            if(u_xlati15.y == 0) {
                                                u_xlat10.xz = u_xlat5.xz;
                                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                            }
                                            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                            u_xlat1.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat1.x;
                                            u_xlatb1.xz = greaterThanEqual(abs(u_xlat3.xxyx), vec4(u_xlat13)).xz;
                                            u_xlat15.x = (-u_xlat2.x) * 8.0 + u_xlat4.x;
                                            u_xlat4.x = (u_xlatb1.x) ? u_xlat4.x : u_xlat15.x;
                                            u_xlat15.x = (-u_xlat2.w) * 8.0 + u_xlat4.z;
                                            u_xlat4.z = (u_xlatb1.x) ? u_xlat4.z : u_xlat15.x;
                                            u_xlat1.x = u_xlat2.x * 8.0 + u_xlat5.x;
                                            u_xlat5.x = (u_xlatb1.z) ? u_xlat5.x : u_xlat1.x;
                                            u_xlat1.x = u_xlat2.w * 8.0 + u_xlat5.z;
                                            u_xlat5.z = (u_xlatb1.z) ? u_xlat5.z : u_xlat1.x;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        u_xlat1.x = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat13 = u_xlat5.x + (-vs_TEXCOORD0.x);
        u_xlat2.x = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat1.x = (u_xlatb14) ? u_xlat1.x : u_xlat2.x;
        u_xlat2.x = u_xlat5.z + (-vs_TEXCOORD0.y);
        u_xlat13 = (u_xlatb14) ? u_xlat13 : u_xlat2.x;
        u_xlati2.xw = ivec2(ivec2(lessThan(u_xlat3.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw) * -1);
        u_xlat3.x = u_xlat1.x + u_xlat13;
        u_xlatb2.xy = notEqual(ivec4(u_xlati8), u_xlati2.xwxx).xy;
        u_xlat20 = float(1.0) / u_xlat3.x;
        u_xlatb3 = u_xlat1.x<u_xlat13;
        u_xlat1.x = min(u_xlat13, u_xlat1.x);
        u_xlatb13 = (u_xlatb3) ? u_xlatb2.x : u_xlatb2.y;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat1.x = u_xlat1.x * (-u_xlat20) + 0.5;
        u_xlat1.x = u_xlatb13 ? u_xlat1.x : float(0.0);
        u_xlat1.x = max(u_xlat19, u_xlat1.x);
        u_xlat1.xy = u_xlat1.xx * vec2(u_xlat7) + vs_TEXCOORD0.xy;
        u_xlat2.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
        u_xlat2.y = (u_xlatb14) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
ivec4 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
int u_xlati8;
bool u_xlatb8;
vec2 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
mediump float u_xlat16_14;
lowp float u_xlat10_14;
bool u_xlatb14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
vec2 u_xlat16;
float u_xlat19;
float u_xlat20;
mediump float u_xlat16_20;
lowp float u_xlat10_20;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat22;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0);
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).w;
    u_xlat1.y = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).w;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat1.z = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).w;
    u_xlat1.w = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).w;
    u_xlat2.x = max(u_xlat0.w, u_xlat1.x);
    u_xlat8.x = min(u_xlat0.w, u_xlat1.x);
    u_xlat2.x = max(u_xlat1.y, u_xlat2.x);
    u_xlat8.x = min(u_xlat1.y, u_xlat8.x);
    u_xlat14.x = max(u_xlat1.w, u_xlat1.z);
    u_xlat20 = min(u_xlat1.w, u_xlat1.z);
    u_xlat2.x = max(u_xlat2.x, u_xlat14.x);
    u_xlat8.x = min(u_xlat8.x, u_xlat20);
    u_xlat14.x = u_xlat2.x * 0.063000001;
    u_xlat2.x = (-u_xlat8.x) + u_xlat2.x;
    u_xlat8.x = max(u_xlat14.x, 0.0311999992);
    u_xlatb8 = u_xlat2.x>=u_xlat8.x;
    if(u_xlatb8){
        u_xlat8.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_8 = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).w;
        u_xlat14.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat14.xy, 0.0).w;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_20 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).w;
        u_xlat10_3 = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).w;
        u_xlat9.xy = u_xlat1.xy + u_xlat1.zw;
        u_xlat2.x = float(1.0) / u_xlat2.x;
        u_xlat21 = u_xlat9.y + u_xlat9.x;
        u_xlat9.x = u_xlat0.w * -2.0 + u_xlat9.x;
        u_xlat15.x = u_xlat0.w * -2.0 + u_xlat9.y;
        u_xlat16_4 = u_xlat10_14 + u_xlat10_20;
        u_xlat16_20 = u_xlat10_20 + u_xlat10_8;
        u_xlat10.x = u_xlat1.y * -2.0 + u_xlat16_4;
        u_xlat20 = u_xlat1.z * -2.0 + u_xlat16_20;
        u_xlat16_8 = u_xlat10_8 + u_xlat10_3;
        u_xlat16_14 = u_xlat10_14 + u_xlat10_3;
        u_xlat3.x = abs(u_xlat9.x) * 2.0 + abs(u_xlat10.x);
        u_xlat20 = abs(u_xlat15.x) * 2.0 + abs(u_xlat20);
        u_xlat9.x = u_xlat1.w * -2.0 + u_xlat16_8;
        u_xlat14.x = u_xlat1.x * -2.0 + u_xlat16_14;
        u_xlat3.x = u_xlat3.x + abs(u_xlat9.x);
        u_xlat14.x = u_xlat20 + abs(u_xlat14.x);
        u_xlat16_8 = u_xlat16_4 + u_xlat16_8;
        u_xlatb14 = u_xlat3.x>=u_xlat14.x;
        u_xlat8.x = u_xlat21 * 2.0 + u_xlat16_8;
        u_xlat1.xz = (bool(u_xlatb14)) ? u_xlat1.xz : u_xlat1.yw;
        u_xlat7 = (u_xlatb14) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat19 = u_xlat8.x * 0.0833333358 + (-u_xlat0.w);
        u_xlat8.xz = (-u_xlat0.ww) + u_xlat1.zx;
        u_xlat1.xz = u_xlat0.ww + u_xlat1.xz;
        u_xlatb3 = abs(u_xlat8.x)>=abs(u_xlat8.z);
        u_xlat8.x = max(abs(u_xlat8.z), abs(u_xlat8.x));
        u_xlat7 = (u_xlatb3) ? (-u_xlat7) : u_xlat7;
        u_xlat19 = u_xlat2.x * abs(u_xlat19);
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
        u_xlat2.x = u_xlatb14 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat2.w = (u_xlatb14) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat9.xy = vec2(u_xlat7) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat9.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat9.x;
        u_xlat9.y = (u_xlatb14) ? u_xlat9.y : vs_TEXCOORD0.y;
        u_xlat4.xy = (-u_xlat2.xw) + u_xlat9.xy;
        u_xlat5.xy = u_xlat2.xw + u_xlat9.xy;
        u_xlat9.x = u_xlat19 * -2.0 + 3.0;
        u_xlat15.xy = u_xlat4.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).w;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat16.xy = u_xlat5.xy;
        u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
        u_xlat16.xy = u_xlat16.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_21 = texture2DLodEXT(_MainTex, u_xlat16.xy, 0.0).w;
        u_xlat1.x = (u_xlatb3) ? u_xlat1.z : u_xlat1.x;
        u_xlat13 = u_xlat8.x * 0.25;
        u_xlat8.x = (-u_xlat1.x) * 0.5 + u_xlat0.w;
        u_xlat19 = u_xlat19 * u_xlat9.x;
        u_xlati8 = int((u_xlat8.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat1.x) * 0.5 + u_xlat10_15;
        u_xlat3.y = (-u_xlat1.x) * 0.5 + u_xlat10_21;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
        u_xlat16.x = (-u_xlat2.x) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat16.x;
        u_xlat22 = (-u_xlat2.w) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat22;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat22 = u_xlat2.x * 1.5 + u_xlat5.x;
        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
        u_xlat22 = u_xlat2.w * 1.5 + u_xlat5.y;
        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat22;
        if(u_xlati10.x != 0) {
            if(u_xlati15.x == 0) {
                u_xlat10.xz = u_xlat4.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            if(u_xlati15.y == 0) {
                u_xlat10.xz = u_xlat5.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
            u_xlati10.xz = op_not(u_xlati15.xy);
            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
            if(u_xlati10.x != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat10.xz = u_xlat4.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                if(u_xlati15.y == 0) {
                    u_xlat10.xz = u_xlat5.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                u_xlati10.xz = op_not(u_xlati15.xy);
                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                if(u_xlati10.x != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat10.xz = u_xlat4.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat10.xz = u_xlat5.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                    u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                    u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                    u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                    u_xlati10.xz = op_not(u_xlati15.xy);
                    u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                    u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                    u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                    u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                    u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                    if(u_xlati10.x != 0) {
                        if(u_xlati15.x == 0) {
                            u_xlat10.xz = u_xlat4.xz;
                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                        }
                        if(u_xlati15.y == 0) {
                            u_xlat10.xz = u_xlat5.xz;
                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                        }
                        u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                        u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                        u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                        u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                        u_xlati10.xz = op_not(u_xlati15.xy);
                        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                        u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                        u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                        if(u_xlati10.x != 0) {
                            if(u_xlati15.x == 0) {
                                u_xlat10.xz = u_xlat4.xz;
                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                            }
                            if(u_xlati15.y == 0) {
                                u_xlat10.xz = u_xlat5.xz;
                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                            }
                            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                            u_xlati10.xz = op_not(u_xlati15.xy);
                            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                            if(u_xlati10.x != 0) {
                                if(u_xlati15.x == 0) {
                                    u_xlat10.xz = u_xlat4.xz;
                                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                }
                                if(u_xlati15.y == 0) {
                                    u_xlat10.xz = u_xlat5.xz;
                                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                }
                                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                u_xlati10.xz = op_not(u_xlati15.xy);
                                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                if(u_xlati10.x != 0) {
                                    if(u_xlati15.x == 0) {
                                        u_xlat10.xz = u_xlat4.xz;
                                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                    }
                                    if(u_xlati15.y == 0) {
                                        u_xlat10.xz = u_xlat5.xz;
                                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                    }
                                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                    u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                    u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                    u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                    u_xlati10.xz = op_not(u_xlati15.xy);
                                    u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                    u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                                    u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                    u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                                    u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                    if(u_xlati10.x != 0) {
                                        if(u_xlati15.x == 0) {
                                            u_xlat10.xz = u_xlat4.xz;
                                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                        }
                                        if(u_xlati15.y == 0) {
                                            u_xlat10.xz = u_xlat5.xz;
                                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                        }
                                        u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                        u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                        u_xlat10.x = (-u_xlat2.x) * 4.0 + u_xlat4.x;
                                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                        u_xlat10.x = (-u_xlat2.w) * 4.0 + u_xlat4.z;
                                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                        u_xlati10.xz = op_not(u_xlati15.xy);
                                        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                        u_xlat22 = u_xlat2.x * 4.0 + u_xlat5.x;
                                        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                        u_xlat22 = u_xlat2.w * 4.0 + u_xlat5.z;
                                        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                        if(u_xlati10.x != 0) {
                                            if(u_xlati15.x == 0) {
                                                u_xlat10.xz = u_xlat4.xz;
                                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                            }
                                            if(u_xlati15.y == 0) {
                                                u_xlat10.xz = u_xlat5.xz;
                                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                            }
                                            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                            u_xlat1.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat1.x;
                                            u_xlatb1.xz = greaterThanEqual(abs(u_xlat3.xxyx), vec4(u_xlat13)).xz;
                                            u_xlat15.x = (-u_xlat2.x) * 8.0 + u_xlat4.x;
                                            u_xlat4.x = (u_xlatb1.x) ? u_xlat4.x : u_xlat15.x;
                                            u_xlat15.x = (-u_xlat2.w) * 8.0 + u_xlat4.z;
                                            u_xlat4.z = (u_xlatb1.x) ? u_xlat4.z : u_xlat15.x;
                                            u_xlat1.x = u_xlat2.x * 8.0 + u_xlat5.x;
                                            u_xlat5.x = (u_xlatb1.z) ? u_xlat5.x : u_xlat1.x;
                                            u_xlat1.x = u_xlat2.w * 8.0 + u_xlat5.z;
                                            u_xlat5.z = (u_xlatb1.z) ? u_xlat5.z : u_xlat1.x;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        u_xlat1.x = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat13 = u_xlat5.x + (-vs_TEXCOORD0.x);
        u_xlat2.x = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat1.x = (u_xlatb14) ? u_xlat1.x : u_xlat2.x;
        u_xlat2.x = u_xlat5.z + (-vs_TEXCOORD0.y);
        u_xlat13 = (u_xlatb14) ? u_xlat13 : u_xlat2.x;
        u_xlati2.xw = ivec2(ivec2(lessThan(u_xlat3.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw) * -1);
        u_xlat3.x = u_xlat1.x + u_xlat13;
        u_xlatb2.xy = notEqual(ivec4(u_xlati8), u_xlati2.xwxx).xy;
        u_xlat20 = float(1.0) / u_xlat3.x;
        u_xlatb3 = u_xlat1.x<u_xlat13;
        u_xlat1.x = min(u_xlat13, u_xlat1.x);
        u_xlatb13 = (u_xlatb3) ? u_xlatb2.x : u_xlatb2.y;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat1.x = u_xlat1.x * (-u_xlat20) + 0.5;
        u_xlat1.x = u_xlatb13 ? u_xlat1.x : float(0.0);
        u_xlat1.x = max(u_xlat19, u_xlat1.x);
        u_xlat1.xy = u_xlat1.xx * vec2(u_xlat7) + vs_TEXCOORD0.xy;
        u_xlat2.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
        u_xlat2.y = (u_xlatb14) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
ivec4 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
int u_xlati8;
bool u_xlatb8;
vec2 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
mediump float u_xlat16_14;
lowp float u_xlat10_14;
bool u_xlatb14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
vec2 u_xlat16;
float u_xlat19;
float u_xlat20;
mediump float u_xlat16_20;
lowp float u_xlat10_20;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat22;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0);
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).w;
    u_xlat1.y = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).w;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat1.z = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).w;
    u_xlat1.w = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).w;
    u_xlat2.x = max(u_xlat0.w, u_xlat1.x);
    u_xlat8.x = min(u_xlat0.w, u_xlat1.x);
    u_xlat2.x = max(u_xlat1.y, u_xlat2.x);
    u_xlat8.x = min(u_xlat1.y, u_xlat8.x);
    u_xlat14.x = max(u_xlat1.w, u_xlat1.z);
    u_xlat20 = min(u_xlat1.w, u_xlat1.z);
    u_xlat2.x = max(u_xlat2.x, u_xlat14.x);
    u_xlat8.x = min(u_xlat8.x, u_xlat20);
    u_xlat14.x = u_xlat2.x * 0.063000001;
    u_xlat2.x = (-u_xlat8.x) + u_xlat2.x;
    u_xlat8.x = max(u_xlat14.x, 0.0311999992);
    u_xlatb8 = u_xlat2.x>=u_xlat8.x;
    if(u_xlatb8){
        u_xlat8.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_8 = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).w;
        u_xlat14.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat14.xy, 0.0).w;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_20 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).w;
        u_xlat10_3 = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).w;
        u_xlat9.xy = u_xlat1.xy + u_xlat1.zw;
        u_xlat2.x = float(1.0) / u_xlat2.x;
        u_xlat21 = u_xlat9.y + u_xlat9.x;
        u_xlat9.x = u_xlat0.w * -2.0 + u_xlat9.x;
        u_xlat15.x = u_xlat0.w * -2.0 + u_xlat9.y;
        u_xlat16_4 = u_xlat10_14 + u_xlat10_20;
        u_xlat16_20 = u_xlat10_20 + u_xlat10_8;
        u_xlat10.x = u_xlat1.y * -2.0 + u_xlat16_4;
        u_xlat20 = u_xlat1.z * -2.0 + u_xlat16_20;
        u_xlat16_8 = u_xlat10_8 + u_xlat10_3;
        u_xlat16_14 = u_xlat10_14 + u_xlat10_3;
        u_xlat3.x = abs(u_xlat9.x) * 2.0 + abs(u_xlat10.x);
        u_xlat20 = abs(u_xlat15.x) * 2.0 + abs(u_xlat20);
        u_xlat9.x = u_xlat1.w * -2.0 + u_xlat16_8;
        u_xlat14.x = u_xlat1.x * -2.0 + u_xlat16_14;
        u_xlat3.x = u_xlat3.x + abs(u_xlat9.x);
        u_xlat14.x = u_xlat20 + abs(u_xlat14.x);
        u_xlat16_8 = u_xlat16_4 + u_xlat16_8;
        u_xlatb14 = u_xlat3.x>=u_xlat14.x;
        u_xlat8.x = u_xlat21 * 2.0 + u_xlat16_8;
        u_xlat1.xz = (bool(u_xlatb14)) ? u_xlat1.xz : u_xlat1.yw;
        u_xlat7 = (u_xlatb14) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat19 = u_xlat8.x * 0.0833333358 + (-u_xlat0.w);
        u_xlat8.xz = (-u_xlat0.ww) + u_xlat1.zx;
        u_xlat1.xz = u_xlat0.ww + u_xlat1.xz;
        u_xlatb3 = abs(u_xlat8.x)>=abs(u_xlat8.z);
        u_xlat8.x = max(abs(u_xlat8.z), abs(u_xlat8.x));
        u_xlat7 = (u_xlatb3) ? (-u_xlat7) : u_xlat7;
        u_xlat19 = u_xlat2.x * abs(u_xlat19);
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
        u_xlat2.x = u_xlatb14 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat2.w = (u_xlatb14) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat9.xy = vec2(u_xlat7) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat9.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat9.x;
        u_xlat9.y = (u_xlatb14) ? u_xlat9.y : vs_TEXCOORD0.y;
        u_xlat4.xy = (-u_xlat2.xw) + u_xlat9.xy;
        u_xlat5.xy = u_xlat2.xw + u_xlat9.xy;
        u_xlat9.x = u_xlat19 * -2.0 + 3.0;
        u_xlat15.xy = u_xlat4.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).w;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat16.xy = u_xlat5.xy;
        u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
        u_xlat16.xy = u_xlat16.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_21 = texture2DLodEXT(_MainTex, u_xlat16.xy, 0.0).w;
        u_xlat1.x = (u_xlatb3) ? u_xlat1.z : u_xlat1.x;
        u_xlat13 = u_xlat8.x * 0.25;
        u_xlat8.x = (-u_xlat1.x) * 0.5 + u_xlat0.w;
        u_xlat19 = u_xlat19 * u_xlat9.x;
        u_xlati8 = int((u_xlat8.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat1.x) * 0.5 + u_xlat10_15;
        u_xlat3.y = (-u_xlat1.x) * 0.5 + u_xlat10_21;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
        u_xlat16.x = (-u_xlat2.x) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat16.x;
        u_xlat22 = (-u_xlat2.w) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat22;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat22 = u_xlat2.x * 1.5 + u_xlat5.x;
        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
        u_xlat22 = u_xlat2.w * 1.5 + u_xlat5.y;
        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat22;
        if(u_xlati10.x != 0) {
            if(u_xlati15.x == 0) {
                u_xlat10.xz = u_xlat4.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            if(u_xlati15.y == 0) {
                u_xlat10.xz = u_xlat5.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
            u_xlati10.xz = op_not(u_xlati15.xy);
            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
            if(u_xlati10.x != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat10.xz = u_xlat4.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                if(u_xlati15.y == 0) {
                    u_xlat10.xz = u_xlat5.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                u_xlati10.xz = op_not(u_xlati15.xy);
                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                if(u_xlati10.x != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat10.xz = u_xlat4.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat10.xz = u_xlat5.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                    u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                    u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                    u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                    u_xlati10.xz = op_not(u_xlati15.xy);
                    u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                    u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                    u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                    u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                    u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                    if(u_xlati10.x != 0) {
                        if(u_xlati15.x == 0) {
                            u_xlat10.xz = u_xlat4.xz;
                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                        }
                        if(u_xlati15.y == 0) {
                            u_xlat10.xz = u_xlat5.xz;
                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                        }
                        u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                        u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                        u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                        u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                        u_xlati10.xz = op_not(u_xlati15.xy);
                        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                        u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                        u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                        if(u_xlati10.x != 0) {
                            if(u_xlati15.x == 0) {
                                u_xlat10.xz = u_xlat4.xz;
                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                            }
                            if(u_xlati15.y == 0) {
                                u_xlat10.xz = u_xlat5.xz;
                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                            }
                            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                            u_xlati10.xz = op_not(u_xlati15.xy);
                            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                            if(u_xlati10.x != 0) {
                                if(u_xlati15.x == 0) {
                                    u_xlat10.xz = u_xlat4.xz;
                                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                }
                                if(u_xlati15.y == 0) {
                                    u_xlat10.xz = u_xlat5.xz;
                                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                }
                                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                u_xlati10.xz = op_not(u_xlati15.xy);
                                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                if(u_xlati10.x != 0) {
                                    if(u_xlati15.x == 0) {
                                        u_xlat10.xz = u_xlat4.xz;
                                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                    }
                                    if(u_xlati15.y == 0) {
                                        u_xlat10.xz = u_xlat5.xz;
                                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                    }
                                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                    u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                    u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                    u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                    u_xlati10.xz = op_not(u_xlati15.xy);
                                    u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                    u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                                    u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                    u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                                    u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                    if(u_xlati10.x != 0) {
                                        if(u_xlati15.x == 0) {
                                            u_xlat10.xz = u_xlat4.xz;
                                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                        }
                                        if(u_xlati15.y == 0) {
                                            u_xlat10.xz = u_xlat5.xz;
                                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                        }
                                        u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                        u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                        u_xlat10.x = (-u_xlat2.x) * 4.0 + u_xlat4.x;
                                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                        u_xlat10.x = (-u_xlat2.w) * 4.0 + u_xlat4.z;
                                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                        u_xlati10.xz = op_not(u_xlati15.xy);
                                        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                        u_xlat22 = u_xlat2.x * 4.0 + u_xlat5.x;
                                        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                        u_xlat22 = u_xlat2.w * 4.0 + u_xlat5.z;
                                        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                        if(u_xlati10.x != 0) {
                                            if(u_xlati15.x == 0) {
                                                u_xlat10.xz = u_xlat4.xz;
                                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                            }
                                            if(u_xlati15.y == 0) {
                                                u_xlat10.xz = u_xlat5.xz;
                                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                            }
                                            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                            u_xlat1.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat1.x;
                                            u_xlatb1.xz = greaterThanEqual(abs(u_xlat3.xxyx), vec4(u_xlat13)).xz;
                                            u_xlat15.x = (-u_xlat2.x) * 8.0 + u_xlat4.x;
                                            u_xlat4.x = (u_xlatb1.x) ? u_xlat4.x : u_xlat15.x;
                                            u_xlat15.x = (-u_xlat2.w) * 8.0 + u_xlat4.z;
                                            u_xlat4.z = (u_xlatb1.x) ? u_xlat4.z : u_xlat15.x;
                                            u_xlat1.x = u_xlat2.x * 8.0 + u_xlat5.x;
                                            u_xlat5.x = (u_xlatb1.z) ? u_xlat5.x : u_xlat1.x;
                                            u_xlat1.x = u_xlat2.w * 8.0 + u_xlat5.z;
                                            u_xlat5.z = (u_xlatb1.z) ? u_xlat5.z : u_xlat1.x;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        u_xlat1.x = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat13 = u_xlat5.x + (-vs_TEXCOORD0.x);
        u_xlat2.x = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat1.x = (u_xlatb14) ? u_xlat1.x : u_xlat2.x;
        u_xlat2.x = u_xlat5.z + (-vs_TEXCOORD0.y);
        u_xlat13 = (u_xlatb14) ? u_xlat13 : u_xlat2.x;
        u_xlati2.xw = ivec2(ivec2(lessThan(u_xlat3.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw) * -1);
        u_xlat3.x = u_xlat1.x + u_xlat13;
        u_xlatb2.xy = notEqual(ivec4(u_xlati8), u_xlati2.xwxx).xy;
        u_xlat20 = float(1.0) / u_xlat3.x;
        u_xlatb3 = u_xlat1.x<u_xlat13;
        u_xlat1.x = min(u_xlat13, u_xlat1.x);
        u_xlatb13 = (u_xlatb3) ? u_xlatb2.x : u_xlatb2.y;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat1.x = u_xlat1.x * (-u_xlat20) + 0.5;
        u_xlat1.x = u_xlatb13 ? u_xlat1.x : float(0.0);
        u_xlat1.x = max(u_xlat19, u_xlat1.x);
        u_xlat1.xy = u_xlat1.xx * vec2(u_xlat7) + vs_TEXCOORD0.xy;
        u_xlat2.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
        u_xlat2.y = (u_xlatb14) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
ivec4 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
int u_xlati8;
bool u_xlatb8;
vec2 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
mediump float u_xlat16_14;
lowp float u_xlat10_14;
bool u_xlatb14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
vec2 u_xlat16;
float u_xlat19;
float u_xlat20;
mediump float u_xlat16_20;
lowp float u_xlat10_20;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat22;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0);
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).w;
    u_xlat1.y = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).w;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat1.z = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).w;
    u_xlat1.w = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).w;
    u_xlat2.x = max(u_xlat0.w, u_xlat1.x);
    u_xlat8.x = min(u_xlat0.w, u_xlat1.x);
    u_xlat2.x = max(u_xlat1.y, u_xlat2.x);
    u_xlat8.x = min(u_xlat1.y, u_xlat8.x);
    u_xlat14.x = max(u_xlat1.w, u_xlat1.z);
    u_xlat20 = min(u_xlat1.w, u_xlat1.z);
    u_xlat2.x = max(u_xlat2.x, u_xlat14.x);
    u_xlat8.x = min(u_xlat8.x, u_xlat20);
    u_xlat14.x = u_xlat2.x * 0.063000001;
    u_xlat2.x = (-u_xlat8.x) + u_xlat2.x;
    u_xlat8.x = max(u_xlat14.x, 0.0311999992);
    u_xlatb8 = u_xlat2.x>=u_xlat8.x;
    if(u_xlatb8){
        u_xlat8.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_8 = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).w;
        u_xlat14.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat14.xy, 0.0).w;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_20 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).w;
        u_xlat10_3 = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).w;
        u_xlat9.xy = u_xlat1.xy + u_xlat1.zw;
        u_xlat2.x = float(1.0) / u_xlat2.x;
        u_xlat21 = u_xlat9.y + u_xlat9.x;
        u_xlat9.x = u_xlat0.w * -2.0 + u_xlat9.x;
        u_xlat15.x = u_xlat0.w * -2.0 + u_xlat9.y;
        u_xlat16_4 = u_xlat10_14 + u_xlat10_20;
        u_xlat16_20 = u_xlat10_20 + u_xlat10_8;
        u_xlat10.x = u_xlat1.y * -2.0 + u_xlat16_4;
        u_xlat20 = u_xlat1.z * -2.0 + u_xlat16_20;
        u_xlat16_8 = u_xlat10_8 + u_xlat10_3;
        u_xlat16_14 = u_xlat10_14 + u_xlat10_3;
        u_xlat3.x = abs(u_xlat9.x) * 2.0 + abs(u_xlat10.x);
        u_xlat20 = abs(u_xlat15.x) * 2.0 + abs(u_xlat20);
        u_xlat9.x = u_xlat1.w * -2.0 + u_xlat16_8;
        u_xlat14.x = u_xlat1.x * -2.0 + u_xlat16_14;
        u_xlat3.x = u_xlat3.x + abs(u_xlat9.x);
        u_xlat14.x = u_xlat20 + abs(u_xlat14.x);
        u_xlat16_8 = u_xlat16_4 + u_xlat16_8;
        u_xlatb14 = u_xlat3.x>=u_xlat14.x;
        u_xlat8.x = u_xlat21 * 2.0 + u_xlat16_8;
        u_xlat1.xz = (bool(u_xlatb14)) ? u_xlat1.xz : u_xlat1.yw;
        u_xlat7 = (u_xlatb14) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat19 = u_xlat8.x * 0.0833333358 + (-u_xlat0.w);
        u_xlat8.xz = (-u_xlat0.ww) + u_xlat1.zx;
        u_xlat1.xz = u_xlat0.ww + u_xlat1.xz;
        u_xlatb3 = abs(u_xlat8.x)>=abs(u_xlat8.z);
        u_xlat8.x = max(abs(u_xlat8.z), abs(u_xlat8.x));
        u_xlat7 = (u_xlatb3) ? (-u_xlat7) : u_xlat7;
        u_xlat19 = u_xlat2.x * abs(u_xlat19);
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
        u_xlat2.x = u_xlatb14 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat2.w = (u_xlatb14) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat9.xy = vec2(u_xlat7) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat9.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat9.x;
        u_xlat9.y = (u_xlatb14) ? u_xlat9.y : vs_TEXCOORD0.y;
        u_xlat4.xy = (-u_xlat2.xw) + u_xlat9.xy;
        u_xlat5.xy = u_xlat2.xw + u_xlat9.xy;
        u_xlat9.x = u_xlat19 * -2.0 + 3.0;
        u_xlat15.xy = u_xlat4.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).w;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat16.xy = u_xlat5.xy;
        u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
        u_xlat16.xy = u_xlat16.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_21 = texture2DLodEXT(_MainTex, u_xlat16.xy, 0.0).w;
        u_xlat1.x = (u_xlatb3) ? u_xlat1.z : u_xlat1.x;
        u_xlat13 = u_xlat8.x * 0.25;
        u_xlat8.x = (-u_xlat1.x) * 0.5 + u_xlat0.w;
        u_xlat19 = u_xlat19 * u_xlat9.x;
        u_xlati8 = int((u_xlat8.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat1.x) * 0.5 + u_xlat10_15;
        u_xlat3.y = (-u_xlat1.x) * 0.5 + u_xlat10_21;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
        u_xlat16.x = (-u_xlat2.x) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat16.x;
        u_xlat22 = (-u_xlat2.w) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat22;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat22 = u_xlat2.x * 1.5 + u_xlat5.x;
        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
        u_xlat22 = u_xlat2.w * 1.5 + u_xlat5.y;
        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat22;
        if(u_xlati10.x != 0) {
            if(u_xlati15.x == 0) {
                u_xlat10.xz = u_xlat4.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            if(u_xlati15.y == 0) {
                u_xlat10.xz = u_xlat5.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
            u_xlati10.xz = op_not(u_xlati15.xy);
            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
            if(u_xlati10.x != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat10.xz = u_xlat4.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                if(u_xlati15.y == 0) {
                    u_xlat10.xz = u_xlat5.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                u_xlati10.xz = op_not(u_xlati15.xy);
                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                if(u_xlati10.x != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat10.xz = u_xlat4.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat10.xz = u_xlat5.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                    u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                    u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                    u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                    u_xlati10.xz = op_not(u_xlati15.xy);
                    u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                    u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                    u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                    u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                    u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                    if(u_xlati10.x != 0) {
                        if(u_xlati15.x == 0) {
                            u_xlat10.xz = u_xlat4.xz;
                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                        }
                        if(u_xlati15.y == 0) {
                            u_xlat10.xz = u_xlat5.xz;
                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                        }
                        u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                        u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                        u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                        u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                        u_xlati10.xz = op_not(u_xlati15.xy);
                        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                        u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                        u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                        if(u_xlati10.x != 0) {
                            if(u_xlati15.x == 0) {
                                u_xlat10.xz = u_xlat4.xz;
                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                            }
                            if(u_xlati15.y == 0) {
                                u_xlat10.xz = u_xlat5.xz;
                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                            }
                            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                            u_xlati10.xz = op_not(u_xlati15.xy);
                            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                            if(u_xlati10.x != 0) {
                                if(u_xlati15.x == 0) {
                                    u_xlat10.xz = u_xlat4.xz;
                                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                }
                                if(u_xlati15.y == 0) {
                                    u_xlat10.xz = u_xlat5.xz;
                                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                }
                                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                u_xlati10.xz = op_not(u_xlati15.xy);
                                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                if(u_xlati10.x != 0) {
                                    if(u_xlati15.x == 0) {
                                        u_xlat10.xz = u_xlat4.xz;
                                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                    }
                                    if(u_xlati15.y == 0) {
                                        u_xlat10.xz = u_xlat5.xz;
                                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                    }
                                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                    u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                    u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                    u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                    u_xlati10.xz = op_not(u_xlati15.xy);
                                    u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                    u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                                    u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                    u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                                    u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                    if(u_xlati10.x != 0) {
                                        if(u_xlati15.x == 0) {
                                            u_xlat10.xz = u_xlat4.xz;
                                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                        }
                                        if(u_xlati15.y == 0) {
                                            u_xlat10.xz = u_xlat5.xz;
                                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                        }
                                        u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                        u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                        u_xlat10.x = (-u_xlat2.x) * 4.0 + u_xlat4.x;
                                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                        u_xlat10.x = (-u_xlat2.w) * 4.0 + u_xlat4.z;
                                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                        u_xlati10.xz = op_not(u_xlati15.xy);
                                        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                        u_xlat22 = u_xlat2.x * 4.0 + u_xlat5.x;
                                        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                        u_xlat22 = u_xlat2.w * 4.0 + u_xlat5.z;
                                        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                        if(u_xlati10.x != 0) {
                                            if(u_xlati15.x == 0) {
                                                u_xlat10.xz = u_xlat4.xz;
                                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                            }
                                            if(u_xlati15.y == 0) {
                                                u_xlat10.xz = u_xlat5.xz;
                                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                            }
                                            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                            u_xlat1.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat1.x;
                                            u_xlatb1.xz = greaterThanEqual(abs(u_xlat3.xxyx), vec4(u_xlat13)).xz;
                                            u_xlat15.x = (-u_xlat2.x) * 8.0 + u_xlat4.x;
                                            u_xlat4.x = (u_xlatb1.x) ? u_xlat4.x : u_xlat15.x;
                                            u_xlat15.x = (-u_xlat2.w) * 8.0 + u_xlat4.z;
                                            u_xlat4.z = (u_xlatb1.x) ? u_xlat4.z : u_xlat15.x;
                                            u_xlat1.x = u_xlat2.x * 8.0 + u_xlat5.x;
                                            u_xlat5.x = (u_xlatb1.z) ? u_xlat5.x : u_xlat1.x;
                                            u_xlat1.x = u_xlat2.w * 8.0 + u_xlat5.z;
                                            u_xlat5.z = (u_xlatb1.z) ? u_xlat5.z : u_xlat1.x;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        u_xlat1.x = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat13 = u_xlat5.x + (-vs_TEXCOORD0.x);
        u_xlat2.x = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat1.x = (u_xlatb14) ? u_xlat1.x : u_xlat2.x;
        u_xlat2.x = u_xlat5.z + (-vs_TEXCOORD0.y);
        u_xlat13 = (u_xlatb14) ? u_xlat13 : u_xlat2.x;
        u_xlati2.xw = ivec2(ivec2(lessThan(u_xlat3.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw) * -1);
        u_xlat3.x = u_xlat1.x + u_xlat13;
        u_xlatb2.xy = notEqual(ivec4(u_xlati8), u_xlati2.xwxx).xy;
        u_xlat20 = float(1.0) / u_xlat3.x;
        u_xlatb3 = u_xlat1.x<u_xlat13;
        u_xlat1.x = min(u_xlat13, u_xlat1.x);
        u_xlatb13 = (u_xlatb3) ? u_xlatb2.x : u_xlatb2.y;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat1.x = u_xlat1.x * (-u_xlat20) + 0.5;
        u_xlat1.x = u_xlatb13 ? u_xlat1.x : float(0.0);
        u_xlat1.x = max(u_xlat19, u_xlat1.x);
        u_xlat1.xy = u_xlat1.xx * vec2(u_xlat7) + vs_TEXCOORD0.xy;
        u_xlat2.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
        u_xlat2.y = (u_xlatb14) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
ivec4 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
int u_xlati8;
bool u_xlatb8;
vec2 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
mediump float u_xlat16_14;
lowp float u_xlat10_14;
bool u_xlatb14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
vec2 u_xlat16;
float u_xlat19;
float u_xlat20;
mediump float u_xlat16_20;
lowp float u_xlat10_20;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat22;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0);
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).w;
    u_xlat1.y = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).w;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat1.z = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).w;
    u_xlat1.w = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).w;
    u_xlat2.x = max(u_xlat0.w, u_xlat1.x);
    u_xlat8.x = min(u_xlat0.w, u_xlat1.x);
    u_xlat2.x = max(u_xlat1.y, u_xlat2.x);
    u_xlat8.x = min(u_xlat1.y, u_xlat8.x);
    u_xlat14.x = max(u_xlat1.w, u_xlat1.z);
    u_xlat20 = min(u_xlat1.w, u_xlat1.z);
    u_xlat2.x = max(u_xlat2.x, u_xlat14.x);
    u_xlat8.x = min(u_xlat8.x, u_xlat20);
    u_xlat14.x = u_xlat2.x * 0.063000001;
    u_xlat2.x = (-u_xlat8.x) + u_xlat2.x;
    u_xlat8.x = max(u_xlat14.x, 0.0311999992);
    u_xlatb8 = u_xlat2.x>=u_xlat8.x;
    if(u_xlatb8){
        u_xlat8.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_8 = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).w;
        u_xlat14.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat14.xy, 0.0).w;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_20 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).w;
        u_xlat10_3 = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).w;
        u_xlat9.xy = u_xlat1.xy + u_xlat1.zw;
        u_xlat2.x = float(1.0) / u_xlat2.x;
        u_xlat21 = u_xlat9.y + u_xlat9.x;
        u_xlat9.x = u_xlat0.w * -2.0 + u_xlat9.x;
        u_xlat15.x = u_xlat0.w * -2.0 + u_xlat9.y;
        u_xlat16_4 = u_xlat10_14 + u_xlat10_20;
        u_xlat16_20 = u_xlat10_20 + u_xlat10_8;
        u_xlat10.x = u_xlat1.y * -2.0 + u_xlat16_4;
        u_xlat20 = u_xlat1.z * -2.0 + u_xlat16_20;
        u_xlat16_8 = u_xlat10_8 + u_xlat10_3;
        u_xlat16_14 = u_xlat10_14 + u_xlat10_3;
        u_xlat3.x = abs(u_xlat9.x) * 2.0 + abs(u_xlat10.x);
        u_xlat20 = abs(u_xlat15.x) * 2.0 + abs(u_xlat20);
        u_xlat9.x = u_xlat1.w * -2.0 + u_xlat16_8;
        u_xlat14.x = u_xlat1.x * -2.0 + u_xlat16_14;
        u_xlat3.x = u_xlat3.x + abs(u_xlat9.x);
        u_xlat14.x = u_xlat20 + abs(u_xlat14.x);
        u_xlat16_8 = u_xlat16_4 + u_xlat16_8;
        u_xlatb14 = u_xlat3.x>=u_xlat14.x;
        u_xlat8.x = u_xlat21 * 2.0 + u_xlat16_8;
        u_xlat1.xz = (bool(u_xlatb14)) ? u_xlat1.xz : u_xlat1.yw;
        u_xlat7 = (u_xlatb14) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat19 = u_xlat8.x * 0.0833333358 + (-u_xlat0.w);
        u_xlat8.xz = (-u_xlat0.ww) + u_xlat1.zx;
        u_xlat1.xz = u_xlat0.ww + u_xlat1.xz;
        u_xlatb3 = abs(u_xlat8.x)>=abs(u_xlat8.z);
        u_xlat8.x = max(abs(u_xlat8.z), abs(u_xlat8.x));
        u_xlat7 = (u_xlatb3) ? (-u_xlat7) : u_xlat7;
        u_xlat19 = u_xlat2.x * abs(u_xlat19);
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
        u_xlat2.x = u_xlatb14 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat2.w = (u_xlatb14) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat9.xy = vec2(u_xlat7) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat9.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat9.x;
        u_xlat9.y = (u_xlatb14) ? u_xlat9.y : vs_TEXCOORD0.y;
        u_xlat4.xy = (-u_xlat2.xw) + u_xlat9.xy;
        u_xlat5.xy = u_xlat2.xw + u_xlat9.xy;
        u_xlat9.x = u_xlat19 * -2.0 + 3.0;
        u_xlat15.xy = u_xlat4.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).w;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat16.xy = u_xlat5.xy;
        u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
        u_xlat16.xy = u_xlat16.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_21 = texture2DLodEXT(_MainTex, u_xlat16.xy, 0.0).w;
        u_xlat1.x = (u_xlatb3) ? u_xlat1.z : u_xlat1.x;
        u_xlat13 = u_xlat8.x * 0.25;
        u_xlat8.x = (-u_xlat1.x) * 0.5 + u_xlat0.w;
        u_xlat19 = u_xlat19 * u_xlat9.x;
        u_xlati8 = int((u_xlat8.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat1.x) * 0.5 + u_xlat10_15;
        u_xlat3.y = (-u_xlat1.x) * 0.5 + u_xlat10_21;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
        u_xlat16.x = (-u_xlat2.x) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat16.x;
        u_xlat22 = (-u_xlat2.w) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat22;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat22 = u_xlat2.x * 1.5 + u_xlat5.x;
        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
        u_xlat22 = u_xlat2.w * 1.5 + u_xlat5.y;
        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat22;
        if(u_xlati10.x != 0) {
            if(u_xlati15.x == 0) {
                u_xlat10.xz = u_xlat4.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            if(u_xlati15.y == 0) {
                u_xlat10.xz = u_xlat5.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
            u_xlati10.xz = op_not(u_xlati15.xy);
            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
            if(u_xlati10.x != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat10.xz = u_xlat4.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                if(u_xlati15.y == 0) {
                    u_xlat10.xz = u_xlat5.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                u_xlati10.xz = op_not(u_xlati15.xy);
                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                if(u_xlati10.x != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat10.xz = u_xlat4.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat10.xz = u_xlat5.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                    u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                    u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                    u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                    u_xlati10.xz = op_not(u_xlati15.xy);
                    u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                    u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                    u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                    u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                    u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                    if(u_xlati10.x != 0) {
                        if(u_xlati15.x == 0) {
                            u_xlat10.xz = u_xlat4.xz;
                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                        }
                        if(u_xlati15.y == 0) {
                            u_xlat10.xz = u_xlat5.xz;
                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                        }
                        u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                        u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                        u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                        u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                        u_xlati10.xz = op_not(u_xlati15.xy);
                        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                        u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                        u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                        if(u_xlati10.x != 0) {
                            if(u_xlati15.x == 0) {
                                u_xlat10.xz = u_xlat4.xz;
                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                            }
                            if(u_xlati15.y == 0) {
                                u_xlat10.xz = u_xlat5.xz;
                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                            }
                            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                            u_xlati10.xz = op_not(u_xlati15.xy);
                            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                            if(u_xlati10.x != 0) {
                                if(u_xlati15.x == 0) {
                                    u_xlat10.xz = u_xlat4.xz;
                                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                }
                                if(u_xlati15.y == 0) {
                                    u_xlat10.xz = u_xlat5.xz;
                                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                }
                                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                u_xlati10.xz = op_not(u_xlati15.xy);
                                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                if(u_xlati10.x != 0) {
                                    if(u_xlati15.x == 0) {
                                        u_xlat10.xz = u_xlat4.xz;
                                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                    }
                                    if(u_xlati15.y == 0) {
                                        u_xlat10.xz = u_xlat5.xz;
                                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                    }
                                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                    u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                    u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                    u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                    u_xlati10.xz = op_not(u_xlati15.xy);
                                    u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                    u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                                    u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                    u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                                    u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                    if(u_xlati10.x != 0) {
                                        if(u_xlati15.x == 0) {
                                            u_xlat10.xz = u_xlat4.xz;
                                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                        }
                                        if(u_xlati15.y == 0) {
                                            u_xlat10.xz = u_xlat5.xz;
                                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                        }
                                        u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                        u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                        u_xlat10.x = (-u_xlat2.x) * 4.0 + u_xlat4.x;
                                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                        u_xlat10.x = (-u_xlat2.w) * 4.0 + u_xlat4.z;
                                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                        u_xlati10.xz = op_not(u_xlati15.xy);
                                        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                        u_xlat22 = u_xlat2.x * 4.0 + u_xlat5.x;
                                        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                        u_xlat22 = u_xlat2.w * 4.0 + u_xlat5.z;
                                        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                        if(u_xlati10.x != 0) {
                                            if(u_xlati15.x == 0) {
                                                u_xlat10.xz = u_xlat4.xz;
                                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                            }
                                            if(u_xlati15.y == 0) {
                                                u_xlat10.xz = u_xlat5.xz;
                                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                            }
                                            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                            u_xlat1.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat1.x;
                                            u_xlatb1.xz = greaterThanEqual(abs(u_xlat3.xxyx), vec4(u_xlat13)).xz;
                                            u_xlat15.x = (-u_xlat2.x) * 8.0 + u_xlat4.x;
                                            u_xlat4.x = (u_xlatb1.x) ? u_xlat4.x : u_xlat15.x;
                                            u_xlat15.x = (-u_xlat2.w) * 8.0 + u_xlat4.z;
                                            u_xlat4.z = (u_xlatb1.x) ? u_xlat4.z : u_xlat15.x;
                                            u_xlat1.x = u_xlat2.x * 8.0 + u_xlat5.x;
                                            u_xlat5.x = (u_xlatb1.z) ? u_xlat5.x : u_xlat1.x;
                                            u_xlat1.x = u_xlat2.w * 8.0 + u_xlat5.z;
                                            u_xlat5.z = (u_xlatb1.z) ? u_xlat5.z : u_xlat1.x;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        u_xlat1.x = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat13 = u_xlat5.x + (-vs_TEXCOORD0.x);
        u_xlat2.x = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat1.x = (u_xlatb14) ? u_xlat1.x : u_xlat2.x;
        u_xlat2.x = u_xlat5.z + (-vs_TEXCOORD0.y);
        u_xlat13 = (u_xlatb14) ? u_xlat13 : u_xlat2.x;
        u_xlati2.xw = ivec2(ivec2(lessThan(u_xlat3.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw) * -1);
        u_xlat3.x = u_xlat1.x + u_xlat13;
        u_xlatb2.xy = notEqual(ivec4(u_xlati8), u_xlati2.xwxx).xy;
        u_xlat20 = float(1.0) / u_xlat3.x;
        u_xlatb3 = u_xlat1.x<u_xlat13;
        u_xlat1.x = min(u_xlat13, u_xlat1.x);
        u_xlatb13 = (u_xlatb3) ? u_xlatb2.x : u_xlatb2.y;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat1.x = u_xlat1.x * (-u_xlat20) + 0.5;
        u_xlat1.x = u_xlatb13 ? u_xlat1.x : float(0.0);
        u_xlat1.x = max(u_xlat19, u_xlat1.x);
        u_xlat1.xy = u_xlat1.xx * vec2(u_xlat7) + vs_TEXCOORD0.xy;
        u_xlat2.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
        u_xlat2.y = (u_xlatb14) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
ivec4 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
int u_xlati8;
bool u_xlatb8;
vec2 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
mediump float u_xlat16_14;
lowp float u_xlat10_14;
bool u_xlatb14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
vec2 u_xlat16;
float u_xlat19;
float u_xlat20;
mediump float u_xlat16_20;
lowp float u_xlat10_20;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat22;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0);
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).w;
    u_xlat1.y = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).w;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat1.z = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).w;
    u_xlat1.w = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).w;
    u_xlat2.x = max(u_xlat0.w, u_xlat1.x);
    u_xlat8.x = min(u_xlat0.w, u_xlat1.x);
    u_xlat2.x = max(u_xlat1.y, u_xlat2.x);
    u_xlat8.x = min(u_xlat1.y, u_xlat8.x);
    u_xlat14.x = max(u_xlat1.w, u_xlat1.z);
    u_xlat20 = min(u_xlat1.w, u_xlat1.z);
    u_xlat2.x = max(u_xlat2.x, u_xlat14.x);
    u_xlat8.x = min(u_xlat8.x, u_xlat20);
    u_xlat14.x = u_xlat2.x * 0.063000001;
    u_xlat2.x = (-u_xlat8.x) + u_xlat2.x;
    u_xlat8.x = max(u_xlat14.x, 0.0311999992);
    u_xlatb8 = u_xlat2.x>=u_xlat8.x;
    if(u_xlatb8){
        u_xlat8.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_8 = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).w;
        u_xlat14.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat14.xy, 0.0).w;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_20 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).w;
        u_xlat10_3 = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).w;
        u_xlat9.xy = u_xlat1.xy + u_xlat1.zw;
        u_xlat2.x = float(1.0) / u_xlat2.x;
        u_xlat21 = u_xlat9.y + u_xlat9.x;
        u_xlat9.x = u_xlat0.w * -2.0 + u_xlat9.x;
        u_xlat15.x = u_xlat0.w * -2.0 + u_xlat9.y;
        u_xlat16_4 = u_xlat10_14 + u_xlat10_20;
        u_xlat16_20 = u_xlat10_20 + u_xlat10_8;
        u_xlat10.x = u_xlat1.y * -2.0 + u_xlat16_4;
        u_xlat20 = u_xlat1.z * -2.0 + u_xlat16_20;
        u_xlat16_8 = u_xlat10_8 + u_xlat10_3;
        u_xlat16_14 = u_xlat10_14 + u_xlat10_3;
        u_xlat3.x = abs(u_xlat9.x) * 2.0 + abs(u_xlat10.x);
        u_xlat20 = abs(u_xlat15.x) * 2.0 + abs(u_xlat20);
        u_xlat9.x = u_xlat1.w * -2.0 + u_xlat16_8;
        u_xlat14.x = u_xlat1.x * -2.0 + u_xlat16_14;
        u_xlat3.x = u_xlat3.x + abs(u_xlat9.x);
        u_xlat14.x = u_xlat20 + abs(u_xlat14.x);
        u_xlat16_8 = u_xlat16_4 + u_xlat16_8;
        u_xlatb14 = u_xlat3.x>=u_xlat14.x;
        u_xlat8.x = u_xlat21 * 2.0 + u_xlat16_8;
        u_xlat1.xz = (bool(u_xlatb14)) ? u_xlat1.xz : u_xlat1.yw;
        u_xlat7 = (u_xlatb14) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat19 = u_xlat8.x * 0.0833333358 + (-u_xlat0.w);
        u_xlat8.xz = (-u_xlat0.ww) + u_xlat1.zx;
        u_xlat1.xz = u_xlat0.ww + u_xlat1.xz;
        u_xlatb3 = abs(u_xlat8.x)>=abs(u_xlat8.z);
        u_xlat8.x = max(abs(u_xlat8.z), abs(u_xlat8.x));
        u_xlat7 = (u_xlatb3) ? (-u_xlat7) : u_xlat7;
        u_xlat19 = u_xlat2.x * abs(u_xlat19);
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
        u_xlat2.x = u_xlatb14 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat2.w = (u_xlatb14) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat9.xy = vec2(u_xlat7) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat9.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat9.x;
        u_xlat9.y = (u_xlatb14) ? u_xlat9.y : vs_TEXCOORD0.y;
        u_xlat4.xy = (-u_xlat2.xw) + u_xlat9.xy;
        u_xlat5.xy = u_xlat2.xw + u_xlat9.xy;
        u_xlat9.x = u_xlat19 * -2.0 + 3.0;
        u_xlat15.xy = u_xlat4.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).w;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat16.xy = u_xlat5.xy;
        u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
        u_xlat16.xy = u_xlat16.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_21 = texture2DLodEXT(_MainTex, u_xlat16.xy, 0.0).w;
        u_xlat1.x = (u_xlatb3) ? u_xlat1.z : u_xlat1.x;
        u_xlat13 = u_xlat8.x * 0.25;
        u_xlat8.x = (-u_xlat1.x) * 0.5 + u_xlat0.w;
        u_xlat19 = u_xlat19 * u_xlat9.x;
        u_xlati8 = int((u_xlat8.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat1.x) * 0.5 + u_xlat10_15;
        u_xlat3.y = (-u_xlat1.x) * 0.5 + u_xlat10_21;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
        u_xlat16.x = (-u_xlat2.x) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat16.x;
        u_xlat22 = (-u_xlat2.w) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat22;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat22 = u_xlat2.x * 1.5 + u_xlat5.x;
        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
        u_xlat22 = u_xlat2.w * 1.5 + u_xlat5.y;
        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat22;
        if(u_xlati10.x != 0) {
            if(u_xlati15.x == 0) {
                u_xlat10.xz = u_xlat4.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            if(u_xlati15.y == 0) {
                u_xlat10.xz = u_xlat5.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
            u_xlati10.xz = op_not(u_xlati15.xy);
            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
            if(u_xlati10.x != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat10.xz = u_xlat4.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                if(u_xlati15.y == 0) {
                    u_xlat10.xz = u_xlat5.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                u_xlati10.xz = op_not(u_xlati15.xy);
                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                if(u_xlati10.x != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat10.xz = u_xlat4.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat10.xz = u_xlat5.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                    u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                    u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                    u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                    u_xlati10.xz = op_not(u_xlati15.xy);
                    u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                    u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                    u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                    u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                    u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                    if(u_xlati10.x != 0) {
                        if(u_xlati15.x == 0) {
                            u_xlat10.xz = u_xlat4.xz;
                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                        }
                        if(u_xlati15.y == 0) {
                            u_xlat10.xz = u_xlat5.xz;
                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                        }
                        u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                        u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                        u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                        u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                        u_xlati10.xz = op_not(u_xlati15.xy);
                        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                        u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                        u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                        if(u_xlati10.x != 0) {
                            if(u_xlati15.x == 0) {
                                u_xlat10.xz = u_xlat4.xz;
                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                            }
                            if(u_xlati15.y == 0) {
                                u_xlat10.xz = u_xlat5.xz;
                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                            }
                            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                            u_xlati10.xz = op_not(u_xlati15.xy);
                            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                            if(u_xlati10.x != 0) {
                                if(u_xlati15.x == 0) {
                                    u_xlat10.xz = u_xlat4.xz;
                                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                }
                                if(u_xlati15.y == 0) {
                                    u_xlat10.xz = u_xlat5.xz;
                                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                }
                                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                u_xlati10.xz = op_not(u_xlati15.xy);
                                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                if(u_xlati10.x != 0) {
                                    if(u_xlati15.x == 0) {
                                        u_xlat10.xz = u_xlat4.xz;
                                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                    }
                                    if(u_xlati15.y == 0) {
                                        u_xlat10.xz = u_xlat5.xz;
                                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                    }
                                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                    u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                    u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
                                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                    u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
                                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                    u_xlati10.xz = op_not(u_xlati15.xy);
                                    u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                    u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
                                    u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                    u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
                                    u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                    if(u_xlati10.x != 0) {
                                        if(u_xlati15.x == 0) {
                                            u_xlat10.xz = u_xlat4.xz;
                                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                        }
                                        if(u_xlati15.y == 0) {
                                            u_xlat10.xz = u_xlat5.xz;
                                            u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                            u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                        }
                                        u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                        u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                                        u_xlat10.x = (-u_xlat2.x) * 4.0 + u_xlat4.x;
                                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                                        u_xlat10.x = (-u_xlat2.w) * 4.0 + u_xlat4.z;
                                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                                        u_xlati10.xz = op_not(u_xlati15.xy);
                                        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                                        u_xlat22 = u_xlat2.x * 4.0 + u_xlat5.x;
                                        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                                        u_xlat22 = u_xlat2.w * 4.0 + u_xlat5.z;
                                        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                                        if(u_xlati10.x != 0) {
                                            if(u_xlati15.x == 0) {
                                                u_xlat10.xz = u_xlat4.xz;
                                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                            }
                                            if(u_xlati15.y == 0) {
                                                u_xlat10.xz = u_xlat5.xz;
                                                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                                                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                                            }
                                            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                                            u_xlat1.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat1.x;
                                            u_xlatb1.xz = greaterThanEqual(abs(u_xlat3.xxyx), vec4(u_xlat13)).xz;
                                            u_xlat15.x = (-u_xlat2.x) * 8.0 + u_xlat4.x;
                                            u_xlat4.x = (u_xlatb1.x) ? u_xlat4.x : u_xlat15.x;
                                            u_xlat15.x = (-u_xlat2.w) * 8.0 + u_xlat4.z;
                                            u_xlat4.z = (u_xlatb1.x) ? u_xlat4.z : u_xlat15.x;
                                            u_xlat1.x = u_xlat2.x * 8.0 + u_xlat5.x;
                                            u_xlat5.x = (u_xlatb1.z) ? u_xlat5.x : u_xlat1.x;
                                            u_xlat1.x = u_xlat2.w * 8.0 + u_xlat5.z;
                                            u_xlat5.z = (u_xlatb1.z) ? u_xlat5.z : u_xlat1.x;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        u_xlat1.x = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat13 = u_xlat5.x + (-vs_TEXCOORD0.x);
        u_xlat2.x = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat1.x = (u_xlatb14) ? u_xlat1.x : u_xlat2.x;
        u_xlat2.x = u_xlat5.z + (-vs_TEXCOORD0.y);
        u_xlat13 = (u_xlatb14) ? u_xlat13 : u_xlat2.x;
        u_xlati2.xw = ivec2(ivec2(lessThan(u_xlat3.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw) * -1);
        u_xlat3.x = u_xlat1.x + u_xlat13;
        u_xlatb2.xy = notEqual(ivec4(u_xlati8), u_xlati2.xwxx).xy;
        u_xlat20 = float(1.0) / u_xlat3.x;
        u_xlatb3 = u_xlat1.x<u_xlat13;
        u_xlat1.x = min(u_xlat13, u_xlat1.x);
        u_xlatb13 = (u_xlatb3) ? u_xlatb2.x : u_xlatb2.y;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat1.x = u_xlat1.x * (-u_xlat20) + 0.5;
        u_xlat1.x = u_xlatb13 ? u_xlat1.x : float(0.0);
        u_xlat1.x = max(u_xlat19, u_xlat1.x);
        u_xlat1.xy = u_xlat1.xx * vec2(u_xlat7) + vs_TEXCOORD0.xy;
        u_xlat2.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
        u_xlat2.y = (u_xlatb14) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA" "FXAA_KEEP_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
vec4 u_xlat2;
int u_xlati2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
lowp float u_xlat10_9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
float u_xlat14;
lowp float u_xlat10_14;
ivec2 u_xlati14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
float u_xlat20;
int u_xlati20;
bool u_xlatb20;
float u_xlat21;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat18 = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).y;
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).y;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat7.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
    u_xlat13 = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).y;
    u_xlat19 = max(u_xlat0.y, u_xlat18);
    u_xlat2.x = min(u_xlat0.y, u_xlat18);
    u_xlat19 = max(u_xlat19, u_xlat1.x);
    u_xlat2.x = min(u_xlat1.x, u_xlat2.x);
    u_xlat8.x = max(u_xlat13, u_xlat7.x);
    u_xlat14 = min(u_xlat13, u_xlat7.x);
    u_xlat19 = max(u_xlat19, u_xlat8.x);
    u_xlat2.x = min(u_xlat2.x, u_xlat14);
    u_xlat8.x = u_xlat19 * 0.063000001;
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat2.x = max(u_xlat8.x, 0.0311999992);
    u_xlatb2.x = u_xlat19>=u_xlat2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
        u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
        u_xlat8.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.y = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).y;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).y;
        u_xlat2.w = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).y;
        u_xlat3.x = u_xlat18 + u_xlat7.x;
        u_xlat9.x = u_xlat1.x + u_xlat13;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlat15.x = u_xlat9.x + u_xlat3.x;
        u_xlat3.x = u_xlat0.y * -2.0 + u_xlat3.x;
        u_xlat9.x = u_xlat0.y * -2.0 + u_xlat9.x;
        u_xlat21 = u_xlat2.y + u_xlat10_14;
        u_xlat14 = u_xlat10_14 + u_xlat2.x;
        u_xlat4.x = u_xlat1.x * -2.0 + u_xlat21;
        u_xlat14 = u_xlat7.x * -2.0 + u_xlat14;
        u_xlat2.xy = u_xlat2.wy + u_xlat2.xw;
        u_xlat20 = abs(u_xlat3.x) * 2.0 + abs(u_xlat4.x);
        u_xlat14 = abs(u_xlat9.x) * 2.0 + abs(u_xlat14);
        u_xlat3.x = u_xlat13 * -2.0 + u_xlat2.x;
        u_xlat8.x = u_xlat18 * -2.0 + u_xlat2.y;
        u_xlat20 = u_xlat20 + abs(u_xlat3.x);
        u_xlat8.x = u_xlat14 + abs(u_xlat8.x);
        u_xlat2.x = u_xlat21 + u_xlat2.x;
        u_xlatb8 = u_xlat20>=u_xlat8.x;
        u_xlat2.x = u_xlat15.x * 2.0 + u_xlat2.x;
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat13;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat1.x;
        u_xlat1.x = (u_xlatb8) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat13 = u_xlat2.x * 0.0833333358 + (-u_xlat0.y);
        u_xlat2.x = (-u_xlat0.y) + u_xlat7.x;
        u_xlat14 = (-u_xlat0.y) + u_xlat18;
        u_xlat7.x = u_xlat0.y + u_xlat7.x;
        u_xlat18 = u_xlat0.y + u_xlat18;
        u_xlatb20 = abs(u_xlat2.x)>=abs(u_xlat14);
        u_xlat2.x = max(abs(u_xlat14), abs(u_xlat2.x));
        u_xlat1.x = (u_xlatb20) ? (-u_xlat1.x) : u_xlat1.x;
        u_xlat13 = u_xlat19 * abs(u_xlat13);
        u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
        u_xlat19 = u_xlatb8 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat14 = (u_xlatb8) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat3.xy = u_xlat1.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat3.x;
        u_xlat9.x = (u_xlatb8) ? u_xlat3.y : vs_TEXCOORD0.y;
        u_xlat4.x = (-u_xlat19) + u_xlat3.x;
        u_xlat4.y = (-u_xlat14) + u_xlat9.x;
        u_xlat5.x = u_xlat19 + u_xlat3.x;
        u_xlat5.y = u_xlat14 + u_xlat9.x;
        u_xlat3.x = u_xlat13 * -2.0 + 3.0;
        u_xlat9.xy = u_xlat4.xy;
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat9.xy = u_xlat9.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_9 = texture2DLodEXT(_MainTex, u_xlat9.xy, 0.0).y;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat15.xy = u_xlat5.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).y;
        u_xlat18 = (u_xlatb20) ? u_xlat7.x : u_xlat18;
        u_xlat7.x = u_xlat2.x * 0.25;
        u_xlat2.x = (-u_xlat18) * 0.5 + u_xlat0.y;
        u_xlat13 = u_xlat13 * u_xlat3.x;
        u_xlati2 = int((u_xlat2.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat18) * 0.5 + u_xlat10_9;
        u_xlat3.y = (-u_xlat18) * 0.5 + u_xlat10_15;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
        u_xlat20 = (-u_xlat19) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
        u_xlat20 = (-u_xlat14) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat20;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati20 = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat10.x = u_xlat19 * 1.5 + u_xlat5.x;
        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat10.x;
        u_xlat5.x = u_xlat14 * 1.5 + u_xlat5.y;
        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat5.x;
        if(u_xlati20 != 0) {
            if(u_xlati15.x == 0) {
                u_xlat5.xy = u_xlat4.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            if(u_xlati15.y == 0) {
                u_xlat5.xy = u_xlat10.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
            u_xlati5.xy = op_not(u_xlati15.xy);
            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
            if(u_xlati20 != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat5.xy = u_xlat4.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                if(u_xlati15.y == 0) {
                    u_xlat5.xy = u_xlat10.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                u_xlati5.xy = op_not(u_xlati15.xy);
                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                if(u_xlati20 != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat5.xy = u_xlat4.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat5.xy = u_xlat10.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                    u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                    u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                    u_xlati5.xy = op_not(u_xlati15.xy);
                    u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                    u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                    u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                    u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                    u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                    if(u_xlati20 != 0) {
                        if(u_xlati15.x == 0) {
                            u_xlat5.xy = u_xlat4.xz;
                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                        }
                        if(u_xlati15.y == 0) {
                            u_xlat5.xy = u_xlat10.xz;
                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                        }
                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                        u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                        u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                        u_xlati5.xy = op_not(u_xlati15.xy);
                        u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                        u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                        u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                        if(u_xlati20 != 0) {
                            if(u_xlati15.x == 0) {
                                u_xlat5.xy = u_xlat4.xz;
                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                            }
                            if(u_xlati15.y == 0) {
                                u_xlat5.xy = u_xlat10.xz;
                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                            }
                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                            u_xlati5.xy = op_not(u_xlati15.xy);
                            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                            if(u_xlati20 != 0) {
                                if(u_xlati15.x == 0) {
                                    u_xlat5.xy = u_xlat4.xz;
                                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                }
                                if(u_xlati15.y == 0) {
                                    u_xlat5.xy = u_xlat10.xz;
                                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                }
                                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                u_xlati5.xy = op_not(u_xlati15.xy);
                                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                if(u_xlati20 != 0) {
                                    if(u_xlati15.x == 0) {
                                        u_xlat5.xy = u_xlat4.xz;
                                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                    }
                                    if(u_xlati15.y == 0) {
                                        u_xlat5.xy = u_xlat10.xz;
                                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                    }
                                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                    u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                    u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                    u_xlati5.xy = op_not(u_xlati15.xy);
                                    u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                    u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                                    u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                    u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                                    u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                    if(u_xlati20 != 0) {
                                        if(u_xlati15.x == 0) {
                                            u_xlat5.xy = u_xlat4.xz;
                                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                        }
                                        if(u_xlati15.y == 0) {
                                            u_xlat5.xy = u_xlat10.xz;
                                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                        }
                                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                        u_xlat20 = (-u_xlat19) * 4.0 + u_xlat4.x;
                                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                        u_xlat20 = (-u_xlat14) * 4.0 + u_xlat4.z;
                                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                        u_xlati5.xy = op_not(u_xlati15.xy);
                                        u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                        u_xlat5.x = u_xlat19 * 4.0 + u_xlat10.x;
                                        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                        u_xlat5.x = u_xlat14 * 4.0 + u_xlat10.z;
                                        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                        if(u_xlati20 != 0) {
                                            if(u_xlati15.x == 0) {
                                                u_xlat5.xy = u_xlat4.xz;
                                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                            }
                                            if(u_xlati15.y == 0) {
                                                u_xlat5.xy = u_xlat10.xz;
                                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                            }
                                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                            u_xlat18 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat18;
                                            u_xlatb15.xy = greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy;
                                            u_xlat18 = (-u_xlat19) * 8.0 + u_xlat4.x;
                                            u_xlat4.x = (u_xlatb15.x) ? u_xlat4.x : u_xlat18;
                                            u_xlat18 = (-u_xlat14) * 8.0 + u_xlat4.z;
                                            u_xlat4.z = (u_xlatb15.x) ? u_xlat4.z : u_xlat18;
                                            u_xlat18 = u_xlat19 * 8.0 + u_xlat10.x;
                                            u_xlat10.x = (u_xlatb15.y) ? u_xlat10.x : u_xlat18;
                                            u_xlat18 = u_xlat14 * 8.0 + u_xlat10.z;
                                            u_xlat10.z = (u_xlatb15.y) ? u_xlat10.z : u_xlat18;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        u_xlat18 = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat19 = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat19;
        u_xlat7.xz = u_xlat10.xz + (-vs_TEXCOORD0.xy);
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat7.z;
        u_xlati14.xy = ivec2(ivec2(lessThan(u_xlat3.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy) * -1);
        u_xlat19 = u_xlat18 + u_xlat7.x;
        u_xlatb2.xz = notEqual(ivec4(u_xlati2), u_xlati14.xxyx).xz;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlatb20 = u_xlat18<u_xlat7.x;
        u_xlat18 = min(u_xlat18, u_xlat7.x);
        u_xlatb7 = (u_xlatb20) ? u_xlatb2.x : u_xlatb2.z;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat18 = u_xlat18 * (-u_xlat19) + 0.5;
        u_xlat18 = u_xlatb7 ? u_xlat18 : float(0.0);
        u_xlat18 = max(u_xlat13, u_xlat18);
        u_xlat1.xy = vec2(u_xlat18) * u_xlat1.xx + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat3.y = (u_xlatb8) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat3.y = clamp(u_xlat3.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat3.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat10_18 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_18;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA" "FXAA_KEEP_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
vec4 u_xlat2;
int u_xlati2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
lowp float u_xlat10_9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
float u_xlat14;
lowp float u_xlat10_14;
ivec2 u_xlati14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
float u_xlat20;
int u_xlati20;
bool u_xlatb20;
float u_xlat21;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat18 = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).y;
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).y;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat7.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
    u_xlat13 = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).y;
    u_xlat19 = max(u_xlat0.y, u_xlat18);
    u_xlat2.x = min(u_xlat0.y, u_xlat18);
    u_xlat19 = max(u_xlat19, u_xlat1.x);
    u_xlat2.x = min(u_xlat1.x, u_xlat2.x);
    u_xlat8.x = max(u_xlat13, u_xlat7.x);
    u_xlat14 = min(u_xlat13, u_xlat7.x);
    u_xlat19 = max(u_xlat19, u_xlat8.x);
    u_xlat2.x = min(u_xlat2.x, u_xlat14);
    u_xlat8.x = u_xlat19 * 0.063000001;
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat2.x = max(u_xlat8.x, 0.0311999992);
    u_xlatb2.x = u_xlat19>=u_xlat2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
        u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
        u_xlat8.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.y = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).y;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).y;
        u_xlat2.w = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).y;
        u_xlat3.x = u_xlat18 + u_xlat7.x;
        u_xlat9.x = u_xlat1.x + u_xlat13;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlat15.x = u_xlat9.x + u_xlat3.x;
        u_xlat3.x = u_xlat0.y * -2.0 + u_xlat3.x;
        u_xlat9.x = u_xlat0.y * -2.0 + u_xlat9.x;
        u_xlat21 = u_xlat2.y + u_xlat10_14;
        u_xlat14 = u_xlat10_14 + u_xlat2.x;
        u_xlat4.x = u_xlat1.x * -2.0 + u_xlat21;
        u_xlat14 = u_xlat7.x * -2.0 + u_xlat14;
        u_xlat2.xy = u_xlat2.wy + u_xlat2.xw;
        u_xlat20 = abs(u_xlat3.x) * 2.0 + abs(u_xlat4.x);
        u_xlat14 = abs(u_xlat9.x) * 2.0 + abs(u_xlat14);
        u_xlat3.x = u_xlat13 * -2.0 + u_xlat2.x;
        u_xlat8.x = u_xlat18 * -2.0 + u_xlat2.y;
        u_xlat20 = u_xlat20 + abs(u_xlat3.x);
        u_xlat8.x = u_xlat14 + abs(u_xlat8.x);
        u_xlat2.x = u_xlat21 + u_xlat2.x;
        u_xlatb8 = u_xlat20>=u_xlat8.x;
        u_xlat2.x = u_xlat15.x * 2.0 + u_xlat2.x;
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat13;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat1.x;
        u_xlat1.x = (u_xlatb8) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat13 = u_xlat2.x * 0.0833333358 + (-u_xlat0.y);
        u_xlat2.x = (-u_xlat0.y) + u_xlat7.x;
        u_xlat14 = (-u_xlat0.y) + u_xlat18;
        u_xlat7.x = u_xlat0.y + u_xlat7.x;
        u_xlat18 = u_xlat0.y + u_xlat18;
        u_xlatb20 = abs(u_xlat2.x)>=abs(u_xlat14);
        u_xlat2.x = max(abs(u_xlat14), abs(u_xlat2.x));
        u_xlat1.x = (u_xlatb20) ? (-u_xlat1.x) : u_xlat1.x;
        u_xlat13 = u_xlat19 * abs(u_xlat13);
        u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
        u_xlat19 = u_xlatb8 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat14 = (u_xlatb8) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat3.xy = u_xlat1.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat3.x;
        u_xlat9.x = (u_xlatb8) ? u_xlat3.y : vs_TEXCOORD0.y;
        u_xlat4.x = (-u_xlat19) + u_xlat3.x;
        u_xlat4.y = (-u_xlat14) + u_xlat9.x;
        u_xlat5.x = u_xlat19 + u_xlat3.x;
        u_xlat5.y = u_xlat14 + u_xlat9.x;
        u_xlat3.x = u_xlat13 * -2.0 + 3.0;
        u_xlat9.xy = u_xlat4.xy;
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat9.xy = u_xlat9.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_9 = texture2DLodEXT(_MainTex, u_xlat9.xy, 0.0).y;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat15.xy = u_xlat5.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).y;
        u_xlat18 = (u_xlatb20) ? u_xlat7.x : u_xlat18;
        u_xlat7.x = u_xlat2.x * 0.25;
        u_xlat2.x = (-u_xlat18) * 0.5 + u_xlat0.y;
        u_xlat13 = u_xlat13 * u_xlat3.x;
        u_xlati2 = int((u_xlat2.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat18) * 0.5 + u_xlat10_9;
        u_xlat3.y = (-u_xlat18) * 0.5 + u_xlat10_15;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
        u_xlat20 = (-u_xlat19) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
        u_xlat20 = (-u_xlat14) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat20;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati20 = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat10.x = u_xlat19 * 1.5 + u_xlat5.x;
        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat10.x;
        u_xlat5.x = u_xlat14 * 1.5 + u_xlat5.y;
        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat5.x;
        if(u_xlati20 != 0) {
            if(u_xlati15.x == 0) {
                u_xlat5.xy = u_xlat4.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            if(u_xlati15.y == 0) {
                u_xlat5.xy = u_xlat10.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
            u_xlati5.xy = op_not(u_xlati15.xy);
            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
            if(u_xlati20 != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat5.xy = u_xlat4.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                if(u_xlati15.y == 0) {
                    u_xlat5.xy = u_xlat10.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                u_xlati5.xy = op_not(u_xlati15.xy);
                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                if(u_xlati20 != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat5.xy = u_xlat4.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat5.xy = u_xlat10.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                    u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                    u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                    u_xlati5.xy = op_not(u_xlati15.xy);
                    u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                    u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                    u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                    u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                    u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                    if(u_xlati20 != 0) {
                        if(u_xlati15.x == 0) {
                            u_xlat5.xy = u_xlat4.xz;
                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                        }
                        if(u_xlati15.y == 0) {
                            u_xlat5.xy = u_xlat10.xz;
                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                        }
                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                        u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                        u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                        u_xlati5.xy = op_not(u_xlati15.xy);
                        u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                        u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                        u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                        if(u_xlati20 != 0) {
                            if(u_xlati15.x == 0) {
                                u_xlat5.xy = u_xlat4.xz;
                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                            }
                            if(u_xlati15.y == 0) {
                                u_xlat5.xy = u_xlat10.xz;
                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                            }
                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                            u_xlati5.xy = op_not(u_xlati15.xy);
                            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                            if(u_xlati20 != 0) {
                                if(u_xlati15.x == 0) {
                                    u_xlat5.xy = u_xlat4.xz;
                                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                }
                                if(u_xlati15.y == 0) {
                                    u_xlat5.xy = u_xlat10.xz;
                                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                }
                                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                u_xlati5.xy = op_not(u_xlati15.xy);
                                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                if(u_xlati20 != 0) {
                                    if(u_xlati15.x == 0) {
                                        u_xlat5.xy = u_xlat4.xz;
                                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                    }
                                    if(u_xlati15.y == 0) {
                                        u_xlat5.xy = u_xlat10.xz;
                                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                    }
                                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                    u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                    u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                    u_xlati5.xy = op_not(u_xlati15.xy);
                                    u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                    u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                                    u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                    u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                                    u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                    if(u_xlati20 != 0) {
                                        if(u_xlati15.x == 0) {
                                            u_xlat5.xy = u_xlat4.xz;
                                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                        }
                                        if(u_xlati15.y == 0) {
                                            u_xlat5.xy = u_xlat10.xz;
                                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                        }
                                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                        u_xlat20 = (-u_xlat19) * 4.0 + u_xlat4.x;
                                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                        u_xlat20 = (-u_xlat14) * 4.0 + u_xlat4.z;
                                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                        u_xlati5.xy = op_not(u_xlati15.xy);
                                        u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                        u_xlat5.x = u_xlat19 * 4.0 + u_xlat10.x;
                                        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                        u_xlat5.x = u_xlat14 * 4.0 + u_xlat10.z;
                                        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                        if(u_xlati20 != 0) {
                                            if(u_xlati15.x == 0) {
                                                u_xlat5.xy = u_xlat4.xz;
                                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                            }
                                            if(u_xlati15.y == 0) {
                                                u_xlat5.xy = u_xlat10.xz;
                                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                            }
                                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                            u_xlat18 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat18;
                                            u_xlatb15.xy = greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy;
                                            u_xlat18 = (-u_xlat19) * 8.0 + u_xlat4.x;
                                            u_xlat4.x = (u_xlatb15.x) ? u_xlat4.x : u_xlat18;
                                            u_xlat18 = (-u_xlat14) * 8.0 + u_xlat4.z;
                                            u_xlat4.z = (u_xlatb15.x) ? u_xlat4.z : u_xlat18;
                                            u_xlat18 = u_xlat19 * 8.0 + u_xlat10.x;
                                            u_xlat10.x = (u_xlatb15.y) ? u_xlat10.x : u_xlat18;
                                            u_xlat18 = u_xlat14 * 8.0 + u_xlat10.z;
                                            u_xlat10.z = (u_xlatb15.y) ? u_xlat10.z : u_xlat18;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        u_xlat18 = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat19 = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat19;
        u_xlat7.xz = u_xlat10.xz + (-vs_TEXCOORD0.xy);
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat7.z;
        u_xlati14.xy = ivec2(ivec2(lessThan(u_xlat3.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy) * -1);
        u_xlat19 = u_xlat18 + u_xlat7.x;
        u_xlatb2.xz = notEqual(ivec4(u_xlati2), u_xlati14.xxyx).xz;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlatb20 = u_xlat18<u_xlat7.x;
        u_xlat18 = min(u_xlat18, u_xlat7.x);
        u_xlatb7 = (u_xlatb20) ? u_xlatb2.x : u_xlatb2.z;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat18 = u_xlat18 * (-u_xlat19) + 0.5;
        u_xlat18 = u_xlatb7 ? u_xlat18 : float(0.0);
        u_xlat18 = max(u_xlat13, u_xlat18);
        u_xlat1.xy = vec2(u_xlat18) * u_xlat1.xx + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat3.y = (u_xlatb8) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat3.y = clamp(u_xlat3.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat3.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat10_18 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_18;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA" "FXAA_KEEP_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
vec4 u_xlat2;
int u_xlati2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
lowp float u_xlat10_9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
float u_xlat14;
lowp float u_xlat10_14;
ivec2 u_xlati14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
float u_xlat20;
int u_xlati20;
bool u_xlatb20;
float u_xlat21;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat18 = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).y;
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).y;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat7.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
    u_xlat13 = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).y;
    u_xlat19 = max(u_xlat0.y, u_xlat18);
    u_xlat2.x = min(u_xlat0.y, u_xlat18);
    u_xlat19 = max(u_xlat19, u_xlat1.x);
    u_xlat2.x = min(u_xlat1.x, u_xlat2.x);
    u_xlat8.x = max(u_xlat13, u_xlat7.x);
    u_xlat14 = min(u_xlat13, u_xlat7.x);
    u_xlat19 = max(u_xlat19, u_xlat8.x);
    u_xlat2.x = min(u_xlat2.x, u_xlat14);
    u_xlat8.x = u_xlat19 * 0.063000001;
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat2.x = max(u_xlat8.x, 0.0311999992);
    u_xlatb2.x = u_xlat19>=u_xlat2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
        u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
        u_xlat8.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.y = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).y;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).y;
        u_xlat2.w = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).y;
        u_xlat3.x = u_xlat18 + u_xlat7.x;
        u_xlat9.x = u_xlat1.x + u_xlat13;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlat15.x = u_xlat9.x + u_xlat3.x;
        u_xlat3.x = u_xlat0.y * -2.0 + u_xlat3.x;
        u_xlat9.x = u_xlat0.y * -2.0 + u_xlat9.x;
        u_xlat21 = u_xlat2.y + u_xlat10_14;
        u_xlat14 = u_xlat10_14 + u_xlat2.x;
        u_xlat4.x = u_xlat1.x * -2.0 + u_xlat21;
        u_xlat14 = u_xlat7.x * -2.0 + u_xlat14;
        u_xlat2.xy = u_xlat2.wy + u_xlat2.xw;
        u_xlat20 = abs(u_xlat3.x) * 2.0 + abs(u_xlat4.x);
        u_xlat14 = abs(u_xlat9.x) * 2.0 + abs(u_xlat14);
        u_xlat3.x = u_xlat13 * -2.0 + u_xlat2.x;
        u_xlat8.x = u_xlat18 * -2.0 + u_xlat2.y;
        u_xlat20 = u_xlat20 + abs(u_xlat3.x);
        u_xlat8.x = u_xlat14 + abs(u_xlat8.x);
        u_xlat2.x = u_xlat21 + u_xlat2.x;
        u_xlatb8 = u_xlat20>=u_xlat8.x;
        u_xlat2.x = u_xlat15.x * 2.0 + u_xlat2.x;
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat13;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat1.x;
        u_xlat1.x = (u_xlatb8) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat13 = u_xlat2.x * 0.0833333358 + (-u_xlat0.y);
        u_xlat2.x = (-u_xlat0.y) + u_xlat7.x;
        u_xlat14 = (-u_xlat0.y) + u_xlat18;
        u_xlat7.x = u_xlat0.y + u_xlat7.x;
        u_xlat18 = u_xlat0.y + u_xlat18;
        u_xlatb20 = abs(u_xlat2.x)>=abs(u_xlat14);
        u_xlat2.x = max(abs(u_xlat14), abs(u_xlat2.x));
        u_xlat1.x = (u_xlatb20) ? (-u_xlat1.x) : u_xlat1.x;
        u_xlat13 = u_xlat19 * abs(u_xlat13);
        u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
        u_xlat19 = u_xlatb8 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat14 = (u_xlatb8) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat3.xy = u_xlat1.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat3.x;
        u_xlat9.x = (u_xlatb8) ? u_xlat3.y : vs_TEXCOORD0.y;
        u_xlat4.x = (-u_xlat19) + u_xlat3.x;
        u_xlat4.y = (-u_xlat14) + u_xlat9.x;
        u_xlat5.x = u_xlat19 + u_xlat3.x;
        u_xlat5.y = u_xlat14 + u_xlat9.x;
        u_xlat3.x = u_xlat13 * -2.0 + 3.0;
        u_xlat9.xy = u_xlat4.xy;
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat9.xy = u_xlat9.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_9 = texture2DLodEXT(_MainTex, u_xlat9.xy, 0.0).y;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat15.xy = u_xlat5.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).y;
        u_xlat18 = (u_xlatb20) ? u_xlat7.x : u_xlat18;
        u_xlat7.x = u_xlat2.x * 0.25;
        u_xlat2.x = (-u_xlat18) * 0.5 + u_xlat0.y;
        u_xlat13 = u_xlat13 * u_xlat3.x;
        u_xlati2 = int((u_xlat2.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat18) * 0.5 + u_xlat10_9;
        u_xlat3.y = (-u_xlat18) * 0.5 + u_xlat10_15;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
        u_xlat20 = (-u_xlat19) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
        u_xlat20 = (-u_xlat14) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat20;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati20 = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat10.x = u_xlat19 * 1.5 + u_xlat5.x;
        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat10.x;
        u_xlat5.x = u_xlat14 * 1.5 + u_xlat5.y;
        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat5.x;
        if(u_xlati20 != 0) {
            if(u_xlati15.x == 0) {
                u_xlat5.xy = u_xlat4.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            if(u_xlati15.y == 0) {
                u_xlat5.xy = u_xlat10.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
            u_xlati5.xy = op_not(u_xlati15.xy);
            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
            if(u_xlati20 != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat5.xy = u_xlat4.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                if(u_xlati15.y == 0) {
                    u_xlat5.xy = u_xlat10.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                u_xlati5.xy = op_not(u_xlati15.xy);
                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                if(u_xlati20 != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat5.xy = u_xlat4.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat5.xy = u_xlat10.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                    u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                    u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                    u_xlati5.xy = op_not(u_xlati15.xy);
                    u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                    u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                    u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                    u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                    u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                    if(u_xlati20 != 0) {
                        if(u_xlati15.x == 0) {
                            u_xlat5.xy = u_xlat4.xz;
                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                        }
                        if(u_xlati15.y == 0) {
                            u_xlat5.xy = u_xlat10.xz;
                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                        }
                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                        u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                        u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                        u_xlati5.xy = op_not(u_xlati15.xy);
                        u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                        u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                        u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                        if(u_xlati20 != 0) {
                            if(u_xlati15.x == 0) {
                                u_xlat5.xy = u_xlat4.xz;
                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                            }
                            if(u_xlati15.y == 0) {
                                u_xlat5.xy = u_xlat10.xz;
                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                            }
                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                            u_xlati5.xy = op_not(u_xlati15.xy);
                            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                            if(u_xlati20 != 0) {
                                if(u_xlati15.x == 0) {
                                    u_xlat5.xy = u_xlat4.xz;
                                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                }
                                if(u_xlati15.y == 0) {
                                    u_xlat5.xy = u_xlat10.xz;
                                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                }
                                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                u_xlati5.xy = op_not(u_xlati15.xy);
                                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                if(u_xlati20 != 0) {
                                    if(u_xlati15.x == 0) {
                                        u_xlat5.xy = u_xlat4.xz;
                                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                    }
                                    if(u_xlati15.y == 0) {
                                        u_xlat5.xy = u_xlat10.xz;
                                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                    }
                                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                    u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                    u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                    u_xlati5.xy = op_not(u_xlati15.xy);
                                    u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                    u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                                    u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                    u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                                    u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                    if(u_xlati20 != 0) {
                                        if(u_xlati15.x == 0) {
                                            u_xlat5.xy = u_xlat4.xz;
                                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                        }
                                        if(u_xlati15.y == 0) {
                                            u_xlat5.xy = u_xlat10.xz;
                                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                        }
                                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                        u_xlat20 = (-u_xlat19) * 4.0 + u_xlat4.x;
                                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                        u_xlat20 = (-u_xlat14) * 4.0 + u_xlat4.z;
                                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                        u_xlati5.xy = op_not(u_xlati15.xy);
                                        u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                        u_xlat5.x = u_xlat19 * 4.0 + u_xlat10.x;
                                        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                        u_xlat5.x = u_xlat14 * 4.0 + u_xlat10.z;
                                        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                        if(u_xlati20 != 0) {
                                            if(u_xlati15.x == 0) {
                                                u_xlat5.xy = u_xlat4.xz;
                                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                            }
                                            if(u_xlati15.y == 0) {
                                                u_xlat5.xy = u_xlat10.xz;
                                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                            }
                                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                            u_xlat18 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat18;
                                            u_xlatb15.xy = greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy;
                                            u_xlat18 = (-u_xlat19) * 8.0 + u_xlat4.x;
                                            u_xlat4.x = (u_xlatb15.x) ? u_xlat4.x : u_xlat18;
                                            u_xlat18 = (-u_xlat14) * 8.0 + u_xlat4.z;
                                            u_xlat4.z = (u_xlatb15.x) ? u_xlat4.z : u_xlat18;
                                            u_xlat18 = u_xlat19 * 8.0 + u_xlat10.x;
                                            u_xlat10.x = (u_xlatb15.y) ? u_xlat10.x : u_xlat18;
                                            u_xlat18 = u_xlat14 * 8.0 + u_xlat10.z;
                                            u_xlat10.z = (u_xlatb15.y) ? u_xlat10.z : u_xlat18;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        u_xlat18 = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat19 = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat19;
        u_xlat7.xz = u_xlat10.xz + (-vs_TEXCOORD0.xy);
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat7.z;
        u_xlati14.xy = ivec2(ivec2(lessThan(u_xlat3.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy) * -1);
        u_xlat19 = u_xlat18 + u_xlat7.x;
        u_xlatb2.xz = notEqual(ivec4(u_xlati2), u_xlati14.xxyx).xz;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlatb20 = u_xlat18<u_xlat7.x;
        u_xlat18 = min(u_xlat18, u_xlat7.x);
        u_xlatb7 = (u_xlatb20) ? u_xlatb2.x : u_xlatb2.z;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat18 = u_xlat18 * (-u_xlat19) + 0.5;
        u_xlat18 = u_xlatb7 ? u_xlat18 : float(0.0);
        u_xlat18 = max(u_xlat13, u_xlat18);
        u_xlat1.xy = vec2(u_xlat18) * u_xlat1.xx + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat3.y = (u_xlatb8) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat3.y = clamp(u_xlat3.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat3.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat10_18 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_18;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA" "FXAA_KEEP_ALPHA" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
vec4 u_xlat2;
int u_xlati2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
lowp float u_xlat10_9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
float u_xlat14;
lowp float u_xlat10_14;
ivec2 u_xlati14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
float u_xlat20;
int u_xlati20;
bool u_xlatb20;
float u_xlat21;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat18 = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).y;
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).y;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat7.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
    u_xlat13 = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).y;
    u_xlat19 = max(u_xlat0.y, u_xlat18);
    u_xlat2.x = min(u_xlat0.y, u_xlat18);
    u_xlat19 = max(u_xlat19, u_xlat1.x);
    u_xlat2.x = min(u_xlat1.x, u_xlat2.x);
    u_xlat8.x = max(u_xlat13, u_xlat7.x);
    u_xlat14 = min(u_xlat13, u_xlat7.x);
    u_xlat19 = max(u_xlat19, u_xlat8.x);
    u_xlat2.x = min(u_xlat2.x, u_xlat14);
    u_xlat8.x = u_xlat19 * 0.063000001;
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat2.x = max(u_xlat8.x, 0.0311999992);
    u_xlatb2.x = u_xlat19>=u_xlat2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
        u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
        u_xlat8.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.y = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).y;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).y;
        u_xlat2.w = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).y;
        u_xlat3.x = u_xlat18 + u_xlat7.x;
        u_xlat9.x = u_xlat1.x + u_xlat13;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlat15.x = u_xlat9.x + u_xlat3.x;
        u_xlat3.x = u_xlat0.y * -2.0 + u_xlat3.x;
        u_xlat9.x = u_xlat0.y * -2.0 + u_xlat9.x;
        u_xlat21 = u_xlat2.y + u_xlat10_14;
        u_xlat14 = u_xlat10_14 + u_xlat2.x;
        u_xlat4.x = u_xlat1.x * -2.0 + u_xlat21;
        u_xlat14 = u_xlat7.x * -2.0 + u_xlat14;
        u_xlat2.xy = u_xlat2.wy + u_xlat2.xw;
        u_xlat20 = abs(u_xlat3.x) * 2.0 + abs(u_xlat4.x);
        u_xlat14 = abs(u_xlat9.x) * 2.0 + abs(u_xlat14);
        u_xlat3.x = u_xlat13 * -2.0 + u_xlat2.x;
        u_xlat8.x = u_xlat18 * -2.0 + u_xlat2.y;
        u_xlat20 = u_xlat20 + abs(u_xlat3.x);
        u_xlat8.x = u_xlat14 + abs(u_xlat8.x);
        u_xlat2.x = u_xlat21 + u_xlat2.x;
        u_xlatb8 = u_xlat20>=u_xlat8.x;
        u_xlat2.x = u_xlat15.x * 2.0 + u_xlat2.x;
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat13;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat1.x;
        u_xlat1.x = (u_xlatb8) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat13 = u_xlat2.x * 0.0833333358 + (-u_xlat0.y);
        u_xlat2.x = (-u_xlat0.y) + u_xlat7.x;
        u_xlat14 = (-u_xlat0.y) + u_xlat18;
        u_xlat7.x = u_xlat0.y + u_xlat7.x;
        u_xlat18 = u_xlat0.y + u_xlat18;
        u_xlatb20 = abs(u_xlat2.x)>=abs(u_xlat14);
        u_xlat2.x = max(abs(u_xlat14), abs(u_xlat2.x));
        u_xlat1.x = (u_xlatb20) ? (-u_xlat1.x) : u_xlat1.x;
        u_xlat13 = u_xlat19 * abs(u_xlat13);
        u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
        u_xlat19 = u_xlatb8 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat14 = (u_xlatb8) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat3.xy = u_xlat1.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat3.x;
        u_xlat9.x = (u_xlatb8) ? u_xlat3.y : vs_TEXCOORD0.y;
        u_xlat4.x = (-u_xlat19) + u_xlat3.x;
        u_xlat4.y = (-u_xlat14) + u_xlat9.x;
        u_xlat5.x = u_xlat19 + u_xlat3.x;
        u_xlat5.y = u_xlat14 + u_xlat9.x;
        u_xlat3.x = u_xlat13 * -2.0 + 3.0;
        u_xlat9.xy = u_xlat4.xy;
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat9.xy = u_xlat9.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_9 = texture2DLodEXT(_MainTex, u_xlat9.xy, 0.0).y;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat15.xy = u_xlat5.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).y;
        u_xlat18 = (u_xlatb20) ? u_xlat7.x : u_xlat18;
        u_xlat7.x = u_xlat2.x * 0.25;
        u_xlat2.x = (-u_xlat18) * 0.5 + u_xlat0.y;
        u_xlat13 = u_xlat13 * u_xlat3.x;
        u_xlati2 = int((u_xlat2.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat18) * 0.5 + u_xlat10_9;
        u_xlat3.y = (-u_xlat18) * 0.5 + u_xlat10_15;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
        u_xlat20 = (-u_xlat19) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
        u_xlat20 = (-u_xlat14) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat20;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati20 = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat10.x = u_xlat19 * 1.5 + u_xlat5.x;
        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat10.x;
        u_xlat5.x = u_xlat14 * 1.5 + u_xlat5.y;
        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat5.x;
        if(u_xlati20 != 0) {
            if(u_xlati15.x == 0) {
                u_xlat5.xy = u_xlat4.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            if(u_xlati15.y == 0) {
                u_xlat5.xy = u_xlat10.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
            u_xlati5.xy = op_not(u_xlati15.xy);
            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
            if(u_xlati20 != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat5.xy = u_xlat4.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                if(u_xlati15.y == 0) {
                    u_xlat5.xy = u_xlat10.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                u_xlati5.xy = op_not(u_xlati15.xy);
                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                if(u_xlati20 != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat5.xy = u_xlat4.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat5.xy = u_xlat10.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                    u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                    u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                    u_xlati5.xy = op_not(u_xlati15.xy);
                    u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                    u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                    u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                    u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                    u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                    if(u_xlati20 != 0) {
                        if(u_xlati15.x == 0) {
                            u_xlat5.xy = u_xlat4.xz;
                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                        }
                        if(u_xlati15.y == 0) {
                            u_xlat5.xy = u_xlat10.xz;
                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                        }
                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                        u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                        u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                        u_xlati5.xy = op_not(u_xlati15.xy);
                        u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                        u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                        u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                        if(u_xlati20 != 0) {
                            if(u_xlati15.x == 0) {
                                u_xlat5.xy = u_xlat4.xz;
                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                            }
                            if(u_xlati15.y == 0) {
                                u_xlat5.xy = u_xlat10.xz;
                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                            }
                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                            u_xlati5.xy = op_not(u_xlati15.xy);
                            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                            if(u_xlati20 != 0) {
                                if(u_xlati15.x == 0) {
                                    u_xlat5.xy = u_xlat4.xz;
                                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                }
                                if(u_xlati15.y == 0) {
                                    u_xlat5.xy = u_xlat10.xz;
                                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                }
                                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                u_xlati5.xy = op_not(u_xlati15.xy);
                                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                if(u_xlati20 != 0) {
                                    if(u_xlati15.x == 0) {
                                        u_xlat5.xy = u_xlat4.xz;
                                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                    }
                                    if(u_xlati15.y == 0) {
                                        u_xlat5.xy = u_xlat10.xz;
                                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                    }
                                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                    u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                    u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                    u_xlati5.xy = op_not(u_xlati15.xy);
                                    u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                    u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                                    u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                    u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                                    u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                    if(u_xlati20 != 0) {
                                        if(u_xlati15.x == 0) {
                                            u_xlat5.xy = u_xlat4.xz;
                                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                        }
                                        if(u_xlati15.y == 0) {
                                            u_xlat5.xy = u_xlat10.xz;
                                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                        }
                                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                        u_xlat20 = (-u_xlat19) * 4.0 + u_xlat4.x;
                                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                        u_xlat20 = (-u_xlat14) * 4.0 + u_xlat4.z;
                                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                        u_xlati5.xy = op_not(u_xlati15.xy);
                                        u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                        u_xlat5.x = u_xlat19 * 4.0 + u_xlat10.x;
                                        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                        u_xlat5.x = u_xlat14 * 4.0 + u_xlat10.z;
                                        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                        if(u_xlati20 != 0) {
                                            if(u_xlati15.x == 0) {
                                                u_xlat5.xy = u_xlat4.xz;
                                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                            }
                                            if(u_xlati15.y == 0) {
                                                u_xlat5.xy = u_xlat10.xz;
                                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                            }
                                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                            u_xlat18 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat18;
                                            u_xlatb15.xy = greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy;
                                            u_xlat18 = (-u_xlat19) * 8.0 + u_xlat4.x;
                                            u_xlat4.x = (u_xlatb15.x) ? u_xlat4.x : u_xlat18;
                                            u_xlat18 = (-u_xlat14) * 8.0 + u_xlat4.z;
                                            u_xlat4.z = (u_xlatb15.x) ? u_xlat4.z : u_xlat18;
                                            u_xlat18 = u_xlat19 * 8.0 + u_xlat10.x;
                                            u_xlat10.x = (u_xlatb15.y) ? u_xlat10.x : u_xlat18;
                                            u_xlat18 = u_xlat14 * 8.0 + u_xlat10.z;
                                            u_xlat10.z = (u_xlatb15.y) ? u_xlat10.z : u_xlat18;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        u_xlat18 = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat19 = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat19;
        u_xlat7.xz = u_xlat10.xz + (-vs_TEXCOORD0.xy);
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat7.z;
        u_xlati14.xy = ivec2(ivec2(lessThan(u_xlat3.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy) * -1);
        u_xlat19 = u_xlat18 + u_xlat7.x;
        u_xlatb2.xz = notEqual(ivec4(u_xlati2), u_xlati14.xxyx).xz;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlatb20 = u_xlat18<u_xlat7.x;
        u_xlat18 = min(u_xlat18, u_xlat7.x);
        u_xlatb7 = (u_xlatb20) ? u_xlatb2.x : u_xlatb2.z;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat18 = u_xlat18 * (-u_xlat19) + 0.5;
        u_xlat18 = u_xlatb7 ? u_xlat18 : float(0.0);
        u_xlat18 = max(u_xlat13, u_xlat18);
        u_xlat1.xy = vec2(u_xlat18) * u_xlat1.xx + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat3.y = (u_xlatb8) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat3.y = clamp(u_xlat3.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat3.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat10_18 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_18;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA" "FXAA_KEEP_ALPHA" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
vec4 u_xlat2;
int u_xlati2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
lowp float u_xlat10_9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
float u_xlat14;
lowp float u_xlat10_14;
ivec2 u_xlati14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
float u_xlat20;
int u_xlati20;
bool u_xlatb20;
float u_xlat21;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat18 = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).y;
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).y;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat7.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
    u_xlat13 = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).y;
    u_xlat19 = max(u_xlat0.y, u_xlat18);
    u_xlat2.x = min(u_xlat0.y, u_xlat18);
    u_xlat19 = max(u_xlat19, u_xlat1.x);
    u_xlat2.x = min(u_xlat1.x, u_xlat2.x);
    u_xlat8.x = max(u_xlat13, u_xlat7.x);
    u_xlat14 = min(u_xlat13, u_xlat7.x);
    u_xlat19 = max(u_xlat19, u_xlat8.x);
    u_xlat2.x = min(u_xlat2.x, u_xlat14);
    u_xlat8.x = u_xlat19 * 0.063000001;
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat2.x = max(u_xlat8.x, 0.0311999992);
    u_xlatb2.x = u_xlat19>=u_xlat2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
        u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
        u_xlat8.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.y = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).y;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).y;
        u_xlat2.w = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).y;
        u_xlat3.x = u_xlat18 + u_xlat7.x;
        u_xlat9.x = u_xlat1.x + u_xlat13;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlat15.x = u_xlat9.x + u_xlat3.x;
        u_xlat3.x = u_xlat0.y * -2.0 + u_xlat3.x;
        u_xlat9.x = u_xlat0.y * -2.0 + u_xlat9.x;
        u_xlat21 = u_xlat2.y + u_xlat10_14;
        u_xlat14 = u_xlat10_14 + u_xlat2.x;
        u_xlat4.x = u_xlat1.x * -2.0 + u_xlat21;
        u_xlat14 = u_xlat7.x * -2.0 + u_xlat14;
        u_xlat2.xy = u_xlat2.wy + u_xlat2.xw;
        u_xlat20 = abs(u_xlat3.x) * 2.0 + abs(u_xlat4.x);
        u_xlat14 = abs(u_xlat9.x) * 2.0 + abs(u_xlat14);
        u_xlat3.x = u_xlat13 * -2.0 + u_xlat2.x;
        u_xlat8.x = u_xlat18 * -2.0 + u_xlat2.y;
        u_xlat20 = u_xlat20 + abs(u_xlat3.x);
        u_xlat8.x = u_xlat14 + abs(u_xlat8.x);
        u_xlat2.x = u_xlat21 + u_xlat2.x;
        u_xlatb8 = u_xlat20>=u_xlat8.x;
        u_xlat2.x = u_xlat15.x * 2.0 + u_xlat2.x;
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat13;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat1.x;
        u_xlat1.x = (u_xlatb8) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat13 = u_xlat2.x * 0.0833333358 + (-u_xlat0.y);
        u_xlat2.x = (-u_xlat0.y) + u_xlat7.x;
        u_xlat14 = (-u_xlat0.y) + u_xlat18;
        u_xlat7.x = u_xlat0.y + u_xlat7.x;
        u_xlat18 = u_xlat0.y + u_xlat18;
        u_xlatb20 = abs(u_xlat2.x)>=abs(u_xlat14);
        u_xlat2.x = max(abs(u_xlat14), abs(u_xlat2.x));
        u_xlat1.x = (u_xlatb20) ? (-u_xlat1.x) : u_xlat1.x;
        u_xlat13 = u_xlat19 * abs(u_xlat13);
        u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
        u_xlat19 = u_xlatb8 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat14 = (u_xlatb8) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat3.xy = u_xlat1.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat3.x;
        u_xlat9.x = (u_xlatb8) ? u_xlat3.y : vs_TEXCOORD0.y;
        u_xlat4.x = (-u_xlat19) + u_xlat3.x;
        u_xlat4.y = (-u_xlat14) + u_xlat9.x;
        u_xlat5.x = u_xlat19 + u_xlat3.x;
        u_xlat5.y = u_xlat14 + u_xlat9.x;
        u_xlat3.x = u_xlat13 * -2.0 + 3.0;
        u_xlat9.xy = u_xlat4.xy;
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat9.xy = u_xlat9.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_9 = texture2DLodEXT(_MainTex, u_xlat9.xy, 0.0).y;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat15.xy = u_xlat5.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).y;
        u_xlat18 = (u_xlatb20) ? u_xlat7.x : u_xlat18;
        u_xlat7.x = u_xlat2.x * 0.25;
        u_xlat2.x = (-u_xlat18) * 0.5 + u_xlat0.y;
        u_xlat13 = u_xlat13 * u_xlat3.x;
        u_xlati2 = int((u_xlat2.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat18) * 0.5 + u_xlat10_9;
        u_xlat3.y = (-u_xlat18) * 0.5 + u_xlat10_15;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
        u_xlat20 = (-u_xlat19) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
        u_xlat20 = (-u_xlat14) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat20;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati20 = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat10.x = u_xlat19 * 1.5 + u_xlat5.x;
        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat10.x;
        u_xlat5.x = u_xlat14 * 1.5 + u_xlat5.y;
        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat5.x;
        if(u_xlati20 != 0) {
            if(u_xlati15.x == 0) {
                u_xlat5.xy = u_xlat4.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            if(u_xlati15.y == 0) {
                u_xlat5.xy = u_xlat10.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
            u_xlati5.xy = op_not(u_xlati15.xy);
            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
            if(u_xlati20 != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat5.xy = u_xlat4.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                if(u_xlati15.y == 0) {
                    u_xlat5.xy = u_xlat10.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                u_xlati5.xy = op_not(u_xlati15.xy);
                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                if(u_xlati20 != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat5.xy = u_xlat4.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat5.xy = u_xlat10.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                    u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                    u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                    u_xlati5.xy = op_not(u_xlati15.xy);
                    u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                    u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                    u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                    u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                    u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                    if(u_xlati20 != 0) {
                        if(u_xlati15.x == 0) {
                            u_xlat5.xy = u_xlat4.xz;
                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                        }
                        if(u_xlati15.y == 0) {
                            u_xlat5.xy = u_xlat10.xz;
                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                        }
                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                        u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                        u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                        u_xlati5.xy = op_not(u_xlati15.xy);
                        u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                        u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                        u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                        if(u_xlati20 != 0) {
                            if(u_xlati15.x == 0) {
                                u_xlat5.xy = u_xlat4.xz;
                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                            }
                            if(u_xlati15.y == 0) {
                                u_xlat5.xy = u_xlat10.xz;
                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                            }
                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                            u_xlati5.xy = op_not(u_xlati15.xy);
                            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                            if(u_xlati20 != 0) {
                                if(u_xlati15.x == 0) {
                                    u_xlat5.xy = u_xlat4.xz;
                                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                }
                                if(u_xlati15.y == 0) {
                                    u_xlat5.xy = u_xlat10.xz;
                                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                }
                                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                u_xlati5.xy = op_not(u_xlati15.xy);
                                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                if(u_xlati20 != 0) {
                                    if(u_xlati15.x == 0) {
                                        u_xlat5.xy = u_xlat4.xz;
                                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                    }
                                    if(u_xlati15.y == 0) {
                                        u_xlat5.xy = u_xlat10.xz;
                                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                    }
                                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                    u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                    u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                    u_xlati5.xy = op_not(u_xlati15.xy);
                                    u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                    u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                                    u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                    u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                                    u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                    if(u_xlati20 != 0) {
                                        if(u_xlati15.x == 0) {
                                            u_xlat5.xy = u_xlat4.xz;
                                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                        }
                                        if(u_xlati15.y == 0) {
                                            u_xlat5.xy = u_xlat10.xz;
                                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                        }
                                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                        u_xlat20 = (-u_xlat19) * 4.0 + u_xlat4.x;
                                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                        u_xlat20 = (-u_xlat14) * 4.0 + u_xlat4.z;
                                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                        u_xlati5.xy = op_not(u_xlati15.xy);
                                        u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                        u_xlat5.x = u_xlat19 * 4.0 + u_xlat10.x;
                                        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                        u_xlat5.x = u_xlat14 * 4.0 + u_xlat10.z;
                                        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                        if(u_xlati20 != 0) {
                                            if(u_xlati15.x == 0) {
                                                u_xlat5.xy = u_xlat4.xz;
                                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                            }
                                            if(u_xlati15.y == 0) {
                                                u_xlat5.xy = u_xlat10.xz;
                                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                            }
                                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                            u_xlat18 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat18;
                                            u_xlatb15.xy = greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy;
                                            u_xlat18 = (-u_xlat19) * 8.0 + u_xlat4.x;
                                            u_xlat4.x = (u_xlatb15.x) ? u_xlat4.x : u_xlat18;
                                            u_xlat18 = (-u_xlat14) * 8.0 + u_xlat4.z;
                                            u_xlat4.z = (u_xlatb15.x) ? u_xlat4.z : u_xlat18;
                                            u_xlat18 = u_xlat19 * 8.0 + u_xlat10.x;
                                            u_xlat10.x = (u_xlatb15.y) ? u_xlat10.x : u_xlat18;
                                            u_xlat18 = u_xlat14 * 8.0 + u_xlat10.z;
                                            u_xlat10.z = (u_xlatb15.y) ? u_xlat10.z : u_xlat18;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        u_xlat18 = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat19 = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat19;
        u_xlat7.xz = u_xlat10.xz + (-vs_TEXCOORD0.xy);
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat7.z;
        u_xlati14.xy = ivec2(ivec2(lessThan(u_xlat3.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy) * -1);
        u_xlat19 = u_xlat18 + u_xlat7.x;
        u_xlatb2.xz = notEqual(ivec4(u_xlati2), u_xlati14.xxyx).xz;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlatb20 = u_xlat18<u_xlat7.x;
        u_xlat18 = min(u_xlat18, u_xlat7.x);
        u_xlatb7 = (u_xlatb20) ? u_xlatb2.x : u_xlatb2.z;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat18 = u_xlat18 * (-u_xlat19) + 0.5;
        u_xlat18 = u_xlatb7 ? u_xlat18 : float(0.0);
        u_xlat18 = max(u_xlat13, u_xlat18);
        u_xlat1.xy = vec2(u_xlat18) * u_xlat1.xx + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat3.y = (u_xlatb8) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat3.y = clamp(u_xlat3.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat3.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat10_18 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_18;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA" "FXAA_KEEP_ALPHA" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
vec4 u_xlat2;
int u_xlati2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
lowp float u_xlat10_9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
float u_xlat14;
lowp float u_xlat10_14;
ivec2 u_xlati14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
float u_xlat20;
int u_xlati20;
bool u_xlatb20;
float u_xlat21;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat18 = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).y;
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).y;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat7.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
    u_xlat13 = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).y;
    u_xlat19 = max(u_xlat0.y, u_xlat18);
    u_xlat2.x = min(u_xlat0.y, u_xlat18);
    u_xlat19 = max(u_xlat19, u_xlat1.x);
    u_xlat2.x = min(u_xlat1.x, u_xlat2.x);
    u_xlat8.x = max(u_xlat13, u_xlat7.x);
    u_xlat14 = min(u_xlat13, u_xlat7.x);
    u_xlat19 = max(u_xlat19, u_xlat8.x);
    u_xlat2.x = min(u_xlat2.x, u_xlat14);
    u_xlat8.x = u_xlat19 * 0.063000001;
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat2.x = max(u_xlat8.x, 0.0311999992);
    u_xlatb2.x = u_xlat19>=u_xlat2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
        u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
        u_xlat8.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.y = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).y;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).y;
        u_xlat2.w = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).y;
        u_xlat3.x = u_xlat18 + u_xlat7.x;
        u_xlat9.x = u_xlat1.x + u_xlat13;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlat15.x = u_xlat9.x + u_xlat3.x;
        u_xlat3.x = u_xlat0.y * -2.0 + u_xlat3.x;
        u_xlat9.x = u_xlat0.y * -2.0 + u_xlat9.x;
        u_xlat21 = u_xlat2.y + u_xlat10_14;
        u_xlat14 = u_xlat10_14 + u_xlat2.x;
        u_xlat4.x = u_xlat1.x * -2.0 + u_xlat21;
        u_xlat14 = u_xlat7.x * -2.0 + u_xlat14;
        u_xlat2.xy = u_xlat2.wy + u_xlat2.xw;
        u_xlat20 = abs(u_xlat3.x) * 2.0 + abs(u_xlat4.x);
        u_xlat14 = abs(u_xlat9.x) * 2.0 + abs(u_xlat14);
        u_xlat3.x = u_xlat13 * -2.0 + u_xlat2.x;
        u_xlat8.x = u_xlat18 * -2.0 + u_xlat2.y;
        u_xlat20 = u_xlat20 + abs(u_xlat3.x);
        u_xlat8.x = u_xlat14 + abs(u_xlat8.x);
        u_xlat2.x = u_xlat21 + u_xlat2.x;
        u_xlatb8 = u_xlat20>=u_xlat8.x;
        u_xlat2.x = u_xlat15.x * 2.0 + u_xlat2.x;
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat13;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat1.x;
        u_xlat1.x = (u_xlatb8) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat13 = u_xlat2.x * 0.0833333358 + (-u_xlat0.y);
        u_xlat2.x = (-u_xlat0.y) + u_xlat7.x;
        u_xlat14 = (-u_xlat0.y) + u_xlat18;
        u_xlat7.x = u_xlat0.y + u_xlat7.x;
        u_xlat18 = u_xlat0.y + u_xlat18;
        u_xlatb20 = abs(u_xlat2.x)>=abs(u_xlat14);
        u_xlat2.x = max(abs(u_xlat14), abs(u_xlat2.x));
        u_xlat1.x = (u_xlatb20) ? (-u_xlat1.x) : u_xlat1.x;
        u_xlat13 = u_xlat19 * abs(u_xlat13);
        u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
        u_xlat19 = u_xlatb8 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat14 = (u_xlatb8) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat3.xy = u_xlat1.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat3.x;
        u_xlat9.x = (u_xlatb8) ? u_xlat3.y : vs_TEXCOORD0.y;
        u_xlat4.x = (-u_xlat19) + u_xlat3.x;
        u_xlat4.y = (-u_xlat14) + u_xlat9.x;
        u_xlat5.x = u_xlat19 + u_xlat3.x;
        u_xlat5.y = u_xlat14 + u_xlat9.x;
        u_xlat3.x = u_xlat13 * -2.0 + 3.0;
        u_xlat9.xy = u_xlat4.xy;
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat9.xy = u_xlat9.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_9 = texture2DLodEXT(_MainTex, u_xlat9.xy, 0.0).y;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat15.xy = u_xlat5.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).y;
        u_xlat18 = (u_xlatb20) ? u_xlat7.x : u_xlat18;
        u_xlat7.x = u_xlat2.x * 0.25;
        u_xlat2.x = (-u_xlat18) * 0.5 + u_xlat0.y;
        u_xlat13 = u_xlat13 * u_xlat3.x;
        u_xlati2 = int((u_xlat2.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat18) * 0.5 + u_xlat10_9;
        u_xlat3.y = (-u_xlat18) * 0.5 + u_xlat10_15;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
        u_xlat20 = (-u_xlat19) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
        u_xlat20 = (-u_xlat14) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat20;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati20 = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat10.x = u_xlat19 * 1.5 + u_xlat5.x;
        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat10.x;
        u_xlat5.x = u_xlat14 * 1.5 + u_xlat5.y;
        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat5.x;
        if(u_xlati20 != 0) {
            if(u_xlati15.x == 0) {
                u_xlat5.xy = u_xlat4.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            if(u_xlati15.y == 0) {
                u_xlat5.xy = u_xlat10.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
            u_xlati5.xy = op_not(u_xlati15.xy);
            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
            if(u_xlati20 != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat5.xy = u_xlat4.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                if(u_xlati15.y == 0) {
                    u_xlat5.xy = u_xlat10.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                u_xlati5.xy = op_not(u_xlati15.xy);
                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                if(u_xlati20 != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat5.xy = u_xlat4.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat5.xy = u_xlat10.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                    u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                    u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                    u_xlati5.xy = op_not(u_xlati15.xy);
                    u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                    u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                    u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                    u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                    u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                    if(u_xlati20 != 0) {
                        if(u_xlati15.x == 0) {
                            u_xlat5.xy = u_xlat4.xz;
                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                        }
                        if(u_xlati15.y == 0) {
                            u_xlat5.xy = u_xlat10.xz;
                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                        }
                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                        u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                        u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                        u_xlati5.xy = op_not(u_xlati15.xy);
                        u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                        u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                        u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                        if(u_xlati20 != 0) {
                            if(u_xlati15.x == 0) {
                                u_xlat5.xy = u_xlat4.xz;
                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                            }
                            if(u_xlati15.y == 0) {
                                u_xlat5.xy = u_xlat10.xz;
                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                            }
                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                            u_xlati5.xy = op_not(u_xlati15.xy);
                            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                            if(u_xlati20 != 0) {
                                if(u_xlati15.x == 0) {
                                    u_xlat5.xy = u_xlat4.xz;
                                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                }
                                if(u_xlati15.y == 0) {
                                    u_xlat5.xy = u_xlat10.xz;
                                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                }
                                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                u_xlati5.xy = op_not(u_xlati15.xy);
                                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                if(u_xlati20 != 0) {
                                    if(u_xlati15.x == 0) {
                                        u_xlat5.xy = u_xlat4.xz;
                                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                    }
                                    if(u_xlati15.y == 0) {
                                        u_xlat5.xy = u_xlat10.xz;
                                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                    }
                                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                    u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                    u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
                                    u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                    u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
                                    u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                    u_xlati5.xy = op_not(u_xlati15.xy);
                                    u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                    u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
                                    u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                    u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
                                    u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                    if(u_xlati20 != 0) {
                                        if(u_xlati15.x == 0) {
                                            u_xlat5.xy = u_xlat4.xz;
                                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                        }
                                        if(u_xlati15.y == 0) {
                                            u_xlat5.xy = u_xlat10.xz;
                                            u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                            u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                            u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                        }
                                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                        u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                        u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                        u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                                        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                                        u_xlat20 = (-u_xlat19) * 4.0 + u_xlat4.x;
                                        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                                        u_xlat20 = (-u_xlat14) * 4.0 + u_xlat4.z;
                                        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                                        u_xlati5.xy = op_not(u_xlati15.xy);
                                        u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                                        u_xlat5.x = u_xlat19 * 4.0 + u_xlat10.x;
                                        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                                        u_xlat5.x = u_xlat14 * 4.0 + u_xlat10.z;
                                        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                                        if(u_xlati20 != 0) {
                                            if(u_xlati15.x == 0) {
                                                u_xlat5.xy = u_xlat4.xz;
                                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                            }
                                            if(u_xlati15.y == 0) {
                                                u_xlat5.xy = u_xlat10.xz;
                                                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                                                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                                                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                                            }
                                            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                                            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                                            u_xlat18 = (-u_xlat18) * 0.5 + u_xlat3.y;
                                            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat18;
                                            u_xlatb15.xy = greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy;
                                            u_xlat18 = (-u_xlat19) * 8.0 + u_xlat4.x;
                                            u_xlat4.x = (u_xlatb15.x) ? u_xlat4.x : u_xlat18;
                                            u_xlat18 = (-u_xlat14) * 8.0 + u_xlat4.z;
                                            u_xlat4.z = (u_xlatb15.x) ? u_xlat4.z : u_xlat18;
                                            u_xlat18 = u_xlat19 * 8.0 + u_xlat10.x;
                                            u_xlat10.x = (u_xlatb15.y) ? u_xlat10.x : u_xlat18;
                                            u_xlat18 = u_xlat14 * 8.0 + u_xlat10.z;
                                            u_xlat10.z = (u_xlatb15.y) ? u_xlat10.z : u_xlat18;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        u_xlat18 = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat19 = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat19;
        u_xlat7.xz = u_xlat10.xz + (-vs_TEXCOORD0.xy);
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat7.z;
        u_xlati14.xy = ivec2(ivec2(lessThan(u_xlat3.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy) * -1);
        u_xlat19 = u_xlat18 + u_xlat7.x;
        u_xlatb2.xz = notEqual(ivec4(u_xlati2), u_xlati14.xxyx).xz;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlatb20 = u_xlat18<u_xlat7.x;
        u_xlat18 = min(u_xlat18, u_xlat7.x);
        u_xlatb7 = (u_xlatb20) ? u_xlatb2.x : u_xlatb2.z;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat18 = u_xlat18 * (-u_xlat19) + 0.5;
        u_xlat18 = u_xlatb7 ? u_xlat18 : float(0.0);
        u_xlat18 = max(u_xlat13, u_xlat18);
        u_xlat1.xy = vec2(u_xlat18) * u_xlat1.xx + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat3.y = (u_xlatb8) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat3.y = clamp(u_xlat3.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat3.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat10_18 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_18;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA_LOW" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
ivec4 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
int u_xlati8;
bool u_xlatb8;
vec2 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
mediump float u_xlat16_14;
lowp float u_xlat10_14;
bool u_xlatb14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
vec2 u_xlat16;
float u_xlat19;
float u_xlat20;
mediump float u_xlat16_20;
lowp float u_xlat10_20;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat22;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0);
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).w;
    u_xlat1.y = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).w;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat1.z = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).w;
    u_xlat1.w = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).w;
    u_xlat2.x = max(u_xlat0.w, u_xlat1.x);
    u_xlat8.x = min(u_xlat0.w, u_xlat1.x);
    u_xlat2.x = max(u_xlat1.y, u_xlat2.x);
    u_xlat8.x = min(u_xlat1.y, u_xlat8.x);
    u_xlat14.x = max(u_xlat1.w, u_xlat1.z);
    u_xlat20 = min(u_xlat1.w, u_xlat1.z);
    u_xlat2.x = max(u_xlat2.x, u_xlat14.x);
    u_xlat8.x = min(u_xlat8.x, u_xlat20);
    u_xlat14.x = u_xlat2.x * 0.165999994;
    u_xlat2.x = (-u_xlat8.x) + u_xlat2.x;
    u_xlat8.x = max(u_xlat14.x, 0.0625);
    u_xlatb8 = u_xlat2.x>=u_xlat8.x;
    if(u_xlatb8){
        u_xlat8.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_8 = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).w;
        u_xlat14.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat14.xy, 0.0).w;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_20 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).w;
        u_xlat10_3 = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).w;
        u_xlat9.xy = u_xlat1.xy + u_xlat1.zw;
        u_xlat2.x = float(1.0) / u_xlat2.x;
        u_xlat21 = u_xlat9.y + u_xlat9.x;
        u_xlat9.x = u_xlat0.w * -2.0 + u_xlat9.x;
        u_xlat15.x = u_xlat0.w * -2.0 + u_xlat9.y;
        u_xlat16_4 = u_xlat10_14 + u_xlat10_20;
        u_xlat16_20 = u_xlat10_20 + u_xlat10_8;
        u_xlat10.x = u_xlat1.y * -2.0 + u_xlat16_4;
        u_xlat20 = u_xlat1.z * -2.0 + u_xlat16_20;
        u_xlat16_8 = u_xlat10_8 + u_xlat10_3;
        u_xlat16_14 = u_xlat10_14 + u_xlat10_3;
        u_xlat3.x = abs(u_xlat9.x) * 2.0 + abs(u_xlat10.x);
        u_xlat20 = abs(u_xlat15.x) * 2.0 + abs(u_xlat20);
        u_xlat9.x = u_xlat1.w * -2.0 + u_xlat16_8;
        u_xlat14.x = u_xlat1.x * -2.0 + u_xlat16_14;
        u_xlat3.x = u_xlat3.x + abs(u_xlat9.x);
        u_xlat14.x = u_xlat20 + abs(u_xlat14.x);
        u_xlat16_8 = u_xlat16_4 + u_xlat16_8;
        u_xlatb14 = u_xlat3.x>=u_xlat14.x;
        u_xlat8.x = u_xlat21 * 2.0 + u_xlat16_8;
        u_xlat1.xz = (bool(u_xlatb14)) ? u_xlat1.xz : u_xlat1.yw;
        u_xlat7 = (u_xlatb14) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat19 = u_xlat8.x * 0.0833333358 + (-u_xlat0.w);
        u_xlat8.xz = (-u_xlat0.ww) + u_xlat1.zx;
        u_xlat1.xz = u_xlat0.ww + u_xlat1.xz;
        u_xlatb3 = abs(u_xlat8.x)>=abs(u_xlat8.z);
        u_xlat8.x = max(abs(u_xlat8.z), abs(u_xlat8.x));
        u_xlat7 = (u_xlatb3) ? (-u_xlat7) : u_xlat7;
        u_xlat19 = u_xlat2.x * abs(u_xlat19);
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
        u_xlat2.x = u_xlatb14 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat2.w = (u_xlatb14) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat9.xy = vec2(u_xlat7) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat9.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat9.x;
        u_xlat9.y = (u_xlatb14) ? u_xlat9.y : vs_TEXCOORD0.y;
        u_xlat4.xy = (-u_xlat2.xw) + u_xlat9.xy;
        u_xlat5.xy = u_xlat2.xw + u_xlat9.xy;
        u_xlat9.x = u_xlat19 * -2.0 + 3.0;
        u_xlat15.xy = u_xlat4.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).w;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat16.xy = u_xlat5.xy;
        u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
        u_xlat16.xy = u_xlat16.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_21 = texture2DLodEXT(_MainTex, u_xlat16.xy, 0.0).w;
        u_xlat1.x = (u_xlatb3) ? u_xlat1.z : u_xlat1.x;
        u_xlat13 = u_xlat8.x * 0.25;
        u_xlat8.x = (-u_xlat1.x) * 0.5 + u_xlat0.w;
        u_xlat19 = u_xlat19 * u_xlat9.x;
        u_xlati8 = int((u_xlat8.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat1.x) * 0.5 + u_xlat10_15;
        u_xlat3.y = (-u_xlat1.x) * 0.5 + u_xlat10_21;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
        u_xlat16.x = (-u_xlat2.x) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat16.x;
        u_xlat22 = (-u_xlat2.w) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat22;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat22 = u_xlat2.x * 1.5 + u_xlat5.x;
        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
        u_xlat22 = u_xlat2.w * 1.5 + u_xlat5.y;
        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat22;
        if(u_xlati10.x != 0) {
            if(u_xlati15.x == 0) {
                u_xlat10.xz = u_xlat4.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            if(u_xlati15.y == 0) {
                u_xlat10.xz = u_xlat5.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
            u_xlati10.xz = op_not(u_xlati15.xy);
            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
            if(u_xlati10.x != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat10.xz = u_xlat4.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                if(u_xlati15.y == 0) {
                    u_xlat10.xz = u_xlat5.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                u_xlat10.x = (-u_xlat2.x) * 4.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                u_xlat10.x = (-u_xlat2.w) * 4.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                u_xlati10.xz = op_not(u_xlati15.xy);
                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                u_xlat22 = u_xlat2.x * 4.0 + u_xlat5.x;
                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                u_xlat22 = u_xlat2.w * 4.0 + u_xlat5.z;
                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                if(u_xlati10.x != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat10.xz = u_xlat4.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat10.xz = u_xlat5.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                    u_xlat1.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat1.x;
                    u_xlatb1.xz = greaterThanEqual(abs(u_xlat3.xxyx), vec4(u_xlat13)).xz;
                    u_xlat15.x = (-u_xlat2.x) * 12.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlatb1.x) ? u_xlat4.x : u_xlat15.x;
                    u_xlat15.x = (-u_xlat2.w) * 12.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlatb1.x) ? u_xlat4.z : u_xlat15.x;
                    u_xlat1.x = u_xlat2.x * 12.0 + u_xlat5.x;
                    u_xlat5.x = (u_xlatb1.z) ? u_xlat5.x : u_xlat1.x;
                    u_xlat1.x = u_xlat2.w * 12.0 + u_xlat5.z;
                    u_xlat5.z = (u_xlatb1.z) ? u_xlat5.z : u_xlat1.x;
                }
            }
        }
        u_xlat1.x = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat13 = u_xlat5.x + (-vs_TEXCOORD0.x);
        u_xlat2.x = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat1.x = (u_xlatb14) ? u_xlat1.x : u_xlat2.x;
        u_xlat2.x = u_xlat5.z + (-vs_TEXCOORD0.y);
        u_xlat13 = (u_xlatb14) ? u_xlat13 : u_xlat2.x;
        u_xlati2.xw = ivec2(ivec2(lessThan(u_xlat3.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw) * -1);
        u_xlat3.x = u_xlat1.x + u_xlat13;
        u_xlatb2.xy = notEqual(ivec4(u_xlati8), u_xlati2.xwxx).xy;
        u_xlat20 = float(1.0) / u_xlat3.x;
        u_xlatb3 = u_xlat1.x<u_xlat13;
        u_xlat1.x = min(u_xlat13, u_xlat1.x);
        u_xlatb13 = (u_xlatb3) ? u_xlatb2.x : u_xlatb2.y;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat1.x = u_xlat1.x * (-u_xlat20) + 0.5;
        u_xlat1.x = u_xlatb13 ? u_xlat1.x : float(0.0);
        u_xlat1.x = max(u_xlat19, u_xlat1.x);
        u_xlat1.xy = u_xlat1.xx * vec2(u_xlat7) + vs_TEXCOORD0.xy;
        u_xlat2.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
        u_xlat2.y = (u_xlatb14) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA_LOW" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
ivec4 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
int u_xlati8;
bool u_xlatb8;
vec2 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
mediump float u_xlat16_14;
lowp float u_xlat10_14;
bool u_xlatb14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
vec2 u_xlat16;
float u_xlat19;
float u_xlat20;
mediump float u_xlat16_20;
lowp float u_xlat10_20;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat22;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0);
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).w;
    u_xlat1.y = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).w;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat1.z = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).w;
    u_xlat1.w = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).w;
    u_xlat2.x = max(u_xlat0.w, u_xlat1.x);
    u_xlat8.x = min(u_xlat0.w, u_xlat1.x);
    u_xlat2.x = max(u_xlat1.y, u_xlat2.x);
    u_xlat8.x = min(u_xlat1.y, u_xlat8.x);
    u_xlat14.x = max(u_xlat1.w, u_xlat1.z);
    u_xlat20 = min(u_xlat1.w, u_xlat1.z);
    u_xlat2.x = max(u_xlat2.x, u_xlat14.x);
    u_xlat8.x = min(u_xlat8.x, u_xlat20);
    u_xlat14.x = u_xlat2.x * 0.165999994;
    u_xlat2.x = (-u_xlat8.x) + u_xlat2.x;
    u_xlat8.x = max(u_xlat14.x, 0.0625);
    u_xlatb8 = u_xlat2.x>=u_xlat8.x;
    if(u_xlatb8){
        u_xlat8.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_8 = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).w;
        u_xlat14.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat14.xy, 0.0).w;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_20 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).w;
        u_xlat10_3 = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).w;
        u_xlat9.xy = u_xlat1.xy + u_xlat1.zw;
        u_xlat2.x = float(1.0) / u_xlat2.x;
        u_xlat21 = u_xlat9.y + u_xlat9.x;
        u_xlat9.x = u_xlat0.w * -2.0 + u_xlat9.x;
        u_xlat15.x = u_xlat0.w * -2.0 + u_xlat9.y;
        u_xlat16_4 = u_xlat10_14 + u_xlat10_20;
        u_xlat16_20 = u_xlat10_20 + u_xlat10_8;
        u_xlat10.x = u_xlat1.y * -2.0 + u_xlat16_4;
        u_xlat20 = u_xlat1.z * -2.0 + u_xlat16_20;
        u_xlat16_8 = u_xlat10_8 + u_xlat10_3;
        u_xlat16_14 = u_xlat10_14 + u_xlat10_3;
        u_xlat3.x = abs(u_xlat9.x) * 2.0 + abs(u_xlat10.x);
        u_xlat20 = abs(u_xlat15.x) * 2.0 + abs(u_xlat20);
        u_xlat9.x = u_xlat1.w * -2.0 + u_xlat16_8;
        u_xlat14.x = u_xlat1.x * -2.0 + u_xlat16_14;
        u_xlat3.x = u_xlat3.x + abs(u_xlat9.x);
        u_xlat14.x = u_xlat20 + abs(u_xlat14.x);
        u_xlat16_8 = u_xlat16_4 + u_xlat16_8;
        u_xlatb14 = u_xlat3.x>=u_xlat14.x;
        u_xlat8.x = u_xlat21 * 2.0 + u_xlat16_8;
        u_xlat1.xz = (bool(u_xlatb14)) ? u_xlat1.xz : u_xlat1.yw;
        u_xlat7 = (u_xlatb14) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat19 = u_xlat8.x * 0.0833333358 + (-u_xlat0.w);
        u_xlat8.xz = (-u_xlat0.ww) + u_xlat1.zx;
        u_xlat1.xz = u_xlat0.ww + u_xlat1.xz;
        u_xlatb3 = abs(u_xlat8.x)>=abs(u_xlat8.z);
        u_xlat8.x = max(abs(u_xlat8.z), abs(u_xlat8.x));
        u_xlat7 = (u_xlatb3) ? (-u_xlat7) : u_xlat7;
        u_xlat19 = u_xlat2.x * abs(u_xlat19);
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
        u_xlat2.x = u_xlatb14 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat2.w = (u_xlatb14) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat9.xy = vec2(u_xlat7) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat9.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat9.x;
        u_xlat9.y = (u_xlatb14) ? u_xlat9.y : vs_TEXCOORD0.y;
        u_xlat4.xy = (-u_xlat2.xw) + u_xlat9.xy;
        u_xlat5.xy = u_xlat2.xw + u_xlat9.xy;
        u_xlat9.x = u_xlat19 * -2.0 + 3.0;
        u_xlat15.xy = u_xlat4.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).w;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat16.xy = u_xlat5.xy;
        u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
        u_xlat16.xy = u_xlat16.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_21 = texture2DLodEXT(_MainTex, u_xlat16.xy, 0.0).w;
        u_xlat1.x = (u_xlatb3) ? u_xlat1.z : u_xlat1.x;
        u_xlat13 = u_xlat8.x * 0.25;
        u_xlat8.x = (-u_xlat1.x) * 0.5 + u_xlat0.w;
        u_xlat19 = u_xlat19 * u_xlat9.x;
        u_xlati8 = int((u_xlat8.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat1.x) * 0.5 + u_xlat10_15;
        u_xlat3.y = (-u_xlat1.x) * 0.5 + u_xlat10_21;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
        u_xlat16.x = (-u_xlat2.x) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat16.x;
        u_xlat22 = (-u_xlat2.w) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat22;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat22 = u_xlat2.x * 1.5 + u_xlat5.x;
        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
        u_xlat22 = u_xlat2.w * 1.5 + u_xlat5.y;
        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat22;
        if(u_xlati10.x != 0) {
            if(u_xlati15.x == 0) {
                u_xlat10.xz = u_xlat4.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            if(u_xlati15.y == 0) {
                u_xlat10.xz = u_xlat5.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
            u_xlati10.xz = op_not(u_xlati15.xy);
            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
            if(u_xlati10.x != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat10.xz = u_xlat4.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                if(u_xlati15.y == 0) {
                    u_xlat10.xz = u_xlat5.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                u_xlat10.x = (-u_xlat2.x) * 4.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                u_xlat10.x = (-u_xlat2.w) * 4.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                u_xlati10.xz = op_not(u_xlati15.xy);
                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                u_xlat22 = u_xlat2.x * 4.0 + u_xlat5.x;
                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                u_xlat22 = u_xlat2.w * 4.0 + u_xlat5.z;
                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                if(u_xlati10.x != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat10.xz = u_xlat4.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat10.xz = u_xlat5.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                    u_xlat1.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat1.x;
                    u_xlatb1.xz = greaterThanEqual(abs(u_xlat3.xxyx), vec4(u_xlat13)).xz;
                    u_xlat15.x = (-u_xlat2.x) * 12.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlatb1.x) ? u_xlat4.x : u_xlat15.x;
                    u_xlat15.x = (-u_xlat2.w) * 12.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlatb1.x) ? u_xlat4.z : u_xlat15.x;
                    u_xlat1.x = u_xlat2.x * 12.0 + u_xlat5.x;
                    u_xlat5.x = (u_xlatb1.z) ? u_xlat5.x : u_xlat1.x;
                    u_xlat1.x = u_xlat2.w * 12.0 + u_xlat5.z;
                    u_xlat5.z = (u_xlatb1.z) ? u_xlat5.z : u_xlat1.x;
                }
            }
        }
        u_xlat1.x = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat13 = u_xlat5.x + (-vs_TEXCOORD0.x);
        u_xlat2.x = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat1.x = (u_xlatb14) ? u_xlat1.x : u_xlat2.x;
        u_xlat2.x = u_xlat5.z + (-vs_TEXCOORD0.y);
        u_xlat13 = (u_xlatb14) ? u_xlat13 : u_xlat2.x;
        u_xlati2.xw = ivec2(ivec2(lessThan(u_xlat3.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw) * -1);
        u_xlat3.x = u_xlat1.x + u_xlat13;
        u_xlatb2.xy = notEqual(ivec4(u_xlati8), u_xlati2.xwxx).xy;
        u_xlat20 = float(1.0) / u_xlat3.x;
        u_xlatb3 = u_xlat1.x<u_xlat13;
        u_xlat1.x = min(u_xlat13, u_xlat1.x);
        u_xlatb13 = (u_xlatb3) ? u_xlatb2.x : u_xlatb2.y;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat1.x = u_xlat1.x * (-u_xlat20) + 0.5;
        u_xlat1.x = u_xlatb13 ? u_xlat1.x : float(0.0);
        u_xlat1.x = max(u_xlat19, u_xlat1.x);
        u_xlat1.xy = u_xlat1.xx * vec2(u_xlat7) + vs_TEXCOORD0.xy;
        u_xlat2.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
        u_xlat2.y = (u_xlatb14) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA_LOW" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
ivec4 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
int u_xlati8;
bool u_xlatb8;
vec2 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
mediump float u_xlat16_14;
lowp float u_xlat10_14;
bool u_xlatb14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
vec2 u_xlat16;
float u_xlat19;
float u_xlat20;
mediump float u_xlat16_20;
lowp float u_xlat10_20;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat22;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0);
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).w;
    u_xlat1.y = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).w;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat1.z = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).w;
    u_xlat1.w = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).w;
    u_xlat2.x = max(u_xlat0.w, u_xlat1.x);
    u_xlat8.x = min(u_xlat0.w, u_xlat1.x);
    u_xlat2.x = max(u_xlat1.y, u_xlat2.x);
    u_xlat8.x = min(u_xlat1.y, u_xlat8.x);
    u_xlat14.x = max(u_xlat1.w, u_xlat1.z);
    u_xlat20 = min(u_xlat1.w, u_xlat1.z);
    u_xlat2.x = max(u_xlat2.x, u_xlat14.x);
    u_xlat8.x = min(u_xlat8.x, u_xlat20);
    u_xlat14.x = u_xlat2.x * 0.165999994;
    u_xlat2.x = (-u_xlat8.x) + u_xlat2.x;
    u_xlat8.x = max(u_xlat14.x, 0.0625);
    u_xlatb8 = u_xlat2.x>=u_xlat8.x;
    if(u_xlatb8){
        u_xlat8.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_8 = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).w;
        u_xlat14.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat14.xy, 0.0).w;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_20 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).w;
        u_xlat10_3 = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).w;
        u_xlat9.xy = u_xlat1.xy + u_xlat1.zw;
        u_xlat2.x = float(1.0) / u_xlat2.x;
        u_xlat21 = u_xlat9.y + u_xlat9.x;
        u_xlat9.x = u_xlat0.w * -2.0 + u_xlat9.x;
        u_xlat15.x = u_xlat0.w * -2.0 + u_xlat9.y;
        u_xlat16_4 = u_xlat10_14 + u_xlat10_20;
        u_xlat16_20 = u_xlat10_20 + u_xlat10_8;
        u_xlat10.x = u_xlat1.y * -2.0 + u_xlat16_4;
        u_xlat20 = u_xlat1.z * -2.0 + u_xlat16_20;
        u_xlat16_8 = u_xlat10_8 + u_xlat10_3;
        u_xlat16_14 = u_xlat10_14 + u_xlat10_3;
        u_xlat3.x = abs(u_xlat9.x) * 2.0 + abs(u_xlat10.x);
        u_xlat20 = abs(u_xlat15.x) * 2.0 + abs(u_xlat20);
        u_xlat9.x = u_xlat1.w * -2.0 + u_xlat16_8;
        u_xlat14.x = u_xlat1.x * -2.0 + u_xlat16_14;
        u_xlat3.x = u_xlat3.x + abs(u_xlat9.x);
        u_xlat14.x = u_xlat20 + abs(u_xlat14.x);
        u_xlat16_8 = u_xlat16_4 + u_xlat16_8;
        u_xlatb14 = u_xlat3.x>=u_xlat14.x;
        u_xlat8.x = u_xlat21 * 2.0 + u_xlat16_8;
        u_xlat1.xz = (bool(u_xlatb14)) ? u_xlat1.xz : u_xlat1.yw;
        u_xlat7 = (u_xlatb14) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat19 = u_xlat8.x * 0.0833333358 + (-u_xlat0.w);
        u_xlat8.xz = (-u_xlat0.ww) + u_xlat1.zx;
        u_xlat1.xz = u_xlat0.ww + u_xlat1.xz;
        u_xlatb3 = abs(u_xlat8.x)>=abs(u_xlat8.z);
        u_xlat8.x = max(abs(u_xlat8.z), abs(u_xlat8.x));
        u_xlat7 = (u_xlatb3) ? (-u_xlat7) : u_xlat7;
        u_xlat19 = u_xlat2.x * abs(u_xlat19);
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
        u_xlat2.x = u_xlatb14 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat2.w = (u_xlatb14) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat9.xy = vec2(u_xlat7) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat9.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat9.x;
        u_xlat9.y = (u_xlatb14) ? u_xlat9.y : vs_TEXCOORD0.y;
        u_xlat4.xy = (-u_xlat2.xw) + u_xlat9.xy;
        u_xlat5.xy = u_xlat2.xw + u_xlat9.xy;
        u_xlat9.x = u_xlat19 * -2.0 + 3.0;
        u_xlat15.xy = u_xlat4.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).w;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat16.xy = u_xlat5.xy;
        u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
        u_xlat16.xy = u_xlat16.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_21 = texture2DLodEXT(_MainTex, u_xlat16.xy, 0.0).w;
        u_xlat1.x = (u_xlatb3) ? u_xlat1.z : u_xlat1.x;
        u_xlat13 = u_xlat8.x * 0.25;
        u_xlat8.x = (-u_xlat1.x) * 0.5 + u_xlat0.w;
        u_xlat19 = u_xlat19 * u_xlat9.x;
        u_xlati8 = int((u_xlat8.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat1.x) * 0.5 + u_xlat10_15;
        u_xlat3.y = (-u_xlat1.x) * 0.5 + u_xlat10_21;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
        u_xlat16.x = (-u_xlat2.x) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat16.x;
        u_xlat22 = (-u_xlat2.w) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat22;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat22 = u_xlat2.x * 1.5 + u_xlat5.x;
        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
        u_xlat22 = u_xlat2.w * 1.5 + u_xlat5.y;
        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat22;
        if(u_xlati10.x != 0) {
            if(u_xlati15.x == 0) {
                u_xlat10.xz = u_xlat4.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            if(u_xlati15.y == 0) {
                u_xlat10.xz = u_xlat5.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
            u_xlati10.xz = op_not(u_xlati15.xy);
            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
            if(u_xlati10.x != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat10.xz = u_xlat4.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                if(u_xlati15.y == 0) {
                    u_xlat10.xz = u_xlat5.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                u_xlat10.x = (-u_xlat2.x) * 4.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                u_xlat10.x = (-u_xlat2.w) * 4.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                u_xlati10.xz = op_not(u_xlati15.xy);
                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                u_xlat22 = u_xlat2.x * 4.0 + u_xlat5.x;
                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                u_xlat22 = u_xlat2.w * 4.0 + u_xlat5.z;
                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                if(u_xlati10.x != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat10.xz = u_xlat4.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat10.xz = u_xlat5.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                    u_xlat1.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat1.x;
                    u_xlatb1.xz = greaterThanEqual(abs(u_xlat3.xxyx), vec4(u_xlat13)).xz;
                    u_xlat15.x = (-u_xlat2.x) * 12.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlatb1.x) ? u_xlat4.x : u_xlat15.x;
                    u_xlat15.x = (-u_xlat2.w) * 12.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlatb1.x) ? u_xlat4.z : u_xlat15.x;
                    u_xlat1.x = u_xlat2.x * 12.0 + u_xlat5.x;
                    u_xlat5.x = (u_xlatb1.z) ? u_xlat5.x : u_xlat1.x;
                    u_xlat1.x = u_xlat2.w * 12.0 + u_xlat5.z;
                    u_xlat5.z = (u_xlatb1.z) ? u_xlat5.z : u_xlat1.x;
                }
            }
        }
        u_xlat1.x = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat13 = u_xlat5.x + (-vs_TEXCOORD0.x);
        u_xlat2.x = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat1.x = (u_xlatb14) ? u_xlat1.x : u_xlat2.x;
        u_xlat2.x = u_xlat5.z + (-vs_TEXCOORD0.y);
        u_xlat13 = (u_xlatb14) ? u_xlat13 : u_xlat2.x;
        u_xlati2.xw = ivec2(ivec2(lessThan(u_xlat3.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw) * -1);
        u_xlat3.x = u_xlat1.x + u_xlat13;
        u_xlatb2.xy = notEqual(ivec4(u_xlati8), u_xlati2.xwxx).xy;
        u_xlat20 = float(1.0) / u_xlat3.x;
        u_xlatb3 = u_xlat1.x<u_xlat13;
        u_xlat1.x = min(u_xlat13, u_xlat1.x);
        u_xlatb13 = (u_xlatb3) ? u_xlatb2.x : u_xlatb2.y;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat1.x = u_xlat1.x * (-u_xlat20) + 0.5;
        u_xlat1.x = u_xlatb13 ? u_xlat1.x : float(0.0);
        u_xlat1.x = max(u_xlat19, u_xlat1.x);
        u_xlat1.xy = u_xlat1.xx * vec2(u_xlat7) + vs_TEXCOORD0.xy;
        u_xlat2.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
        u_xlat2.y = (u_xlatb14) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA_LOW" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
ivec4 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
int u_xlati8;
bool u_xlatb8;
vec2 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
mediump float u_xlat16_14;
lowp float u_xlat10_14;
bool u_xlatb14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
vec2 u_xlat16;
float u_xlat19;
float u_xlat20;
mediump float u_xlat16_20;
lowp float u_xlat10_20;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat22;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0);
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).w;
    u_xlat1.y = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).w;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat1.z = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).w;
    u_xlat1.w = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).w;
    u_xlat2.x = max(u_xlat0.w, u_xlat1.x);
    u_xlat8.x = min(u_xlat0.w, u_xlat1.x);
    u_xlat2.x = max(u_xlat1.y, u_xlat2.x);
    u_xlat8.x = min(u_xlat1.y, u_xlat8.x);
    u_xlat14.x = max(u_xlat1.w, u_xlat1.z);
    u_xlat20 = min(u_xlat1.w, u_xlat1.z);
    u_xlat2.x = max(u_xlat2.x, u_xlat14.x);
    u_xlat8.x = min(u_xlat8.x, u_xlat20);
    u_xlat14.x = u_xlat2.x * 0.165999994;
    u_xlat2.x = (-u_xlat8.x) + u_xlat2.x;
    u_xlat8.x = max(u_xlat14.x, 0.0625);
    u_xlatb8 = u_xlat2.x>=u_xlat8.x;
    if(u_xlatb8){
        u_xlat8.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_8 = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).w;
        u_xlat14.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat14.xy, 0.0).w;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_20 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).w;
        u_xlat10_3 = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).w;
        u_xlat9.xy = u_xlat1.xy + u_xlat1.zw;
        u_xlat2.x = float(1.0) / u_xlat2.x;
        u_xlat21 = u_xlat9.y + u_xlat9.x;
        u_xlat9.x = u_xlat0.w * -2.0 + u_xlat9.x;
        u_xlat15.x = u_xlat0.w * -2.0 + u_xlat9.y;
        u_xlat16_4 = u_xlat10_14 + u_xlat10_20;
        u_xlat16_20 = u_xlat10_20 + u_xlat10_8;
        u_xlat10.x = u_xlat1.y * -2.0 + u_xlat16_4;
        u_xlat20 = u_xlat1.z * -2.0 + u_xlat16_20;
        u_xlat16_8 = u_xlat10_8 + u_xlat10_3;
        u_xlat16_14 = u_xlat10_14 + u_xlat10_3;
        u_xlat3.x = abs(u_xlat9.x) * 2.0 + abs(u_xlat10.x);
        u_xlat20 = abs(u_xlat15.x) * 2.0 + abs(u_xlat20);
        u_xlat9.x = u_xlat1.w * -2.0 + u_xlat16_8;
        u_xlat14.x = u_xlat1.x * -2.0 + u_xlat16_14;
        u_xlat3.x = u_xlat3.x + abs(u_xlat9.x);
        u_xlat14.x = u_xlat20 + abs(u_xlat14.x);
        u_xlat16_8 = u_xlat16_4 + u_xlat16_8;
        u_xlatb14 = u_xlat3.x>=u_xlat14.x;
        u_xlat8.x = u_xlat21 * 2.0 + u_xlat16_8;
        u_xlat1.xz = (bool(u_xlatb14)) ? u_xlat1.xz : u_xlat1.yw;
        u_xlat7 = (u_xlatb14) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat19 = u_xlat8.x * 0.0833333358 + (-u_xlat0.w);
        u_xlat8.xz = (-u_xlat0.ww) + u_xlat1.zx;
        u_xlat1.xz = u_xlat0.ww + u_xlat1.xz;
        u_xlatb3 = abs(u_xlat8.x)>=abs(u_xlat8.z);
        u_xlat8.x = max(abs(u_xlat8.z), abs(u_xlat8.x));
        u_xlat7 = (u_xlatb3) ? (-u_xlat7) : u_xlat7;
        u_xlat19 = u_xlat2.x * abs(u_xlat19);
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
        u_xlat2.x = u_xlatb14 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat2.w = (u_xlatb14) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat9.xy = vec2(u_xlat7) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat9.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat9.x;
        u_xlat9.y = (u_xlatb14) ? u_xlat9.y : vs_TEXCOORD0.y;
        u_xlat4.xy = (-u_xlat2.xw) + u_xlat9.xy;
        u_xlat5.xy = u_xlat2.xw + u_xlat9.xy;
        u_xlat9.x = u_xlat19 * -2.0 + 3.0;
        u_xlat15.xy = u_xlat4.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).w;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat16.xy = u_xlat5.xy;
        u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
        u_xlat16.xy = u_xlat16.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_21 = texture2DLodEXT(_MainTex, u_xlat16.xy, 0.0).w;
        u_xlat1.x = (u_xlatb3) ? u_xlat1.z : u_xlat1.x;
        u_xlat13 = u_xlat8.x * 0.25;
        u_xlat8.x = (-u_xlat1.x) * 0.5 + u_xlat0.w;
        u_xlat19 = u_xlat19 * u_xlat9.x;
        u_xlati8 = int((u_xlat8.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat1.x) * 0.5 + u_xlat10_15;
        u_xlat3.y = (-u_xlat1.x) * 0.5 + u_xlat10_21;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
        u_xlat16.x = (-u_xlat2.x) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat16.x;
        u_xlat22 = (-u_xlat2.w) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat22;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat22 = u_xlat2.x * 1.5 + u_xlat5.x;
        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
        u_xlat22 = u_xlat2.w * 1.5 + u_xlat5.y;
        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat22;
        if(u_xlati10.x != 0) {
            if(u_xlati15.x == 0) {
                u_xlat10.xz = u_xlat4.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            if(u_xlati15.y == 0) {
                u_xlat10.xz = u_xlat5.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
            u_xlati10.xz = op_not(u_xlati15.xy);
            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
            if(u_xlati10.x != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat10.xz = u_xlat4.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                if(u_xlati15.y == 0) {
                    u_xlat10.xz = u_xlat5.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                u_xlat10.x = (-u_xlat2.x) * 4.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                u_xlat10.x = (-u_xlat2.w) * 4.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                u_xlati10.xz = op_not(u_xlati15.xy);
                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                u_xlat22 = u_xlat2.x * 4.0 + u_xlat5.x;
                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                u_xlat22 = u_xlat2.w * 4.0 + u_xlat5.z;
                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                if(u_xlati10.x != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat10.xz = u_xlat4.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat10.xz = u_xlat5.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                    u_xlat1.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat1.x;
                    u_xlatb1.xz = greaterThanEqual(abs(u_xlat3.xxyx), vec4(u_xlat13)).xz;
                    u_xlat15.x = (-u_xlat2.x) * 12.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlatb1.x) ? u_xlat4.x : u_xlat15.x;
                    u_xlat15.x = (-u_xlat2.w) * 12.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlatb1.x) ? u_xlat4.z : u_xlat15.x;
                    u_xlat1.x = u_xlat2.x * 12.0 + u_xlat5.x;
                    u_xlat5.x = (u_xlatb1.z) ? u_xlat5.x : u_xlat1.x;
                    u_xlat1.x = u_xlat2.w * 12.0 + u_xlat5.z;
                    u_xlat5.z = (u_xlatb1.z) ? u_xlat5.z : u_xlat1.x;
                }
            }
        }
        u_xlat1.x = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat13 = u_xlat5.x + (-vs_TEXCOORD0.x);
        u_xlat2.x = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat1.x = (u_xlatb14) ? u_xlat1.x : u_xlat2.x;
        u_xlat2.x = u_xlat5.z + (-vs_TEXCOORD0.y);
        u_xlat13 = (u_xlatb14) ? u_xlat13 : u_xlat2.x;
        u_xlati2.xw = ivec2(ivec2(lessThan(u_xlat3.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw) * -1);
        u_xlat3.x = u_xlat1.x + u_xlat13;
        u_xlatb2.xy = notEqual(ivec4(u_xlati8), u_xlati2.xwxx).xy;
        u_xlat20 = float(1.0) / u_xlat3.x;
        u_xlatb3 = u_xlat1.x<u_xlat13;
        u_xlat1.x = min(u_xlat13, u_xlat1.x);
        u_xlatb13 = (u_xlatb3) ? u_xlatb2.x : u_xlatb2.y;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat1.x = u_xlat1.x * (-u_xlat20) + 0.5;
        u_xlat1.x = u_xlatb13 ? u_xlat1.x : float(0.0);
        u_xlat1.x = max(u_xlat19, u_xlat1.x);
        u_xlat1.xy = u_xlat1.xx * vec2(u_xlat7) + vs_TEXCOORD0.xy;
        u_xlat2.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
        u_xlat2.y = (u_xlatb14) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA_LOW" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
ivec4 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
int u_xlati8;
bool u_xlatb8;
vec2 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
mediump float u_xlat16_14;
lowp float u_xlat10_14;
bool u_xlatb14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
vec2 u_xlat16;
float u_xlat19;
float u_xlat20;
mediump float u_xlat16_20;
lowp float u_xlat10_20;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat22;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0);
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).w;
    u_xlat1.y = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).w;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat1.z = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).w;
    u_xlat1.w = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).w;
    u_xlat2.x = max(u_xlat0.w, u_xlat1.x);
    u_xlat8.x = min(u_xlat0.w, u_xlat1.x);
    u_xlat2.x = max(u_xlat1.y, u_xlat2.x);
    u_xlat8.x = min(u_xlat1.y, u_xlat8.x);
    u_xlat14.x = max(u_xlat1.w, u_xlat1.z);
    u_xlat20 = min(u_xlat1.w, u_xlat1.z);
    u_xlat2.x = max(u_xlat2.x, u_xlat14.x);
    u_xlat8.x = min(u_xlat8.x, u_xlat20);
    u_xlat14.x = u_xlat2.x * 0.165999994;
    u_xlat2.x = (-u_xlat8.x) + u_xlat2.x;
    u_xlat8.x = max(u_xlat14.x, 0.0625);
    u_xlatb8 = u_xlat2.x>=u_xlat8.x;
    if(u_xlatb8){
        u_xlat8.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_8 = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).w;
        u_xlat14.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat14.xy, 0.0).w;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_20 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).w;
        u_xlat10_3 = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).w;
        u_xlat9.xy = u_xlat1.xy + u_xlat1.zw;
        u_xlat2.x = float(1.0) / u_xlat2.x;
        u_xlat21 = u_xlat9.y + u_xlat9.x;
        u_xlat9.x = u_xlat0.w * -2.0 + u_xlat9.x;
        u_xlat15.x = u_xlat0.w * -2.0 + u_xlat9.y;
        u_xlat16_4 = u_xlat10_14 + u_xlat10_20;
        u_xlat16_20 = u_xlat10_20 + u_xlat10_8;
        u_xlat10.x = u_xlat1.y * -2.0 + u_xlat16_4;
        u_xlat20 = u_xlat1.z * -2.0 + u_xlat16_20;
        u_xlat16_8 = u_xlat10_8 + u_xlat10_3;
        u_xlat16_14 = u_xlat10_14 + u_xlat10_3;
        u_xlat3.x = abs(u_xlat9.x) * 2.0 + abs(u_xlat10.x);
        u_xlat20 = abs(u_xlat15.x) * 2.0 + abs(u_xlat20);
        u_xlat9.x = u_xlat1.w * -2.0 + u_xlat16_8;
        u_xlat14.x = u_xlat1.x * -2.0 + u_xlat16_14;
        u_xlat3.x = u_xlat3.x + abs(u_xlat9.x);
        u_xlat14.x = u_xlat20 + abs(u_xlat14.x);
        u_xlat16_8 = u_xlat16_4 + u_xlat16_8;
        u_xlatb14 = u_xlat3.x>=u_xlat14.x;
        u_xlat8.x = u_xlat21 * 2.0 + u_xlat16_8;
        u_xlat1.xz = (bool(u_xlatb14)) ? u_xlat1.xz : u_xlat1.yw;
        u_xlat7 = (u_xlatb14) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat19 = u_xlat8.x * 0.0833333358 + (-u_xlat0.w);
        u_xlat8.xz = (-u_xlat0.ww) + u_xlat1.zx;
        u_xlat1.xz = u_xlat0.ww + u_xlat1.xz;
        u_xlatb3 = abs(u_xlat8.x)>=abs(u_xlat8.z);
        u_xlat8.x = max(abs(u_xlat8.z), abs(u_xlat8.x));
        u_xlat7 = (u_xlatb3) ? (-u_xlat7) : u_xlat7;
        u_xlat19 = u_xlat2.x * abs(u_xlat19);
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
        u_xlat2.x = u_xlatb14 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat2.w = (u_xlatb14) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat9.xy = vec2(u_xlat7) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat9.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat9.x;
        u_xlat9.y = (u_xlatb14) ? u_xlat9.y : vs_TEXCOORD0.y;
        u_xlat4.xy = (-u_xlat2.xw) + u_xlat9.xy;
        u_xlat5.xy = u_xlat2.xw + u_xlat9.xy;
        u_xlat9.x = u_xlat19 * -2.0 + 3.0;
        u_xlat15.xy = u_xlat4.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).w;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat16.xy = u_xlat5.xy;
        u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
        u_xlat16.xy = u_xlat16.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_21 = texture2DLodEXT(_MainTex, u_xlat16.xy, 0.0).w;
        u_xlat1.x = (u_xlatb3) ? u_xlat1.z : u_xlat1.x;
        u_xlat13 = u_xlat8.x * 0.25;
        u_xlat8.x = (-u_xlat1.x) * 0.5 + u_xlat0.w;
        u_xlat19 = u_xlat19 * u_xlat9.x;
        u_xlati8 = int((u_xlat8.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat1.x) * 0.5 + u_xlat10_15;
        u_xlat3.y = (-u_xlat1.x) * 0.5 + u_xlat10_21;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
        u_xlat16.x = (-u_xlat2.x) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat16.x;
        u_xlat22 = (-u_xlat2.w) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat22;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat22 = u_xlat2.x * 1.5 + u_xlat5.x;
        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
        u_xlat22 = u_xlat2.w * 1.5 + u_xlat5.y;
        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat22;
        if(u_xlati10.x != 0) {
            if(u_xlati15.x == 0) {
                u_xlat10.xz = u_xlat4.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            if(u_xlati15.y == 0) {
                u_xlat10.xz = u_xlat5.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
            u_xlati10.xz = op_not(u_xlati15.xy);
            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
            if(u_xlati10.x != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat10.xz = u_xlat4.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                if(u_xlati15.y == 0) {
                    u_xlat10.xz = u_xlat5.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                u_xlat10.x = (-u_xlat2.x) * 4.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                u_xlat10.x = (-u_xlat2.w) * 4.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                u_xlati10.xz = op_not(u_xlati15.xy);
                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                u_xlat22 = u_xlat2.x * 4.0 + u_xlat5.x;
                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                u_xlat22 = u_xlat2.w * 4.0 + u_xlat5.z;
                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                if(u_xlati10.x != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat10.xz = u_xlat4.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat10.xz = u_xlat5.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                    u_xlat1.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat1.x;
                    u_xlatb1.xz = greaterThanEqual(abs(u_xlat3.xxyx), vec4(u_xlat13)).xz;
                    u_xlat15.x = (-u_xlat2.x) * 12.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlatb1.x) ? u_xlat4.x : u_xlat15.x;
                    u_xlat15.x = (-u_xlat2.w) * 12.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlatb1.x) ? u_xlat4.z : u_xlat15.x;
                    u_xlat1.x = u_xlat2.x * 12.0 + u_xlat5.x;
                    u_xlat5.x = (u_xlatb1.z) ? u_xlat5.x : u_xlat1.x;
                    u_xlat1.x = u_xlat2.w * 12.0 + u_xlat5.z;
                    u_xlat5.z = (u_xlatb1.z) ? u_xlat5.z : u_xlat1.x;
                }
            }
        }
        u_xlat1.x = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat13 = u_xlat5.x + (-vs_TEXCOORD0.x);
        u_xlat2.x = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat1.x = (u_xlatb14) ? u_xlat1.x : u_xlat2.x;
        u_xlat2.x = u_xlat5.z + (-vs_TEXCOORD0.y);
        u_xlat13 = (u_xlatb14) ? u_xlat13 : u_xlat2.x;
        u_xlati2.xw = ivec2(ivec2(lessThan(u_xlat3.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw) * -1);
        u_xlat3.x = u_xlat1.x + u_xlat13;
        u_xlatb2.xy = notEqual(ivec4(u_xlati8), u_xlati2.xwxx).xy;
        u_xlat20 = float(1.0) / u_xlat3.x;
        u_xlatb3 = u_xlat1.x<u_xlat13;
        u_xlat1.x = min(u_xlat13, u_xlat1.x);
        u_xlatb13 = (u_xlatb3) ? u_xlatb2.x : u_xlatb2.y;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat1.x = u_xlat1.x * (-u_xlat20) + 0.5;
        u_xlat1.x = u_xlatb13 ? u_xlat1.x : float(0.0);
        u_xlat1.x = max(u_xlat19, u_xlat1.x);
        u_xlat1.xy = u_xlat1.xx * vec2(u_xlat7) + vs_TEXCOORD0.xy;
        u_xlat2.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
        u_xlat2.y = (u_xlatb14) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA_LOW" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
ivec4 u_xlati2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
int u_xlati8;
bool u_xlatb8;
vec2 u_xlat9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
mediump float u_xlat16_14;
lowp float u_xlat10_14;
bool u_xlatb14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
vec2 u_xlat16;
float u_xlat19;
float u_xlat20;
mediump float u_xlat16_20;
lowp float u_xlat10_20;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat22;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0 = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0);
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).w;
    u_xlat1.y = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).w;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat1.z = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).w;
    u_xlat1.w = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).w;
    u_xlat2.x = max(u_xlat0.w, u_xlat1.x);
    u_xlat8.x = min(u_xlat0.w, u_xlat1.x);
    u_xlat2.x = max(u_xlat1.y, u_xlat2.x);
    u_xlat8.x = min(u_xlat1.y, u_xlat8.x);
    u_xlat14.x = max(u_xlat1.w, u_xlat1.z);
    u_xlat20 = min(u_xlat1.w, u_xlat1.z);
    u_xlat2.x = max(u_xlat2.x, u_xlat14.x);
    u_xlat8.x = min(u_xlat8.x, u_xlat20);
    u_xlat14.x = u_xlat2.x * 0.165999994;
    u_xlat2.x = (-u_xlat8.x) + u_xlat2.x;
    u_xlat8.x = max(u_xlat14.x, 0.0625);
    u_xlatb8 = u_xlat2.x>=u_xlat8.x;
    if(u_xlatb8){
        u_xlat8.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_8 = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).w;
        u_xlat14.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat14.xy = clamp(u_xlat14.xy, 0.0, 1.0);
        u_xlat14.xy = u_xlat14.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat14.xy, 0.0).w;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_20 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).w;
        u_xlat10_3 = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).w;
        u_xlat9.xy = u_xlat1.xy + u_xlat1.zw;
        u_xlat2.x = float(1.0) / u_xlat2.x;
        u_xlat21 = u_xlat9.y + u_xlat9.x;
        u_xlat9.x = u_xlat0.w * -2.0 + u_xlat9.x;
        u_xlat15.x = u_xlat0.w * -2.0 + u_xlat9.y;
        u_xlat16_4 = u_xlat10_14 + u_xlat10_20;
        u_xlat16_20 = u_xlat10_20 + u_xlat10_8;
        u_xlat10.x = u_xlat1.y * -2.0 + u_xlat16_4;
        u_xlat20 = u_xlat1.z * -2.0 + u_xlat16_20;
        u_xlat16_8 = u_xlat10_8 + u_xlat10_3;
        u_xlat16_14 = u_xlat10_14 + u_xlat10_3;
        u_xlat3.x = abs(u_xlat9.x) * 2.0 + abs(u_xlat10.x);
        u_xlat20 = abs(u_xlat15.x) * 2.0 + abs(u_xlat20);
        u_xlat9.x = u_xlat1.w * -2.0 + u_xlat16_8;
        u_xlat14.x = u_xlat1.x * -2.0 + u_xlat16_14;
        u_xlat3.x = u_xlat3.x + abs(u_xlat9.x);
        u_xlat14.x = u_xlat20 + abs(u_xlat14.x);
        u_xlat16_8 = u_xlat16_4 + u_xlat16_8;
        u_xlatb14 = u_xlat3.x>=u_xlat14.x;
        u_xlat8.x = u_xlat21 * 2.0 + u_xlat16_8;
        u_xlat1.xz = (bool(u_xlatb14)) ? u_xlat1.xz : u_xlat1.yw;
        u_xlat7 = (u_xlatb14) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat19 = u_xlat8.x * 0.0833333358 + (-u_xlat0.w);
        u_xlat8.xz = (-u_xlat0.ww) + u_xlat1.zx;
        u_xlat1.xz = u_xlat0.ww + u_xlat1.xz;
        u_xlatb3 = abs(u_xlat8.x)>=abs(u_xlat8.z);
        u_xlat8.x = max(abs(u_xlat8.z), abs(u_xlat8.x));
        u_xlat7 = (u_xlatb3) ? (-u_xlat7) : u_xlat7;
        u_xlat19 = u_xlat2.x * abs(u_xlat19);
        u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
        u_xlat2.x = u_xlatb14 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat2.w = (u_xlatb14) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat9.xy = vec2(u_xlat7) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat9.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat9.x;
        u_xlat9.y = (u_xlatb14) ? u_xlat9.y : vs_TEXCOORD0.y;
        u_xlat4.xy = (-u_xlat2.xw) + u_xlat9.xy;
        u_xlat5.xy = u_xlat2.xw + u_xlat9.xy;
        u_xlat9.x = u_xlat19 * -2.0 + 3.0;
        u_xlat15.xy = u_xlat4.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).w;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat16.xy = u_xlat5.xy;
        u_xlat16.xy = clamp(u_xlat16.xy, 0.0, 1.0);
        u_xlat16.xy = u_xlat16.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_21 = texture2DLodEXT(_MainTex, u_xlat16.xy, 0.0).w;
        u_xlat1.x = (u_xlatb3) ? u_xlat1.z : u_xlat1.x;
        u_xlat13 = u_xlat8.x * 0.25;
        u_xlat8.x = (-u_xlat1.x) * 0.5 + u_xlat0.w;
        u_xlat19 = u_xlat19 * u_xlat9.x;
        u_xlati8 = int((u_xlat8.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat1.x) * 0.5 + u_xlat10_15;
        u_xlat3.y = (-u_xlat1.x) * 0.5 + u_xlat10_21;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
        u_xlat16.x = (-u_xlat2.x) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat16.x;
        u_xlat22 = (-u_xlat2.w) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat22;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat22 = u_xlat2.x * 1.5 + u_xlat5.x;
        u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
        u_xlat22 = u_xlat2.w * 1.5 + u_xlat5.y;
        u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat22;
        if(u_xlati10.x != 0) {
            if(u_xlati15.x == 0) {
                u_xlat10.xz = u_xlat4.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            if(u_xlati15.y == 0) {
                u_xlat10.xz = u_xlat5.xz;
                u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
            }
            u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
            u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
            u_xlat10.x = (-u_xlat2.x) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
            u_xlat10.x = (-u_xlat2.w) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
            u_xlati10.xz = op_not(u_xlati15.xy);
            u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
            u_xlat22 = u_xlat2.x * 2.0 + u_xlat5.x;
            u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
            u_xlat22 = u_xlat2.w * 2.0 + u_xlat5.z;
            u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
            if(u_xlati10.x != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat10.xz = u_xlat4.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                if(u_xlati15.y == 0) {
                    u_xlat10.xz = u_xlat5.xz;
                    u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                    u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                }
                u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                u_xlat15.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat15.x;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), vec4(u_xlat13)).xy) * -1);
                u_xlat10.x = (-u_xlat2.x) * 4.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat10.x;
                u_xlat10.x = (-u_xlat2.w) * 4.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat10.x;
                u_xlati10.xz = op_not(u_xlati15.xy);
                u_xlati10.x = op_or(u_xlati10.z, u_xlati10.x);
                u_xlat22 = u_xlat2.x * 4.0 + u_xlat5.x;
                u_xlat5.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat22;
                u_xlat22 = u_xlat2.w * 4.0 + u_xlat5.z;
                u_xlat5.z = (u_xlati15.y != 0) ? u_xlat5.z : u_xlat22;
                if(u_xlati10.x != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat10.xz = u_xlat4.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat10.xz = u_xlat5.xz;
                        u_xlat10.xz = clamp(u_xlat10.xz, 0.0, 1.0);
                        u_xlat10.xz = u_xlat10.xz * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat10.xz, 0.0).w;
                    }
                    u_xlat10.x = (-u_xlat1.x) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat10.x;
                    u_xlat1.x = (-u_xlat1.x) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat1.x;
                    u_xlatb1.xz = greaterThanEqual(abs(u_xlat3.xxyx), vec4(u_xlat13)).xz;
                    u_xlat15.x = (-u_xlat2.x) * 12.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlatb1.x) ? u_xlat4.x : u_xlat15.x;
                    u_xlat15.x = (-u_xlat2.w) * 12.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlatb1.x) ? u_xlat4.z : u_xlat15.x;
                    u_xlat1.x = u_xlat2.x * 12.0 + u_xlat5.x;
                    u_xlat5.x = (u_xlatb1.z) ? u_xlat5.x : u_xlat1.x;
                    u_xlat1.x = u_xlat2.w * 12.0 + u_xlat5.z;
                    u_xlat5.z = (u_xlatb1.z) ? u_xlat5.z : u_xlat1.x;
                }
            }
        }
        u_xlat1.x = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat13 = u_xlat5.x + (-vs_TEXCOORD0.x);
        u_xlat2.x = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat1.x = (u_xlatb14) ? u_xlat1.x : u_xlat2.x;
        u_xlat2.x = u_xlat5.z + (-vs_TEXCOORD0.y);
        u_xlat13 = (u_xlatb14) ? u_xlat13 : u_xlat2.x;
        u_xlati2.xw = ivec2(ivec2(lessThan(u_xlat3.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).xw) * -1);
        u_xlat3.x = u_xlat1.x + u_xlat13;
        u_xlatb2.xy = notEqual(ivec4(u_xlati8), u_xlati2.xwxx).xy;
        u_xlat20 = float(1.0) / u_xlat3.x;
        u_xlatb3 = u_xlat1.x<u_xlat13;
        u_xlat1.x = min(u_xlat13, u_xlat1.x);
        u_xlatb13 = (u_xlatb3) ? u_xlatb2.x : u_xlatb2.y;
        u_xlat19 = u_xlat19 * u_xlat19;
        u_xlat1.x = u_xlat1.x * (-u_xlat20) + 0.5;
        u_xlat1.x = u_xlatb13 ? u_xlat1.x : float(0.0);
        u_xlat1.x = max(u_xlat19, u_xlat1.x);
        u_xlat1.xy = u_xlat1.xx * vec2(u_xlat7) + vs_TEXCOORD0.xy;
        u_xlat2.x = (u_xlatb14) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
        u_xlat2.y = (u_xlatb14) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA_KEEP_ALPHA" "FXAA_LOW" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
vec4 u_xlat2;
int u_xlati2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
lowp float u_xlat10_9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
float u_xlat14;
lowp float u_xlat10_14;
ivec2 u_xlati14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
float u_xlat20;
int u_xlati20;
bool u_xlatb20;
float u_xlat21;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat18 = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).y;
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).y;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat7.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
    u_xlat13 = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).y;
    u_xlat19 = max(u_xlat0.y, u_xlat18);
    u_xlat2.x = min(u_xlat0.y, u_xlat18);
    u_xlat19 = max(u_xlat19, u_xlat1.x);
    u_xlat2.x = min(u_xlat1.x, u_xlat2.x);
    u_xlat8.x = max(u_xlat13, u_xlat7.x);
    u_xlat14 = min(u_xlat13, u_xlat7.x);
    u_xlat19 = max(u_xlat19, u_xlat8.x);
    u_xlat2.x = min(u_xlat2.x, u_xlat14);
    u_xlat8.x = u_xlat19 * 0.165999994;
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat2.x = max(u_xlat8.x, 0.0625);
    u_xlatb2.x = u_xlat19>=u_xlat2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
        u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
        u_xlat8.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.y = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).y;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).y;
        u_xlat2.w = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).y;
        u_xlat3.x = u_xlat18 + u_xlat7.x;
        u_xlat9.x = u_xlat1.x + u_xlat13;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlat15.x = u_xlat9.x + u_xlat3.x;
        u_xlat3.x = u_xlat0.y * -2.0 + u_xlat3.x;
        u_xlat9.x = u_xlat0.y * -2.0 + u_xlat9.x;
        u_xlat21 = u_xlat2.y + u_xlat10_14;
        u_xlat14 = u_xlat10_14 + u_xlat2.x;
        u_xlat4.x = u_xlat1.x * -2.0 + u_xlat21;
        u_xlat14 = u_xlat7.x * -2.0 + u_xlat14;
        u_xlat2.xy = u_xlat2.wy + u_xlat2.xw;
        u_xlat20 = abs(u_xlat3.x) * 2.0 + abs(u_xlat4.x);
        u_xlat14 = abs(u_xlat9.x) * 2.0 + abs(u_xlat14);
        u_xlat3.x = u_xlat13 * -2.0 + u_xlat2.x;
        u_xlat8.x = u_xlat18 * -2.0 + u_xlat2.y;
        u_xlat20 = u_xlat20 + abs(u_xlat3.x);
        u_xlat8.x = u_xlat14 + abs(u_xlat8.x);
        u_xlat2.x = u_xlat21 + u_xlat2.x;
        u_xlatb8 = u_xlat20>=u_xlat8.x;
        u_xlat2.x = u_xlat15.x * 2.0 + u_xlat2.x;
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat13;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat1.x;
        u_xlat1.x = (u_xlatb8) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat13 = u_xlat2.x * 0.0833333358 + (-u_xlat0.y);
        u_xlat2.x = (-u_xlat0.y) + u_xlat7.x;
        u_xlat14 = (-u_xlat0.y) + u_xlat18;
        u_xlat7.x = u_xlat0.y + u_xlat7.x;
        u_xlat18 = u_xlat0.y + u_xlat18;
        u_xlatb20 = abs(u_xlat2.x)>=abs(u_xlat14);
        u_xlat2.x = max(abs(u_xlat14), abs(u_xlat2.x));
        u_xlat1.x = (u_xlatb20) ? (-u_xlat1.x) : u_xlat1.x;
        u_xlat13 = u_xlat19 * abs(u_xlat13);
        u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
        u_xlat19 = u_xlatb8 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat14 = (u_xlatb8) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat3.xy = u_xlat1.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat3.x;
        u_xlat9.x = (u_xlatb8) ? u_xlat3.y : vs_TEXCOORD0.y;
        u_xlat4.x = (-u_xlat19) + u_xlat3.x;
        u_xlat4.y = (-u_xlat14) + u_xlat9.x;
        u_xlat5.x = u_xlat19 + u_xlat3.x;
        u_xlat5.y = u_xlat14 + u_xlat9.x;
        u_xlat3.x = u_xlat13 * -2.0 + 3.0;
        u_xlat9.xy = u_xlat4.xy;
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat9.xy = u_xlat9.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_9 = texture2DLodEXT(_MainTex, u_xlat9.xy, 0.0).y;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat15.xy = u_xlat5.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).y;
        u_xlat18 = (u_xlatb20) ? u_xlat7.x : u_xlat18;
        u_xlat7.x = u_xlat2.x * 0.25;
        u_xlat2.x = (-u_xlat18) * 0.5 + u_xlat0.y;
        u_xlat13 = u_xlat13 * u_xlat3.x;
        u_xlati2 = int((u_xlat2.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat18) * 0.5 + u_xlat10_9;
        u_xlat3.y = (-u_xlat18) * 0.5 + u_xlat10_15;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
        u_xlat20 = (-u_xlat19) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
        u_xlat20 = (-u_xlat14) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat20;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati20 = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat10.x = u_xlat19 * 1.5 + u_xlat5.x;
        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat10.x;
        u_xlat5.x = u_xlat14 * 1.5 + u_xlat5.y;
        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat5.x;
        if(u_xlati20 != 0) {
            if(u_xlati15.x == 0) {
                u_xlat5.xy = u_xlat4.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            if(u_xlati15.y == 0) {
                u_xlat5.xy = u_xlat10.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
            u_xlati5.xy = op_not(u_xlati15.xy);
            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
            if(u_xlati20 != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat5.xy = u_xlat4.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                if(u_xlati15.y == 0) {
                    u_xlat5.xy = u_xlat10.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                u_xlat20 = (-u_xlat19) * 4.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                u_xlat20 = (-u_xlat14) * 4.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                u_xlati5.xy = op_not(u_xlati15.xy);
                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                u_xlat5.x = u_xlat19 * 4.0 + u_xlat10.x;
                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                u_xlat5.x = u_xlat14 * 4.0 + u_xlat10.z;
                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                if(u_xlati20 != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat5.xy = u_xlat4.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat5.xy = u_xlat10.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                    u_xlat18 = (-u_xlat18) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat18;
                    u_xlatb15.xy = greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy;
                    u_xlat18 = (-u_xlat19) * 12.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlatb15.x) ? u_xlat4.x : u_xlat18;
                    u_xlat18 = (-u_xlat14) * 12.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlatb15.x) ? u_xlat4.z : u_xlat18;
                    u_xlat18 = u_xlat19 * 12.0 + u_xlat10.x;
                    u_xlat10.x = (u_xlatb15.y) ? u_xlat10.x : u_xlat18;
                    u_xlat18 = u_xlat14 * 12.0 + u_xlat10.z;
                    u_xlat10.z = (u_xlatb15.y) ? u_xlat10.z : u_xlat18;
                }
            }
        }
        u_xlat18 = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat19 = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat19;
        u_xlat7.xz = u_xlat10.xz + (-vs_TEXCOORD0.xy);
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat7.z;
        u_xlati14.xy = ivec2(ivec2(lessThan(u_xlat3.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy) * -1);
        u_xlat19 = u_xlat18 + u_xlat7.x;
        u_xlatb2.xz = notEqual(ivec4(u_xlati2), u_xlati14.xxyx).xz;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlatb20 = u_xlat18<u_xlat7.x;
        u_xlat18 = min(u_xlat18, u_xlat7.x);
        u_xlatb7 = (u_xlatb20) ? u_xlatb2.x : u_xlatb2.z;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat18 = u_xlat18 * (-u_xlat19) + 0.5;
        u_xlat18 = u_xlatb7 ? u_xlat18 : float(0.0);
        u_xlat18 = max(u_xlat13, u_xlat18);
        u_xlat1.xy = vec2(u_xlat18) * u_xlat1.xx + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat3.y = (u_xlatb8) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat3.y = clamp(u_xlat3.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat3.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat10_18 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_18;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA_KEEP_ALPHA" "FXAA_LOW" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
vec4 u_xlat2;
int u_xlati2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
lowp float u_xlat10_9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
float u_xlat14;
lowp float u_xlat10_14;
ivec2 u_xlati14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
float u_xlat20;
int u_xlati20;
bool u_xlatb20;
float u_xlat21;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat18 = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).y;
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).y;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat7.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
    u_xlat13 = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).y;
    u_xlat19 = max(u_xlat0.y, u_xlat18);
    u_xlat2.x = min(u_xlat0.y, u_xlat18);
    u_xlat19 = max(u_xlat19, u_xlat1.x);
    u_xlat2.x = min(u_xlat1.x, u_xlat2.x);
    u_xlat8.x = max(u_xlat13, u_xlat7.x);
    u_xlat14 = min(u_xlat13, u_xlat7.x);
    u_xlat19 = max(u_xlat19, u_xlat8.x);
    u_xlat2.x = min(u_xlat2.x, u_xlat14);
    u_xlat8.x = u_xlat19 * 0.165999994;
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat2.x = max(u_xlat8.x, 0.0625);
    u_xlatb2.x = u_xlat19>=u_xlat2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
        u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
        u_xlat8.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.y = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).y;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).y;
        u_xlat2.w = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).y;
        u_xlat3.x = u_xlat18 + u_xlat7.x;
        u_xlat9.x = u_xlat1.x + u_xlat13;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlat15.x = u_xlat9.x + u_xlat3.x;
        u_xlat3.x = u_xlat0.y * -2.0 + u_xlat3.x;
        u_xlat9.x = u_xlat0.y * -2.0 + u_xlat9.x;
        u_xlat21 = u_xlat2.y + u_xlat10_14;
        u_xlat14 = u_xlat10_14 + u_xlat2.x;
        u_xlat4.x = u_xlat1.x * -2.0 + u_xlat21;
        u_xlat14 = u_xlat7.x * -2.0 + u_xlat14;
        u_xlat2.xy = u_xlat2.wy + u_xlat2.xw;
        u_xlat20 = abs(u_xlat3.x) * 2.0 + abs(u_xlat4.x);
        u_xlat14 = abs(u_xlat9.x) * 2.0 + abs(u_xlat14);
        u_xlat3.x = u_xlat13 * -2.0 + u_xlat2.x;
        u_xlat8.x = u_xlat18 * -2.0 + u_xlat2.y;
        u_xlat20 = u_xlat20 + abs(u_xlat3.x);
        u_xlat8.x = u_xlat14 + abs(u_xlat8.x);
        u_xlat2.x = u_xlat21 + u_xlat2.x;
        u_xlatb8 = u_xlat20>=u_xlat8.x;
        u_xlat2.x = u_xlat15.x * 2.0 + u_xlat2.x;
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat13;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat1.x;
        u_xlat1.x = (u_xlatb8) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat13 = u_xlat2.x * 0.0833333358 + (-u_xlat0.y);
        u_xlat2.x = (-u_xlat0.y) + u_xlat7.x;
        u_xlat14 = (-u_xlat0.y) + u_xlat18;
        u_xlat7.x = u_xlat0.y + u_xlat7.x;
        u_xlat18 = u_xlat0.y + u_xlat18;
        u_xlatb20 = abs(u_xlat2.x)>=abs(u_xlat14);
        u_xlat2.x = max(abs(u_xlat14), abs(u_xlat2.x));
        u_xlat1.x = (u_xlatb20) ? (-u_xlat1.x) : u_xlat1.x;
        u_xlat13 = u_xlat19 * abs(u_xlat13);
        u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
        u_xlat19 = u_xlatb8 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat14 = (u_xlatb8) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat3.xy = u_xlat1.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat3.x;
        u_xlat9.x = (u_xlatb8) ? u_xlat3.y : vs_TEXCOORD0.y;
        u_xlat4.x = (-u_xlat19) + u_xlat3.x;
        u_xlat4.y = (-u_xlat14) + u_xlat9.x;
        u_xlat5.x = u_xlat19 + u_xlat3.x;
        u_xlat5.y = u_xlat14 + u_xlat9.x;
        u_xlat3.x = u_xlat13 * -2.0 + 3.0;
        u_xlat9.xy = u_xlat4.xy;
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat9.xy = u_xlat9.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_9 = texture2DLodEXT(_MainTex, u_xlat9.xy, 0.0).y;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat15.xy = u_xlat5.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).y;
        u_xlat18 = (u_xlatb20) ? u_xlat7.x : u_xlat18;
        u_xlat7.x = u_xlat2.x * 0.25;
        u_xlat2.x = (-u_xlat18) * 0.5 + u_xlat0.y;
        u_xlat13 = u_xlat13 * u_xlat3.x;
        u_xlati2 = int((u_xlat2.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat18) * 0.5 + u_xlat10_9;
        u_xlat3.y = (-u_xlat18) * 0.5 + u_xlat10_15;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
        u_xlat20 = (-u_xlat19) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
        u_xlat20 = (-u_xlat14) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat20;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati20 = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat10.x = u_xlat19 * 1.5 + u_xlat5.x;
        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat10.x;
        u_xlat5.x = u_xlat14 * 1.5 + u_xlat5.y;
        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat5.x;
        if(u_xlati20 != 0) {
            if(u_xlati15.x == 0) {
                u_xlat5.xy = u_xlat4.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            if(u_xlati15.y == 0) {
                u_xlat5.xy = u_xlat10.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
            u_xlati5.xy = op_not(u_xlati15.xy);
            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
            if(u_xlati20 != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat5.xy = u_xlat4.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                if(u_xlati15.y == 0) {
                    u_xlat5.xy = u_xlat10.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                u_xlat20 = (-u_xlat19) * 4.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                u_xlat20 = (-u_xlat14) * 4.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                u_xlati5.xy = op_not(u_xlati15.xy);
                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                u_xlat5.x = u_xlat19 * 4.0 + u_xlat10.x;
                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                u_xlat5.x = u_xlat14 * 4.0 + u_xlat10.z;
                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                if(u_xlati20 != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat5.xy = u_xlat4.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat5.xy = u_xlat10.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                    u_xlat18 = (-u_xlat18) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat18;
                    u_xlatb15.xy = greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy;
                    u_xlat18 = (-u_xlat19) * 12.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlatb15.x) ? u_xlat4.x : u_xlat18;
                    u_xlat18 = (-u_xlat14) * 12.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlatb15.x) ? u_xlat4.z : u_xlat18;
                    u_xlat18 = u_xlat19 * 12.0 + u_xlat10.x;
                    u_xlat10.x = (u_xlatb15.y) ? u_xlat10.x : u_xlat18;
                    u_xlat18 = u_xlat14 * 12.0 + u_xlat10.z;
                    u_xlat10.z = (u_xlatb15.y) ? u_xlat10.z : u_xlat18;
                }
            }
        }
        u_xlat18 = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat19 = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat19;
        u_xlat7.xz = u_xlat10.xz + (-vs_TEXCOORD0.xy);
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat7.z;
        u_xlati14.xy = ivec2(ivec2(lessThan(u_xlat3.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy) * -1);
        u_xlat19 = u_xlat18 + u_xlat7.x;
        u_xlatb2.xz = notEqual(ivec4(u_xlati2), u_xlati14.xxyx).xz;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlatb20 = u_xlat18<u_xlat7.x;
        u_xlat18 = min(u_xlat18, u_xlat7.x);
        u_xlatb7 = (u_xlatb20) ? u_xlatb2.x : u_xlatb2.z;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat18 = u_xlat18 * (-u_xlat19) + 0.5;
        u_xlat18 = u_xlatb7 ? u_xlat18 : float(0.0);
        u_xlat18 = max(u_xlat13, u_xlat18);
        u_xlat1.xy = vec2(u_xlat18) * u_xlat1.xx + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat3.y = (u_xlatb8) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat3.y = clamp(u_xlat3.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat3.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat10_18 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_18;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA_KEEP_ALPHA" "FXAA_LOW" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
vec4 u_xlat2;
int u_xlati2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
lowp float u_xlat10_9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
float u_xlat14;
lowp float u_xlat10_14;
ivec2 u_xlati14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
float u_xlat20;
int u_xlati20;
bool u_xlatb20;
float u_xlat21;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat18 = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).y;
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).y;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat7.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
    u_xlat13 = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).y;
    u_xlat19 = max(u_xlat0.y, u_xlat18);
    u_xlat2.x = min(u_xlat0.y, u_xlat18);
    u_xlat19 = max(u_xlat19, u_xlat1.x);
    u_xlat2.x = min(u_xlat1.x, u_xlat2.x);
    u_xlat8.x = max(u_xlat13, u_xlat7.x);
    u_xlat14 = min(u_xlat13, u_xlat7.x);
    u_xlat19 = max(u_xlat19, u_xlat8.x);
    u_xlat2.x = min(u_xlat2.x, u_xlat14);
    u_xlat8.x = u_xlat19 * 0.165999994;
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat2.x = max(u_xlat8.x, 0.0625);
    u_xlatb2.x = u_xlat19>=u_xlat2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
        u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
        u_xlat8.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.y = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).y;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).y;
        u_xlat2.w = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).y;
        u_xlat3.x = u_xlat18 + u_xlat7.x;
        u_xlat9.x = u_xlat1.x + u_xlat13;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlat15.x = u_xlat9.x + u_xlat3.x;
        u_xlat3.x = u_xlat0.y * -2.0 + u_xlat3.x;
        u_xlat9.x = u_xlat0.y * -2.0 + u_xlat9.x;
        u_xlat21 = u_xlat2.y + u_xlat10_14;
        u_xlat14 = u_xlat10_14 + u_xlat2.x;
        u_xlat4.x = u_xlat1.x * -2.0 + u_xlat21;
        u_xlat14 = u_xlat7.x * -2.0 + u_xlat14;
        u_xlat2.xy = u_xlat2.wy + u_xlat2.xw;
        u_xlat20 = abs(u_xlat3.x) * 2.0 + abs(u_xlat4.x);
        u_xlat14 = abs(u_xlat9.x) * 2.0 + abs(u_xlat14);
        u_xlat3.x = u_xlat13 * -2.0 + u_xlat2.x;
        u_xlat8.x = u_xlat18 * -2.0 + u_xlat2.y;
        u_xlat20 = u_xlat20 + abs(u_xlat3.x);
        u_xlat8.x = u_xlat14 + abs(u_xlat8.x);
        u_xlat2.x = u_xlat21 + u_xlat2.x;
        u_xlatb8 = u_xlat20>=u_xlat8.x;
        u_xlat2.x = u_xlat15.x * 2.0 + u_xlat2.x;
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat13;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat1.x;
        u_xlat1.x = (u_xlatb8) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat13 = u_xlat2.x * 0.0833333358 + (-u_xlat0.y);
        u_xlat2.x = (-u_xlat0.y) + u_xlat7.x;
        u_xlat14 = (-u_xlat0.y) + u_xlat18;
        u_xlat7.x = u_xlat0.y + u_xlat7.x;
        u_xlat18 = u_xlat0.y + u_xlat18;
        u_xlatb20 = abs(u_xlat2.x)>=abs(u_xlat14);
        u_xlat2.x = max(abs(u_xlat14), abs(u_xlat2.x));
        u_xlat1.x = (u_xlatb20) ? (-u_xlat1.x) : u_xlat1.x;
        u_xlat13 = u_xlat19 * abs(u_xlat13);
        u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
        u_xlat19 = u_xlatb8 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat14 = (u_xlatb8) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat3.xy = u_xlat1.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat3.x;
        u_xlat9.x = (u_xlatb8) ? u_xlat3.y : vs_TEXCOORD0.y;
        u_xlat4.x = (-u_xlat19) + u_xlat3.x;
        u_xlat4.y = (-u_xlat14) + u_xlat9.x;
        u_xlat5.x = u_xlat19 + u_xlat3.x;
        u_xlat5.y = u_xlat14 + u_xlat9.x;
        u_xlat3.x = u_xlat13 * -2.0 + 3.0;
        u_xlat9.xy = u_xlat4.xy;
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat9.xy = u_xlat9.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_9 = texture2DLodEXT(_MainTex, u_xlat9.xy, 0.0).y;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat15.xy = u_xlat5.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).y;
        u_xlat18 = (u_xlatb20) ? u_xlat7.x : u_xlat18;
        u_xlat7.x = u_xlat2.x * 0.25;
        u_xlat2.x = (-u_xlat18) * 0.5 + u_xlat0.y;
        u_xlat13 = u_xlat13 * u_xlat3.x;
        u_xlati2 = int((u_xlat2.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat18) * 0.5 + u_xlat10_9;
        u_xlat3.y = (-u_xlat18) * 0.5 + u_xlat10_15;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
        u_xlat20 = (-u_xlat19) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
        u_xlat20 = (-u_xlat14) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat20;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati20 = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat10.x = u_xlat19 * 1.5 + u_xlat5.x;
        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat10.x;
        u_xlat5.x = u_xlat14 * 1.5 + u_xlat5.y;
        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat5.x;
        if(u_xlati20 != 0) {
            if(u_xlati15.x == 0) {
                u_xlat5.xy = u_xlat4.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            if(u_xlati15.y == 0) {
                u_xlat5.xy = u_xlat10.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
            u_xlati5.xy = op_not(u_xlati15.xy);
            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
            if(u_xlati20 != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat5.xy = u_xlat4.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                if(u_xlati15.y == 0) {
                    u_xlat5.xy = u_xlat10.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                u_xlat20 = (-u_xlat19) * 4.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                u_xlat20 = (-u_xlat14) * 4.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                u_xlati5.xy = op_not(u_xlati15.xy);
                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                u_xlat5.x = u_xlat19 * 4.0 + u_xlat10.x;
                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                u_xlat5.x = u_xlat14 * 4.0 + u_xlat10.z;
                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                if(u_xlati20 != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat5.xy = u_xlat4.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat5.xy = u_xlat10.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                    u_xlat18 = (-u_xlat18) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat18;
                    u_xlatb15.xy = greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy;
                    u_xlat18 = (-u_xlat19) * 12.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlatb15.x) ? u_xlat4.x : u_xlat18;
                    u_xlat18 = (-u_xlat14) * 12.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlatb15.x) ? u_xlat4.z : u_xlat18;
                    u_xlat18 = u_xlat19 * 12.0 + u_xlat10.x;
                    u_xlat10.x = (u_xlatb15.y) ? u_xlat10.x : u_xlat18;
                    u_xlat18 = u_xlat14 * 12.0 + u_xlat10.z;
                    u_xlat10.z = (u_xlatb15.y) ? u_xlat10.z : u_xlat18;
                }
            }
        }
        u_xlat18 = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat19 = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat19;
        u_xlat7.xz = u_xlat10.xz + (-vs_TEXCOORD0.xy);
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat7.z;
        u_xlati14.xy = ivec2(ivec2(lessThan(u_xlat3.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy) * -1);
        u_xlat19 = u_xlat18 + u_xlat7.x;
        u_xlatb2.xz = notEqual(ivec4(u_xlati2), u_xlati14.xxyx).xz;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlatb20 = u_xlat18<u_xlat7.x;
        u_xlat18 = min(u_xlat18, u_xlat7.x);
        u_xlatb7 = (u_xlatb20) ? u_xlatb2.x : u_xlatb2.z;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat18 = u_xlat18 * (-u_xlat19) + 0.5;
        u_xlat18 = u_xlatb7 ? u_xlat18 : float(0.0);
        u_xlat18 = max(u_xlat13, u_xlat18);
        u_xlat1.xy = vec2(u_xlat18) * u_xlat1.xx + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat3.y = (u_xlatb8) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat3.y = clamp(u_xlat3.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat3.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat10_18 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_18;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA_KEEP_ALPHA" "FXAA_LOW" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
vec4 u_xlat2;
int u_xlati2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
lowp float u_xlat10_9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
float u_xlat14;
lowp float u_xlat10_14;
ivec2 u_xlati14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
float u_xlat20;
int u_xlati20;
bool u_xlatb20;
float u_xlat21;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat18 = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).y;
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).y;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat7.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
    u_xlat13 = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).y;
    u_xlat19 = max(u_xlat0.y, u_xlat18);
    u_xlat2.x = min(u_xlat0.y, u_xlat18);
    u_xlat19 = max(u_xlat19, u_xlat1.x);
    u_xlat2.x = min(u_xlat1.x, u_xlat2.x);
    u_xlat8.x = max(u_xlat13, u_xlat7.x);
    u_xlat14 = min(u_xlat13, u_xlat7.x);
    u_xlat19 = max(u_xlat19, u_xlat8.x);
    u_xlat2.x = min(u_xlat2.x, u_xlat14);
    u_xlat8.x = u_xlat19 * 0.165999994;
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat2.x = max(u_xlat8.x, 0.0625);
    u_xlatb2.x = u_xlat19>=u_xlat2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
        u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
        u_xlat8.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.y = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).y;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).y;
        u_xlat2.w = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).y;
        u_xlat3.x = u_xlat18 + u_xlat7.x;
        u_xlat9.x = u_xlat1.x + u_xlat13;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlat15.x = u_xlat9.x + u_xlat3.x;
        u_xlat3.x = u_xlat0.y * -2.0 + u_xlat3.x;
        u_xlat9.x = u_xlat0.y * -2.0 + u_xlat9.x;
        u_xlat21 = u_xlat2.y + u_xlat10_14;
        u_xlat14 = u_xlat10_14 + u_xlat2.x;
        u_xlat4.x = u_xlat1.x * -2.0 + u_xlat21;
        u_xlat14 = u_xlat7.x * -2.0 + u_xlat14;
        u_xlat2.xy = u_xlat2.wy + u_xlat2.xw;
        u_xlat20 = abs(u_xlat3.x) * 2.0 + abs(u_xlat4.x);
        u_xlat14 = abs(u_xlat9.x) * 2.0 + abs(u_xlat14);
        u_xlat3.x = u_xlat13 * -2.0 + u_xlat2.x;
        u_xlat8.x = u_xlat18 * -2.0 + u_xlat2.y;
        u_xlat20 = u_xlat20 + abs(u_xlat3.x);
        u_xlat8.x = u_xlat14 + abs(u_xlat8.x);
        u_xlat2.x = u_xlat21 + u_xlat2.x;
        u_xlatb8 = u_xlat20>=u_xlat8.x;
        u_xlat2.x = u_xlat15.x * 2.0 + u_xlat2.x;
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat13;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat1.x;
        u_xlat1.x = (u_xlatb8) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat13 = u_xlat2.x * 0.0833333358 + (-u_xlat0.y);
        u_xlat2.x = (-u_xlat0.y) + u_xlat7.x;
        u_xlat14 = (-u_xlat0.y) + u_xlat18;
        u_xlat7.x = u_xlat0.y + u_xlat7.x;
        u_xlat18 = u_xlat0.y + u_xlat18;
        u_xlatb20 = abs(u_xlat2.x)>=abs(u_xlat14);
        u_xlat2.x = max(abs(u_xlat14), abs(u_xlat2.x));
        u_xlat1.x = (u_xlatb20) ? (-u_xlat1.x) : u_xlat1.x;
        u_xlat13 = u_xlat19 * abs(u_xlat13);
        u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
        u_xlat19 = u_xlatb8 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat14 = (u_xlatb8) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat3.xy = u_xlat1.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat3.x;
        u_xlat9.x = (u_xlatb8) ? u_xlat3.y : vs_TEXCOORD0.y;
        u_xlat4.x = (-u_xlat19) + u_xlat3.x;
        u_xlat4.y = (-u_xlat14) + u_xlat9.x;
        u_xlat5.x = u_xlat19 + u_xlat3.x;
        u_xlat5.y = u_xlat14 + u_xlat9.x;
        u_xlat3.x = u_xlat13 * -2.0 + 3.0;
        u_xlat9.xy = u_xlat4.xy;
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat9.xy = u_xlat9.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_9 = texture2DLodEXT(_MainTex, u_xlat9.xy, 0.0).y;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat15.xy = u_xlat5.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).y;
        u_xlat18 = (u_xlatb20) ? u_xlat7.x : u_xlat18;
        u_xlat7.x = u_xlat2.x * 0.25;
        u_xlat2.x = (-u_xlat18) * 0.5 + u_xlat0.y;
        u_xlat13 = u_xlat13 * u_xlat3.x;
        u_xlati2 = int((u_xlat2.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat18) * 0.5 + u_xlat10_9;
        u_xlat3.y = (-u_xlat18) * 0.5 + u_xlat10_15;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
        u_xlat20 = (-u_xlat19) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
        u_xlat20 = (-u_xlat14) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat20;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati20 = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat10.x = u_xlat19 * 1.5 + u_xlat5.x;
        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat10.x;
        u_xlat5.x = u_xlat14 * 1.5 + u_xlat5.y;
        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat5.x;
        if(u_xlati20 != 0) {
            if(u_xlati15.x == 0) {
                u_xlat5.xy = u_xlat4.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            if(u_xlati15.y == 0) {
                u_xlat5.xy = u_xlat10.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
            u_xlati5.xy = op_not(u_xlati15.xy);
            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
            if(u_xlati20 != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat5.xy = u_xlat4.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                if(u_xlati15.y == 0) {
                    u_xlat5.xy = u_xlat10.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                u_xlat20 = (-u_xlat19) * 4.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                u_xlat20 = (-u_xlat14) * 4.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                u_xlati5.xy = op_not(u_xlati15.xy);
                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                u_xlat5.x = u_xlat19 * 4.0 + u_xlat10.x;
                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                u_xlat5.x = u_xlat14 * 4.0 + u_xlat10.z;
                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                if(u_xlati20 != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat5.xy = u_xlat4.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat5.xy = u_xlat10.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                    u_xlat18 = (-u_xlat18) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat18;
                    u_xlatb15.xy = greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy;
                    u_xlat18 = (-u_xlat19) * 12.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlatb15.x) ? u_xlat4.x : u_xlat18;
                    u_xlat18 = (-u_xlat14) * 12.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlatb15.x) ? u_xlat4.z : u_xlat18;
                    u_xlat18 = u_xlat19 * 12.0 + u_xlat10.x;
                    u_xlat10.x = (u_xlatb15.y) ? u_xlat10.x : u_xlat18;
                    u_xlat18 = u_xlat14 * 12.0 + u_xlat10.z;
                    u_xlat10.z = (u_xlatb15.y) ? u_xlat10.z : u_xlat18;
                }
            }
        }
        u_xlat18 = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat19 = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat19;
        u_xlat7.xz = u_xlat10.xz + (-vs_TEXCOORD0.xy);
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat7.z;
        u_xlati14.xy = ivec2(ivec2(lessThan(u_xlat3.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy) * -1);
        u_xlat19 = u_xlat18 + u_xlat7.x;
        u_xlatb2.xz = notEqual(ivec4(u_xlati2), u_xlati14.xxyx).xz;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlatb20 = u_xlat18<u_xlat7.x;
        u_xlat18 = min(u_xlat18, u_xlat7.x);
        u_xlatb7 = (u_xlatb20) ? u_xlatb2.x : u_xlatb2.z;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat18 = u_xlat18 * (-u_xlat19) + 0.5;
        u_xlat18 = u_xlatb7 ? u_xlat18 : float(0.0);
        u_xlat18 = max(u_xlat13, u_xlat18);
        u_xlat1.xy = vec2(u_xlat18) * u_xlat1.xx + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat3.y = (u_xlatb8) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat3.y = clamp(u_xlat3.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat3.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat10_18 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_18;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA_KEEP_ALPHA" "FXAA_LOW" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
vec4 u_xlat2;
int u_xlati2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
lowp float u_xlat10_9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
float u_xlat14;
lowp float u_xlat10_14;
ivec2 u_xlati14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
float u_xlat20;
int u_xlati20;
bool u_xlatb20;
float u_xlat21;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat18 = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).y;
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).y;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat7.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
    u_xlat13 = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).y;
    u_xlat19 = max(u_xlat0.y, u_xlat18);
    u_xlat2.x = min(u_xlat0.y, u_xlat18);
    u_xlat19 = max(u_xlat19, u_xlat1.x);
    u_xlat2.x = min(u_xlat1.x, u_xlat2.x);
    u_xlat8.x = max(u_xlat13, u_xlat7.x);
    u_xlat14 = min(u_xlat13, u_xlat7.x);
    u_xlat19 = max(u_xlat19, u_xlat8.x);
    u_xlat2.x = min(u_xlat2.x, u_xlat14);
    u_xlat8.x = u_xlat19 * 0.165999994;
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat2.x = max(u_xlat8.x, 0.0625);
    u_xlatb2.x = u_xlat19>=u_xlat2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
        u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
        u_xlat8.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.y = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).y;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).y;
        u_xlat2.w = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).y;
        u_xlat3.x = u_xlat18 + u_xlat7.x;
        u_xlat9.x = u_xlat1.x + u_xlat13;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlat15.x = u_xlat9.x + u_xlat3.x;
        u_xlat3.x = u_xlat0.y * -2.0 + u_xlat3.x;
        u_xlat9.x = u_xlat0.y * -2.0 + u_xlat9.x;
        u_xlat21 = u_xlat2.y + u_xlat10_14;
        u_xlat14 = u_xlat10_14 + u_xlat2.x;
        u_xlat4.x = u_xlat1.x * -2.0 + u_xlat21;
        u_xlat14 = u_xlat7.x * -2.0 + u_xlat14;
        u_xlat2.xy = u_xlat2.wy + u_xlat2.xw;
        u_xlat20 = abs(u_xlat3.x) * 2.0 + abs(u_xlat4.x);
        u_xlat14 = abs(u_xlat9.x) * 2.0 + abs(u_xlat14);
        u_xlat3.x = u_xlat13 * -2.0 + u_xlat2.x;
        u_xlat8.x = u_xlat18 * -2.0 + u_xlat2.y;
        u_xlat20 = u_xlat20 + abs(u_xlat3.x);
        u_xlat8.x = u_xlat14 + abs(u_xlat8.x);
        u_xlat2.x = u_xlat21 + u_xlat2.x;
        u_xlatb8 = u_xlat20>=u_xlat8.x;
        u_xlat2.x = u_xlat15.x * 2.0 + u_xlat2.x;
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat13;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat1.x;
        u_xlat1.x = (u_xlatb8) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat13 = u_xlat2.x * 0.0833333358 + (-u_xlat0.y);
        u_xlat2.x = (-u_xlat0.y) + u_xlat7.x;
        u_xlat14 = (-u_xlat0.y) + u_xlat18;
        u_xlat7.x = u_xlat0.y + u_xlat7.x;
        u_xlat18 = u_xlat0.y + u_xlat18;
        u_xlatb20 = abs(u_xlat2.x)>=abs(u_xlat14);
        u_xlat2.x = max(abs(u_xlat14), abs(u_xlat2.x));
        u_xlat1.x = (u_xlatb20) ? (-u_xlat1.x) : u_xlat1.x;
        u_xlat13 = u_xlat19 * abs(u_xlat13);
        u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
        u_xlat19 = u_xlatb8 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat14 = (u_xlatb8) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat3.xy = u_xlat1.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat3.x;
        u_xlat9.x = (u_xlatb8) ? u_xlat3.y : vs_TEXCOORD0.y;
        u_xlat4.x = (-u_xlat19) + u_xlat3.x;
        u_xlat4.y = (-u_xlat14) + u_xlat9.x;
        u_xlat5.x = u_xlat19 + u_xlat3.x;
        u_xlat5.y = u_xlat14 + u_xlat9.x;
        u_xlat3.x = u_xlat13 * -2.0 + 3.0;
        u_xlat9.xy = u_xlat4.xy;
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat9.xy = u_xlat9.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_9 = texture2DLodEXT(_MainTex, u_xlat9.xy, 0.0).y;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat15.xy = u_xlat5.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).y;
        u_xlat18 = (u_xlatb20) ? u_xlat7.x : u_xlat18;
        u_xlat7.x = u_xlat2.x * 0.25;
        u_xlat2.x = (-u_xlat18) * 0.5 + u_xlat0.y;
        u_xlat13 = u_xlat13 * u_xlat3.x;
        u_xlati2 = int((u_xlat2.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat18) * 0.5 + u_xlat10_9;
        u_xlat3.y = (-u_xlat18) * 0.5 + u_xlat10_15;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
        u_xlat20 = (-u_xlat19) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
        u_xlat20 = (-u_xlat14) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat20;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati20 = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat10.x = u_xlat19 * 1.5 + u_xlat5.x;
        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat10.x;
        u_xlat5.x = u_xlat14 * 1.5 + u_xlat5.y;
        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat5.x;
        if(u_xlati20 != 0) {
            if(u_xlati15.x == 0) {
                u_xlat5.xy = u_xlat4.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            if(u_xlati15.y == 0) {
                u_xlat5.xy = u_xlat10.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
            u_xlati5.xy = op_not(u_xlati15.xy);
            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
            if(u_xlati20 != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat5.xy = u_xlat4.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                if(u_xlati15.y == 0) {
                    u_xlat5.xy = u_xlat10.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                u_xlat20 = (-u_xlat19) * 4.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                u_xlat20 = (-u_xlat14) * 4.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                u_xlati5.xy = op_not(u_xlati15.xy);
                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                u_xlat5.x = u_xlat19 * 4.0 + u_xlat10.x;
                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                u_xlat5.x = u_xlat14 * 4.0 + u_xlat10.z;
                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                if(u_xlati20 != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat5.xy = u_xlat4.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat5.xy = u_xlat10.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                    u_xlat18 = (-u_xlat18) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat18;
                    u_xlatb15.xy = greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy;
                    u_xlat18 = (-u_xlat19) * 12.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlatb15.x) ? u_xlat4.x : u_xlat18;
                    u_xlat18 = (-u_xlat14) * 12.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlatb15.x) ? u_xlat4.z : u_xlat18;
                    u_xlat18 = u_xlat19 * 12.0 + u_xlat10.x;
                    u_xlat10.x = (u_xlatb15.y) ? u_xlat10.x : u_xlat18;
                    u_xlat18 = u_xlat14 * 12.0 + u_xlat10.z;
                    u_xlat10.z = (u_xlatb15.y) ? u_xlat10.z : u_xlat18;
                }
            }
        }
        u_xlat18 = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat19 = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat19;
        u_xlat7.xz = u_xlat10.xz + (-vs_TEXCOORD0.xy);
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat7.z;
        u_xlati14.xy = ivec2(ivec2(lessThan(u_xlat3.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy) * -1);
        u_xlat19 = u_xlat18 + u_xlat7.x;
        u_xlatb2.xz = notEqual(ivec4(u_xlati2), u_xlati14.xxyx).xz;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlatb20 = u_xlat18<u_xlat7.x;
        u_xlat18 = min(u_xlat18, u_xlat7.x);
        u_xlatb7 = (u_xlatb20) ? u_xlatb2.x : u_xlatb2.z;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat18 = u_xlat18 * (-u_xlat19) + 0.5;
        u_xlat18 = u_xlatb7 ? u_xlat18 : float(0.0);
        u_xlat18 = max(u_xlat13, u_xlat18);
        u_xlat1.xy = vec2(u_xlat18) * u_xlat1.xx + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat3.y = (u_xlatb8) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat3.y = clamp(u_xlat3.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat3.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat10_18 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_18;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA_KEEP_ALPHA" "FXAA_LOW" "STEREO_DOUBLEWIDE_TARGET" }
"#ifdef VERTEX
#version 100

uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _UVTransform;
uniform 	vec4 _PosScaleOffset;
attribute highp vec3 in_POSITION0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy * _PosScaleOffset.xy + _PosScaleOffset.zw;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _UVTransform.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + _UVTransform.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = u_xlat0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _RenderViewportScaleFactor;
uniform 	vec4 _Dithering_Coords;
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DitheringTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
vec4 u_xlat2;
int u_xlati2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
ivec2 u_xlati5;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
lowp float u_xlat10_9;
vec3 u_xlat10;
ivec3 u_xlati10;
float u_xlat13;
float u_xlat14;
lowp float u_xlat10_14;
ivec2 u_xlati14;
vec2 u_xlat15;
lowp float u_xlat10_15;
ivec2 u_xlati15;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
float u_xlat20;
int u_xlati20;
bool u_xlatb20;
float u_xlat21;
int op_not(int value) { return -value - 1; }
ivec2 op_not(ivec2 a) { a.x = op_not(a.x); a.y = op_not(a.y); return a; }
ivec3 op_not(ivec3 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); return a; }
ivec4 op_not(ivec4 a) { a.x = op_not(a.x); a.y = op_not(a.y); a.z = op_not(a.z); a.w = op_not(a.w); return a; }

const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat1 = u_xlat1 * vec4(_RenderViewportScaleFactor);
    u_xlat18 = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).y;
    u_xlat1.x = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).y;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat2 = u_xlat2 * vec4(_RenderViewportScaleFactor);
    u_xlat7.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
    u_xlat13 = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).y;
    u_xlat19 = max(u_xlat0.y, u_xlat18);
    u_xlat2.x = min(u_xlat0.y, u_xlat18);
    u_xlat19 = max(u_xlat19, u_xlat1.x);
    u_xlat2.x = min(u_xlat1.x, u_xlat2.x);
    u_xlat8.x = max(u_xlat13, u_xlat7.x);
    u_xlat14 = min(u_xlat13, u_xlat7.x);
    u_xlat19 = max(u_xlat19, u_xlat8.x);
    u_xlat2.x = min(u_xlat2.x, u_xlat14);
    u_xlat8.x = u_xlat19 * 0.165999994;
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat2.x = max(u_xlat8.x, 0.0625);
    u_xlatb2.x = u_xlat19>=u_xlat2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
        u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
        u_xlat2.xy = u_xlat2.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.x = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).y;
        u_xlat8.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
        u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
        u_xlat8.xy = u_xlat8.xy * vec2(_RenderViewportScaleFactor);
        u_xlat2.y = texture2DLodEXT(_MainTex, u_xlat8.xy, 0.0).y;
        u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat3 = u_xlat3 * vec4(_RenderViewportScaleFactor);
        u_xlat10_14 = texture2DLodEXT(_MainTex, u_xlat3.xy, 0.0).y;
        u_xlat2.w = texture2DLodEXT(_MainTex, u_xlat3.zw, 0.0).y;
        u_xlat3.x = u_xlat18 + u_xlat7.x;
        u_xlat9.x = u_xlat1.x + u_xlat13;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlat15.x = u_xlat9.x + u_xlat3.x;
        u_xlat3.x = u_xlat0.y * -2.0 + u_xlat3.x;
        u_xlat9.x = u_xlat0.y * -2.0 + u_xlat9.x;
        u_xlat21 = u_xlat2.y + u_xlat10_14;
        u_xlat14 = u_xlat10_14 + u_xlat2.x;
        u_xlat4.x = u_xlat1.x * -2.0 + u_xlat21;
        u_xlat14 = u_xlat7.x * -2.0 + u_xlat14;
        u_xlat2.xy = u_xlat2.wy + u_xlat2.xw;
        u_xlat20 = abs(u_xlat3.x) * 2.0 + abs(u_xlat4.x);
        u_xlat14 = abs(u_xlat9.x) * 2.0 + abs(u_xlat14);
        u_xlat3.x = u_xlat13 * -2.0 + u_xlat2.x;
        u_xlat8.x = u_xlat18 * -2.0 + u_xlat2.y;
        u_xlat20 = u_xlat20 + abs(u_xlat3.x);
        u_xlat8.x = u_xlat14 + abs(u_xlat8.x);
        u_xlat2.x = u_xlat21 + u_xlat2.x;
        u_xlatb8 = u_xlat20>=u_xlat8.x;
        u_xlat2.x = u_xlat15.x * 2.0 + u_xlat2.x;
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat13;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat1.x;
        u_xlat1.x = (u_xlatb8) ? _MainTex_TexelSize.y : _MainTex_TexelSize.x;
        u_xlat13 = u_xlat2.x * 0.0833333358 + (-u_xlat0.y);
        u_xlat2.x = (-u_xlat0.y) + u_xlat7.x;
        u_xlat14 = (-u_xlat0.y) + u_xlat18;
        u_xlat7.x = u_xlat0.y + u_xlat7.x;
        u_xlat18 = u_xlat0.y + u_xlat18;
        u_xlatb20 = abs(u_xlat2.x)>=abs(u_xlat14);
        u_xlat2.x = max(abs(u_xlat14), abs(u_xlat2.x));
        u_xlat1.x = (u_xlatb20) ? (-u_xlat1.x) : u_xlat1.x;
        u_xlat13 = u_xlat19 * abs(u_xlat13);
        u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
        u_xlat19 = u_xlatb8 ? _MainTex_TexelSize.x : float(0.0);
        u_xlat14 = (u_xlatb8) ? 0.0 : _MainTex_TexelSize.y;
        u_xlat3.xy = u_xlat1.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat3.x;
        u_xlat9.x = (u_xlatb8) ? u_xlat3.y : vs_TEXCOORD0.y;
        u_xlat4.x = (-u_xlat19) + u_xlat3.x;
        u_xlat4.y = (-u_xlat14) + u_xlat9.x;
        u_xlat5.x = u_xlat19 + u_xlat3.x;
        u_xlat5.y = u_xlat14 + u_xlat9.x;
        u_xlat3.x = u_xlat13 * -2.0 + 3.0;
        u_xlat9.xy = u_xlat4.xy;
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat9.xy = u_xlat9.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_9 = texture2DLodEXT(_MainTex, u_xlat9.xy, 0.0).y;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat15.xy = u_xlat5.xy;
        u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
        u_xlat15.xy = u_xlat15.xy * vec2(_RenderViewportScaleFactor);
        u_xlat10_15 = texture2DLodEXT(_MainTex, u_xlat15.xy, 0.0).y;
        u_xlat18 = (u_xlatb20) ? u_xlat7.x : u_xlat18;
        u_xlat7.x = u_xlat2.x * 0.25;
        u_xlat2.x = (-u_xlat18) * 0.5 + u_xlat0.y;
        u_xlat13 = u_xlat13 * u_xlat3.x;
        u_xlati2 = int((u_xlat2.x<0.0) ? -1 : 0);
        u_xlat3.x = (-u_xlat18) * 0.5 + u_xlat10_9;
        u_xlat3.y = (-u_xlat18) * 0.5 + u_xlat10_15;
        u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
        u_xlat20 = (-u_xlat19) * 1.5 + u_xlat4.x;
        u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
        u_xlat20 = (-u_xlat14) * 1.5 + u_xlat4.y;
        u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.y : u_xlat20;
        u_xlati10.xz = op_not(u_xlati15.xy);
        u_xlati20 = op_or(u_xlati10.z, u_xlati10.x);
        u_xlat10.x = u_xlat19 * 1.5 + u_xlat5.x;
        u_xlat10.x = (u_xlati15.y != 0) ? u_xlat5.x : u_xlat10.x;
        u_xlat5.x = u_xlat14 * 1.5 + u_xlat5.y;
        u_xlat10.z = (u_xlati15.y != 0) ? u_xlat5.y : u_xlat5.x;
        if(u_xlati20 != 0) {
            if(u_xlati15.x == 0) {
                u_xlat5.xy = u_xlat4.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            if(u_xlati15.y == 0) {
                u_xlat5.xy = u_xlat10.xz;
                u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
            }
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
            u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
            u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
            u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
            u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
            u_xlat20 = (-u_xlat19) * 2.0 + u_xlat4.x;
            u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
            u_xlat20 = (-u_xlat14) * 2.0 + u_xlat4.z;
            u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
            u_xlati5.xy = op_not(u_xlati15.xy);
            u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
            u_xlat5.x = u_xlat19 * 2.0 + u_xlat10.x;
            u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
            u_xlat5.x = u_xlat14 * 2.0 + u_xlat10.z;
            u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
            if(u_xlati20 != 0) {
                if(u_xlati15.x == 0) {
                    u_xlat5.xy = u_xlat4.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                if(u_xlati15.y == 0) {
                    u_xlat5.xy = u_xlat10.xz;
                    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                    u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                    u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                }
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.y;
                u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat20;
                u_xlati15.xy = ivec2(ivec2(greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy) * -1);
                u_xlat20 = (-u_xlat19) * 4.0 + u_xlat4.x;
                u_xlat4.x = (u_xlati15.x != 0) ? u_xlat4.x : u_xlat20;
                u_xlat20 = (-u_xlat14) * 4.0 + u_xlat4.z;
                u_xlat4.z = (u_xlati15.x != 0) ? u_xlat4.z : u_xlat20;
                u_xlati5.xy = op_not(u_xlati15.xy);
                u_xlati20 = op_or(u_xlati5.y, u_xlati5.x);
                u_xlat5.x = u_xlat19 * 4.0 + u_xlat10.x;
                u_xlat10.x = (u_xlati15.y != 0) ? u_xlat10.x : u_xlat5.x;
                u_xlat5.x = u_xlat14 * 4.0 + u_xlat10.z;
                u_xlat10.z = (u_xlati15.y != 0) ? u_xlat10.z : u_xlat5.x;
                if(u_xlati20 != 0) {
                    if(u_xlati15.x == 0) {
                        u_xlat5.xy = u_xlat4.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.x = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    if(u_xlati15.y == 0) {
                        u_xlat5.xy = u_xlat10.xz;
                        u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
                        u_xlat5.xy = u_xlat5.xy * vec2(_RenderViewportScaleFactor);
                        u_xlat3.y = texture2DLodEXT(_MainTex, u_xlat5.xy, 0.0).y;
                    }
                    u_xlat20 = (-u_xlat18) * 0.5 + u_xlat3.x;
                    u_xlat3.x = (u_xlati15.x != 0) ? u_xlat3.x : u_xlat20;
                    u_xlat18 = (-u_xlat18) * 0.5 + u_xlat3.y;
                    u_xlat3.y = (u_xlati15.y != 0) ? u_xlat3.y : u_xlat18;
                    u_xlatb15.xy = greaterThanEqual(abs(u_xlat3.xyxy), u_xlat7.xxxx).xy;
                    u_xlat18 = (-u_xlat19) * 12.0 + u_xlat4.x;
                    u_xlat4.x = (u_xlatb15.x) ? u_xlat4.x : u_xlat18;
                    u_xlat18 = (-u_xlat14) * 12.0 + u_xlat4.z;
                    u_xlat4.z = (u_xlatb15.x) ? u_xlat4.z : u_xlat18;
                    u_xlat18 = u_xlat19 * 12.0 + u_xlat10.x;
                    u_xlat10.x = (u_xlatb15.y) ? u_xlat10.x : u_xlat18;
                    u_xlat18 = u_xlat14 * 12.0 + u_xlat10.z;
                    u_xlat10.z = (u_xlatb15.y) ? u_xlat10.z : u_xlat18;
                }
            }
        }
        u_xlat18 = (-u_xlat4.x) + vs_TEXCOORD0.x;
        u_xlat19 = (-u_xlat4.z) + vs_TEXCOORD0.y;
        u_xlat18 = (u_xlatb8) ? u_xlat18 : u_xlat19;
        u_xlat7.xz = u_xlat10.xz + (-vs_TEXCOORD0.xy);
        u_xlat7.x = (u_xlatb8) ? u_xlat7.x : u_xlat7.z;
        u_xlati14.xy = ivec2(ivec2(lessThan(u_xlat3.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy) * -1);
        u_xlat19 = u_xlat18 + u_xlat7.x;
        u_xlatb2.xz = notEqual(ivec4(u_xlati2), u_xlati14.xxyx).xz;
        u_xlat19 = float(1.0) / u_xlat19;
        u_xlatb20 = u_xlat18<u_xlat7.x;
        u_xlat18 = min(u_xlat18, u_xlat7.x);
        u_xlatb7 = (u_xlatb20) ? u_xlatb2.x : u_xlatb2.z;
        u_xlat13 = u_xlat13 * u_xlat13;
        u_xlat18 = u_xlat18 * (-u_xlat19) + 0.5;
        u_xlat18 = u_xlatb7 ? u_xlat18 : float(0.0);
        u_xlat18 = max(u_xlat13, u_xlat18);
        u_xlat1.xy = vec2(u_xlat18) * u_xlat1.xx + vs_TEXCOORD0.xy;
        u_xlat3.x = (u_xlatb8) ? vs_TEXCOORD0.x : u_xlat1.x;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat3.y = (u_xlatb8) ? u_xlat1.y : vs_TEXCOORD0.y;
        u_xlat3.y = clamp(u_xlat3.y, 0.0, 1.0);
        u_xlat1.xy = u_xlat3.xy * vec2(_RenderViewportScaleFactor);
        u_xlat0.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    }
    u_xlat10_18 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Dithering_Coords.xy + _Dithering_Coords.zw;
    u_xlat10_1 = texture2D(_DitheringTex, u_xlat1.xy).w;
    u_xlat16_1 = u_xlat10_1 * 2.0 + -1.0;
    u_xlat16_7 = u_xlat16_1 * 3.40282347e+38 + 0.5;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat16_7 = u_xlat16_7 * 2.0 + -1.0;
    u_xlat16_1 = -abs(u_xlat16_1) + 1.0;
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_7;
    SV_Target0.xyz = vec3(u_xlat16_1) * vec3(0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0.xyz;
    SV_Target0.w = u_xlat10_18;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles hw_tier00 " {
Keywords { "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA_KEEP_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA_KEEP_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA_KEEP_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA_KEEP_ALPHA" "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA_KEEP_ALPHA" "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA_KEEP_ALPHA" "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA" "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA" "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA" "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA" "FXAA_KEEP_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA" "FXAA_KEEP_ALPHA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA" "FXAA_KEEP_ALPHA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA" "FXAA_KEEP_ALPHA" "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA" "FXAA_KEEP_ALPHA" "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA" "FXAA_KEEP_ALPHA" "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA_LOW" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA_LOW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA_LOW" "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA_LOW" "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA_LOW" "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA_KEEP_ALPHA" "FXAA_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA_KEEP_ALPHA" "FXAA_LOW" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA_KEEP_ALPHA" "FXAA_LOW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FXAA_KEEP_ALPHA" "FXAA_LOW" "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FXAA_KEEP_ALPHA" "FXAA_LOW" "STEREO_DOUBLEWIDE_TARGET" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FXAA_KEEP_ALPHA" "FXAA_LOW" "STEREO_DOUBLEWIDE_TARGET" }
""
}
}
}
}
}