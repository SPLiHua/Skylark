//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/VR/BlitFromTex2DToTexArraySlice" {
Properties {
_MainTex ("Texture", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 4191
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
  GpuProgramID 126208
Program "vp" {
}
Program "fp" {
}
Program "gp" {
}
}
}
}