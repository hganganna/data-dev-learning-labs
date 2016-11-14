
 varying vec2 v_texCoord;
 
 uniform sampler2D CC_Texture0;
 
 uniform float distance;
 uniform float slope;
  uniform float opacity;
 
 void main()
 {
     //todo reconsider precision modifiers
	 vec4 color = vec4(1.0);//todo reimplement as a parameter
	 
	 float  d = v_texCoord.y * slope  +  distance;
     
     d=clamp(d,0.0,1.0);
	 
	 vec4 c = texture2D(CC_Texture0, v_texCoord) ; // consider using unpremultiply
	 
	 c.rgb = (c.rgb - d * vec3(1.0)*c.a) / (1.0 -d);
     
     c.rgb = clamp(c.rgb,vec3(0.0),vec3(1.0));
	 
	 gl_FragColor = c * opacity;
	 
//     c = (c - d * color) / (1.0 -d);
//	 
//	 gl_FragColor = c; //consider using premultiply(c);
 }

/*


@implementation GPUImageHazeFilter

@synthesize distance = _distance;
@synthesize slope = _slope;
#pragma mark -
#pragma mark Initialization and teardown

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageHazeFragmentShaderString]))
    {
		return nil;
    }
    
    distanceUniform = [filterProgram uniformIndex:@"distance"];
	slopeUniform = [filterProgram uniformIndex:@"slope"];
	
    self.distance = 0.2;
    self.slope = 0.0;
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setDistance:(CGFloat)newValue;
{
    _distance = newValue;
    
    [self setFloat:_distance forUniform:distanceUniform program:filterProgram];
}

- (void)setSlope:(CGFloat)newValue;
{
    _slope = newValue;
    
    [self setFloat:_slope forUniform:slopeUniform program:filterProgram];
}

@end

*/