// http://www.cocos2d-iphone.org

attribute vec4 a_position;								
attribute vec2 a_texCoord;								
														
#ifdef GL_ES											
varying mediump vec2 v_texCoord;
varying mediump vec2 leftTextureCoordinate;
varying mediump vec2 rightTextureCoordinate;

varying mediump vec2 topTextureCoordinate;
varying mediump vec2 topLeftTextureCoordinate;
varying mediump vec2 topRightTextureCoordinate;

varying mediump vec2 bottomTextureCoordinate;
varying mediump vec2 bottomLeftTextureCoordinate;
varying mediump vec2 bottomRightTextureCoordinate;
#else													
varying vec2 v_texCoord;

varying vec2 leftTextureCoordinate;
varying vec2 rightTextureCoordinate;

varying vec2 topTextureCoordinate;
varying vec2 topLeftTextureCoordinate;
varying vec2 topRightTextureCoordinate;

varying vec2 bottomTextureCoordinate;
varying vec2 bottomLeftTextureCoordinate;
varying vec2 bottomRightTextureCoordinate;
#endif
														
void main()												
{														
    gl_Position = CC_MVPMatrix * a_position;			
	v_texCoord = a_texCoord;
    
    const float texelWidth = 0.0015;
    const float texelHeight = 0.0015;
    vec2 widthStep = vec2(texelWidth, 0.0);
    vec2 heightStep = vec2(0.0, texelHeight);
    vec2 widthHeightStep = vec2(texelWidth, texelHeight);
    vec2 widthNegativeHeightStep = vec2(texelWidth, -texelHeight);
    
    leftTextureCoordinate = v_texCoord - widthStep;
    rightTextureCoordinate = v_texCoord + widthStep;
    
    topTextureCoordinate = v_texCoord - heightStep;
    topLeftTextureCoordinate = v_texCoord - widthHeightStep;
    topRightTextureCoordinate = v_texCoord + widthNegativeHeightStep;
    
    bottomTextureCoordinate = v_texCoord + heightStep;
    bottomLeftTextureCoordinate = v_texCoord - widthNegativeHeightStep;
    bottomRightTextureCoordinate = v_texCoord + widthHeightStep;
}