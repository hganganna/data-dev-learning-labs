
 varying vec2 v_texCoord;
 
 uniform sampler2D CC_Texture0;
 
 uniform float fractionalWidthOfPixel;
 uniform float aspectRatio;
 uniform float dotScaling;
  uniform float opacity;
 
 const vec3 W = vec3(0.2125, 0.7154, 0.0721);
 
 void main()
 {
     vec2 sampleDivisor = vec2(fractionalWidthOfPixel, fractionalWidthOfPixel / aspectRatio);
     
     vec2 samplePos = v_texCoord - mod(v_texCoord, sampleDivisor) + 0.5 * sampleDivisor;
     vec2 textureCoordinateToUse = vec2(v_texCoord.x, (v_texCoord.y * aspectRatio + 0.5 - 0.5 * aspectRatio));
     vec2 adjustedSamplePos = vec2(samplePos.x, (samplePos.y * aspectRatio + 0.5 - 0.5 * aspectRatio));
     float distanceFromSamplePoint = distance(adjustedSamplePos, textureCoordinateToUse);
     
     vec3 sampledColor = texture2D(CC_Texture0, samplePos ).rgb;
     float dotScaling = 1.0 - dot(sampledColor, W);
     
     float checkForPresenceWithinDot = 1.0 - step(distanceFromSamplePoint, (fractionalWidthOfPixel * 0.5) * dotScaling);
     
     gl_FragColor = vec4(vec3(checkForPresenceWithinDot), 1.0) * opacity;
 }

/*

@implementation GPUImageHalftoneFilter

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageHalftoneFragmentShaderString]))
    {
		return nil;
    }
    
    self.fractionalWidthOfAPixel = 0.01;
    
    return self;
}

@end
 */
