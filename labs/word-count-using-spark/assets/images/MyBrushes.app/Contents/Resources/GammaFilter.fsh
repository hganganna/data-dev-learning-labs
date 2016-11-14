
 varying vec2 v_texCoord;
 
 uniform sampler2D CC_Texture0;
 uniform float gamma;
  uniform float opacity;
 
 void main()
 {
     vec4 textureColor = texture2D(CC_Texture0, v_texCoord);
     
     gl_FragColor = vec4(pow(textureColor.rgb, vec3(gamma)), textureColor.w) * opacity;
 }

/*
@implementation GPUImageGammaFilter

@synthesize gamma = _gamma;

#pragma mark -
#pragma mark Initialization and teardown

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageGammaFragmentShaderString]))
    {
		return nil;
    }
    
    gammaUniform = [filterProgram uniformIndex:@"gamma"];
    self.gamma = 1.0;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setGamma:(CGFloat)newValue;
{
    _gamma = newValue;
    
    [self setFloat:_gamma forUniform:gammaUniform program:filterProgram];
}

@end
*/
