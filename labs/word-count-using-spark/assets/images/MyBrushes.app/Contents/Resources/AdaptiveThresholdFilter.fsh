
 varying vec2 v_texCoord;
 varying vec2 textureCoordinate2;
 
 uniform sampler2D CC_Texture0;
 uniform sampler2D inputImageTexture2;
 uniform float opacity;
 
 void main()
 {
     float blurredInput = texture2D(CC_Texture0, v_texCoord).r;
     float localLuminance = texture2D(inputImageTexture2, textureCoordinate2).r;
     float thresholdResult = step(blurredInput - 0.05, localLuminance);
     
     gl_FragColor = vec4(vec3(thresholdResult), 1.0) * opacity;
 }

/*
@interface GPUImageAdaptiveThresholdFilter()
{
    GPUImageBoxBlurFilter *boxBlurFilter;
}
@end

@implementation GPUImageAdaptiveThresholdFilter

#pragma mark -
#pragma mark Initialization and teardown

- (id)init;
{
    if (!(self = [super init]))
    {
		return nil;
    }

    // First pass: reduce to luminance
    GPUImageGrayscaleFilter *luminanceFilter = [[GPUImageGrayscaleFilter alloc] init];
    [self addFilter:luminanceFilter];
    
    // Second pass: perform a box blur
    boxBlurFilter = [[GPUImageBoxBlurFilter alloc] init];
    [self addFilter:boxBlurFilter];
    
    // Third pass: compare the blurred background luminance to the local value
    GPUImageFilter *adaptiveThresholdFilter = [[GPUImageTwoInputFilter alloc] initWithFragmentShaderFromString:kGPUImageAdaptiveThresholdFragmentShaderString];
    [self addFilter:adaptiveThresholdFilter];
    
    [luminanceFilter addTarget:boxBlurFilter];
    
    [boxBlurFilter addTarget:adaptiveThresholdFilter];
    // To prevent double updating of this filter, disable updates from the sharp luminance image side
    [luminanceFilter addTarget:adaptiveThresholdFilter];
    
    self.initialFilters = [NSArray arrayWithObject:luminanceFilter];
    self.terminalFilter = adaptiveThresholdFilter;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setBlurSize:(CGFloat)newValue;
{
    boxBlurFilter.blurSize = newValue;
}

- (CGFloat)blurSize;
{
    return boxBlurFilter.blurSize;
}

@end
*/