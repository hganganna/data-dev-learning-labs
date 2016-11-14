// http://www.cocos2d-iphone.org

#ifdef GL_ES
precision lowp float;
#endif

varying vec2 v_texCoord;
uniform sampler2D CC_Texture0;
uniform		vec4 u_color;

varying vec2 leftTextureCoordinate;
varying vec2 rightTextureCoordinate;

varying vec2 topTextureCoordinate;
varying vec2 topLeftTextureCoordinate;
varying vec2 topRightTextureCoordinate;

varying vec2 bottomTextureCoordinate;
varying vec2 bottomLeftTextureCoordinate;
varying vec2 bottomRightTextureCoordinate;

vec4 colors[10];

void main(void)
{
	colors[0] = vec4(1,0,0,1);
	colors[1] = vec4(0,1,0,1);
	colors[2] = vec4(0,0,1,1);
	colors[3] = vec4(0,1,1,1);
	colors[4] = vec4(1,0,1,1);
	colors[5] = vec4(1,1,0,1);
	colors[6] = vec4(1,1,1,1);
	colors[7] = vec4(1,0.5,0,1);
	colors[8] = vec4(1,0.5,0.5,1);
	colors[9] = vec4(0.5,0.5,1,1);
	
	// inline to prevent "float" loss and keep using lowp
	//int y = int( mod(gl_FragCoord.y / 3.0, 10.0 ) );
    //vec4 FragColor = colors[y];// * texture2D(CC_Texture0, v_texCoord);
    //gl_FragColor = vec4(FragColor.x, FragColor.y, FragColor.z, texture2D(CC_Texture0, v_texCoord).a);
	
    //gl_FragColor = colors[y];
    //float fColor = mod(gl_FragCoord.y, 200.0) / 200.0;
    
   // gl_FragColor = vec4(1.0 - fColor, 0.0, 0.0, fColor);
    

        float bottomLeftIntensity = texture2D(CC_Texture0, bottomLeftTextureCoordinate).r;
        float topRightIntensity = texture2D(CC_Texture0, topRightTextureCoordinate).r;
        float topLeftIntensity = texture2D(CC_Texture0, topLeftTextureCoordinate).r;
        float bottomRightIntensity = texture2D(CC_Texture0, bottomRightTextureCoordinate).r;
        float leftIntensity = texture2D(CC_Texture0, leftTextureCoordinate).r;
        float rightIntensity = texture2D(CC_Texture0, rightTextureCoordinate).r;
        float bottomIntensity = texture2D(CC_Texture0, bottomTextureCoordinate).r;
        float topIntensity = texture2D(CC_Texture0, topTextureCoordinate).r;
        float h = -topLeftIntensity - 2.0 * topIntensity - topRightIntensity + bottomLeftIntensity + 2.0 * bottomIntensity + bottomRightIntensity;
        float v = -bottomLeftIntensity - 2.0 * leftIntensity - topLeftIntensity + bottomRightIntensity + 2.0 * rightIntensity + topRightIntensity;
        
        float mag = 1.0 - length(vec2(h, v));
        
    gl_FragColor = vec4(vec3(mag), 1.0);//texture2D(CC_Texture0, ) *

}