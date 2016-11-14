
 varying vec2 v_texCoord;
 
 uniform sampler2D CC_Texture0;
 uniform float opacity1;
 uniform float opacity;
 
 void main()
 {
     vec4 textureColor = texture2D(CC_Texture0, v_texCoord);
     
    // gl_FragColor = vec4(textureColor.rgb, textureColor.a * opacity);
    
        gl_FragColor = vec4(textureColor.rgb * opacity1, textureColor.a * opacity1)*opacity;
 }

/*
#pragma mark -
#pragma mark Initialization and teardown

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageOpacityFragmentShaderString]))
    {
		return nil;
    }
    
    opacityUniform = [filterProgram uniformIndex:@"opacity"];
    self.opacity = 1.0;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setOpacity:(CGFloat)newValue;
{
    _opacity = newValue;
    
    [self setFloat:_opacity forUniform:opacityUniform program:filterProgram];
}

@end
 */
