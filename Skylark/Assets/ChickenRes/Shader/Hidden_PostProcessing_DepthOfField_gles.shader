//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/PostProcessing/DepthOfField" {
Properties {
}
SubShader {
 Pass {
  Name "CoC Calculation"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 58799
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "CoC Temporal Filter"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 73120
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Downsample and Prefilter"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 152566
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Bokeh Filter (small)"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 197836
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Bokeh Filter (medium)"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 321493
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Bokeh Filter (large)"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 368794
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Bokeh Filter (very large)"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 445628
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Postfilter"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 493748
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Combine"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 569740
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Debug Overlay"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 590047
Program "vp" {
}
Program "fp" {
}
}
}
SubShader {
 Pass {
  Name "CoC Calculation"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 682055
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "CoC Temporal Filter"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 783487
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Downsample and Prefilter"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 841262
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Bokeh Filter (small)"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 857051
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Bokeh Filter (medium)"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 938573
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Bokeh Filter (large)"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1018044
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Bokeh Filter (very large)"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1048767
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Postfilter"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1132712
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Combine"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1209491
Program "vp" {
}
Program "fp" {
}
}
 Pass {
  Name "Debug Overlay"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 1245794
Program "vp" {
}
Program "fp" {
}
}
}
}