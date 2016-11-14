
 varying vec2 v_texCoord;
 
 uniform sampler2D CC_Texture0;
 
 uniform float fractionalWidthOfPixel;
 uniform float aspectRatio;
 uniform float dotScaling;
  uniform float opacity;
 
 void main()
 {
     vec2 sampleDivisor = vec2(fractionalWidthOfPixel, fractionalWidthOfPixel / aspectRatio);
     
     vec2 samplePos = v_texCoord - mod(v_texCoord, sampleDivisor) + 0.5 * sampleDivisor;
     vec2 textureCoordinateToUse = vec2(v_texCoord.x, (v_texCoord.y * aspectRatio + 0.5 - 0.5 * aspectRatio));
     vec2 adjustedSamplePos = vec2(samplePos.x, (samplePos.y * aspectRatio + 0.5 - 0.5 * aspectRatio));
     float distanceFromSamplePoint = distance(adjustedSamplePos, textureCoordinateToUse);
     float checkForPresenceWithinDot = step(distanceFromSamplePoint, (fractionalWidthOfPixel * 0.5) * dotScaling);
     
     //gl_FragColor = vec4(texture2D(CC_Texture0, samplePos ).rgb * checkForPresenceWithinDot, 1.0);
     gl_FragColor = vec4(texture2D(CC_Texture0, samplePos ).rgb * checkForPresenceWithinDot, texture2D(CC_Texture0, samplePos).a) * opacity;
 }
/*

@implementation GPUImagePolkaDotFilter

@synthesize dotScaling = _dotScaling;

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImagePolkaDotFragmentShaderString]))
    {
		return nil;
    }
    
    dotScalingUniform = [filterProgram uniformIndex:@"dotScaling"];
    
    self.dotScaling = 0.90;

    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setDotScaling:(CGFloat)newValue;
{
    _dotScaling = newValue;
    
    [self setFloat:_dotScaling forUniform:dotScalingUniform program:filterProgram];
}

@end
*/