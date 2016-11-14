// http://www.cocos2d-iphone.org
//一个光源：右下角
#ifdef GL_ES
precision lowp float;
#endif

varying vec2 v_texCoord;
uniform sampler2D CC_Texture0;
uniform		vec4 u_color;

varying vec2 v_texCorrdYRang[9];

void main()
{
    vec4 textureColor = texture2D(CC_Texture0, v_texCoord);
    
    gl_FragColor = vec4(u_color.rgb, texture2D(CC_Texture0, v_texCorrdYRang[1*3+1]).a);
}
