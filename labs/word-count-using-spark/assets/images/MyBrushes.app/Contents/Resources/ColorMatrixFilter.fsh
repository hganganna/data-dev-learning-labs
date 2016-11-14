
 varying vec2 v_texCoord;
 
 uniform sampler2D CC_Texture0;
 
 uniform mat4 colorMatrix;
 uniform float intensity;
  uniform float opacity;
 
 void main()
 {
     vec4 textureColor = texture2D(CC_Texture0, v_texCoord);
     vec4 outputColor = textureColor * colorMatrix;
     
     gl_FragColor = ((intensity * outputColor) + ((1.0 - intensity) * textureColor))* * opacity;
 }

/*

@implementation GPUImageColorMatrixFilter

@synthesize intensity = _intensity;
@synthesize colorMatrix = _colorMatrix;

#pragma mark -
#pragma mark Initialization and teardown

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageColorMatrixFragmentShaderString]))
    {
        return nil;
    }
    
    colorMatrixUniform = [filterProgram uniformIndex:@"colorMatrix"];
    intensityUniform = [filterProgram uniformIndex:@"intensity"];
    
    self.intensity = 1.f;
    self.colorMatrix = (GPUMatrix4x4){
        {1.f, 0.f, 0.f, 0.f},
        {0.f, 1.f, 0.f, 0.f},
        {0.f, 0.f, 1.f, 0.f},
        {0.f, 0.f, 0.f, 1.f}
    };
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setIntensity:(CGFloat)newIntensity;
{
    _intensity = newIntensity;
    
    [self setFloat:_intensity forUniform:intensityUniform program:filterProgram];
}

- (void)setColorMatrix:(GPUMatrix4x4)newColorMatrix;
{
    _colorMatrix = newColorMatrix;
    
    [self setMatrix4f:_colorMatrix forUniform:colorMatrixUniform program:filterProgram];
}

@end
 */
