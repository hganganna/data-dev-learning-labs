
 varying vec2 v_texCoord;
 
 uniform sampler2D CC_Texture0;
 
 uniform float crossHatchSpacing;
 uniform float lineWidth;
  uniform float opacity;
 
 const vec3 W = vec3(0.2125, 0.7154, 0.0721);
 
 void main()
 {
     float luminance = dot(texture2D(CC_Texture0, v_texCoord).rgb, W);
     
     vec4 colorToDisplay = vec4(1.0, 1.0, 1.0, 1.0);
     if (luminance < 1.00)
     {
         if (mod(v_texCoord.x + v_texCoord.y, crossHatchSpacing) <= lineWidth)
         {
             colorToDisplay = vec4(0.0, 0.0, 0.0, 1.0);
         }
     }
     if (luminance < 0.75)
     {
         if (mod(v_texCoord.x - v_texCoord.y, crossHatchSpacing) <= lineWidth)
         {
             colorToDisplay = vec4(0.0, 0.0, 0.0, 1.0);
         }
     }
     if (luminance < 0.50)
     {
         if (mod(v_texCoord.x + v_texCoord.y - (crossHatchSpacing / 2.0), crossHatchSpacing) <= lineWidth)
         {
             colorToDisplay = vec4(0.0, 0.0, 0.0, 1.0);
         }
     }
     if (luminance < 0.3)
     {
         if (mod(v_texCoord.x - v_texCoord.y - (crossHatchSpacing / 2.0), crossHatchSpacing) <= lineWidth)
         {
             colorToDisplay = vec4(0.0, 0.0, 0.0, 1.0);
         }
     }
     //gl_FragColor = colorToDisplay;
     gl_FragColor = vec4(colorToDisplay.xyz,texture2D(CC_Texture0, v_texCoord).a) * opacity;
 }
/*
@implementation GPUImageCrosshatchFilter

@synthesize crossHatchSpacing = _crossHatchSpacing;
@synthesize lineWidth = _lineWidth;

#pragma mark -
#pragma mark Initialization and teardown

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageCrosshatchFragmentShaderString]))
    {
		return nil;
    }
    
    crossHatchSpacingUniform = [filterProgram uniformIndex:@"crossHatchSpacing"];
    lineWidthUniform = [filterProgram uniformIndex:@"lineWidth"];
    
    self.crossHatchSpacing = 0.03;
    self.lineWidth = 0.003;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setCrossHatchSpacing:(CGFloat)newValue;
{
    CGFloat singlePixelSpacing;
    if (inputTextureSize.width != 0.0)
    {
        singlePixelSpacing = 1.0 / inputTextureSize.width;
    }
    else
    {
        singlePixelSpacing = 1.0 / 2048.0;
    }
    
    if (newValue < singlePixelSpacing)
    {
        _crossHatchSpacing = singlePixelSpacing;
    }
    else
    {
        _crossHatchSpacing = newValue;
    }
    
    [self setFloat:_crossHatchSpacing forUniform:crossHatchSpacingUniform program:filterProgram];
}

- (void)setLineWidth:(CGFloat)newValue;
{
    _lineWidth = newValue;
    
    [self setFloat:_lineWidth forUniform:lineWidthUniform program:filterProgram];
}

@end
*/