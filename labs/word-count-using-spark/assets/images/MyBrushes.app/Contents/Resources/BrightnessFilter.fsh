
 varying vec2 v_texCoord;
 
 uniform sampler2D CC_Texture0;
 uniform float brightness;
  uniform float opacity;

 void main()
 {
     vec4 textureColor = texture2D(CC_Texture0, v_texCoord);
     
     vec3 color = textureColor.rgb + brightness*textureColor.a;
     
     color = clamp(color, vec3(0.0), vec3(textureColor.a));
     
     gl_FragColor = vec4(color, textureColor.a) * opacity;//vec4(1.0, 1.0, 0.0, 1.0);//vec4(-1.0);//vec4(1.0);//
 }
/*
- (void)setBrightness:(CGFloat)newValue;
{
    _brightness = newValue;
    
    [self setFloat:_brightness forUniform:brightnessUniform program:filterProgram];
}

*/
