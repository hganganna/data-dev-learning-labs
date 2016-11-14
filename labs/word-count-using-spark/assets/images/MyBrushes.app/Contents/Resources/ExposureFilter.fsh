
 varying vec2 v_texCoord;
 
 uniform sampler2D CC_Texture0;
 uniform float exposure;
  uniform float opacity;
 
 void main()
 {
     vec4 textureColor = texture2D(CC_Texture0, v_texCoord);
     
     gl_FragColor = vec4(textureColor.rgb * pow(2.0, exposure), textureColor.w) * opacity;
 }
/*

@implementation GPUImageExposureFilter

@synthesize exposure = _exposure;

#pragma mark -
#pragma mark Initialization and teardown

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageExposureFragmentShaderString]))
    {
		return nil;
    }
    
    exposureUniform = [filterProgram uniformIndex:@"exposure"];
    self.exposure = 0.0;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setExposure:(CGFloat)newValue;
{
    _exposure = newValue;
    
    [self setFloat:_exposure forUniform:exposureUniform program:filterProgram];
}

@end
*/
