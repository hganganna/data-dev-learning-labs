
 varying vec2 v_texCoord;
 
 uniform sampler2D CC_Texture0;
 uniform float contrast;
  uniform float opacity;
 
 void main()
 {
     vec4 textureColor = texture2D(CC_Texture0, v_texCoord);
     
     vec3 color = (textureColor.rgb - vec3(0.5)*textureColor.w)*contrast +vec3(0.5)*textureColor.w;

     color = clamp(color,vec3(0.0), vec3(textureColor.a));
     
     gl_FragColor = vec4(color, textureColor.w) * opacity;
 }
/*

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageContrastFragmentShaderString]))
    {
		return nil;
    }
    
    contrastUniform = [filterProgram uniformIndex:@"contrast"];
    self.contrast = 1.0;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setContrast:(CGFloat)newValue;
{
    _contrast = newValue;
    
    [self setFloat:_contrast forUniform:contrastUniform program:filterProgram];
}
*/

