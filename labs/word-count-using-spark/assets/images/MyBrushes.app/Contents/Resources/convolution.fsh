// http://www.cocos2d-iphone.org

#ifdef GL_ES
precision lowp float;
#endif

varying vec2 v_texCoord;
uniform sampler2D CC_Texture0;
uniform		vec4 u_color;

uniform mat4 convolutionMatrix;

//varying vec2 v_texCoord;
varying vec2 leftTextureCoordinate;
varying vec2 rightTextureCoordinate;

varying vec2 topTextureCoordinate;
varying vec2 topLeftTextureCoordinate;
varying vec2 topRightTextureCoordinate;

varying vec2 bottomTextureCoordinate;
varying vec2 bottomLeftTextureCoordinate;
varying vec2 bottomRightTextureCoordinate;

void main()
{
    vec4 bottomColor = texture2D(CC_Texture0, bottomTextureCoordinate);//.rgb;
    vec4 bottomLeftColor = texture2D(CC_Texture0, bottomLeftTextureCoordinate);//.rgb;
    vec4 bottomRightColor = texture2D(CC_Texture0, bottomRightTextureCoordinate);//.rgb;
    vec4 centerColor = texture2D(CC_Texture0, v_texCoord);
    vec4 leftColor = texture2D(CC_Texture0, leftTextureCoordinate);//.rgb;
    vec4 rightColor = texture2D(CC_Texture0, rightTextureCoordinate);//.rgb;
    vec4 topColor = texture2D(CC_Texture0, topTextureCoordinate);//.rgb;
    vec4 topRightColor = texture2D(CC_Texture0, topRightTextureCoordinate);//.rgb;
    vec4 topLeftColor = texture2D(CC_Texture0, topLeftTextureCoordinate);//.rgb;
    
    vec4 resultColor = topLeftColor * convolutionMatrix[0][0] + topColor * convolutionMatrix[0][1] + topRightColor * convolutionMatrix[0][2];
    resultColor += leftColor * convolutionMatrix[1][0] + centerColor * convolutionMatrix[1][1] + rightColor * convolutionMatrix[1][2];
    resultColor += bottomLeftColor * convolutionMatrix[2][0] + bottomColor * convolutionMatrix[2][1] + bottomRightColor * convolutionMatrix[2][2];
    
     gl_FragColor = vec4(resultColor.rgb, centerColor.a);
//    gl_FragColor = vec4(resultColor.rgb+centerColor.rgb, centerColor.a);
}
