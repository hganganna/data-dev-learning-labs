
 varying vec2 v_texCoord;
 
 uniform sampler2D CC_Texture0;
  uniform float opacity;
 
 const vec3 W = vec3(0.2125, 0.7154, 0.0721);
 
 void main()
 {
     vec4 textureColor = texture2D(CC_Texture0, v_texCoord);
     float luminance = dot(textureColor.rgb, W);
     
     gl_FragColor = vec4(vec3(luminance), textureColor.a) * opacity;
 }
