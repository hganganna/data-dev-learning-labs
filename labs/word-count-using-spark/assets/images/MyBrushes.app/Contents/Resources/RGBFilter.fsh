
 varying vec2 v_texCoord;
 
 uniform sampler2D CC_Texture0;
 uniform float red;
 uniform float green;
 uniform float blue;
  uniform float opacity;
 
 void main()
 {
     vec4 textureColor = texture2D(CC_Texture0, v_texCoord);
     
     gl_FragColor = vec4(textureColor.r * red, textureColor.g * green, textureColor.b * blue, textureColor.a) * opacity;
 }

/*

@implementation GPUImageRGBFilter

@synthesize red = _red, blue = _blue, green = _green;

#pragma mark -
#pragma mark Initialization and teardown

- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageRGBFragmentShaderString]))
    {
		return nil;
    }
    
    redUniform = [filterProgram uniformIndex:@"red"];
    self.red = 1.0;
    
    greenUniform = [filterProgram uniformIndex:@"green"];
    self.green = 1.0;
    
    blueUniform = [filterProgram uniformIndex:@"blue"];
    self.blue = 1.0;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setRed:(CGFloat)newValue;
{
    _red = newValue;
    
    [self setFloat:_red forUniform:redUniform program:filterProgram];
}

- (void)setGreen:(CGFloat)newValue;
{
    _green = newValue;

    [self setFloat:_green forUniform:greenUniform program:filterProgram];
}

- (void)setBlue:(CGFloat)newValue;
{
    _blue = newValue;

    [self setFloat:_blue forUniform:blueUniform program:filterProgram];
}

@end */