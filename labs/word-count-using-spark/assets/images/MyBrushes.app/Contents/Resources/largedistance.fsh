// http://www.cocos2d-iphone.org

#ifdef GL_ES
precision lowp float;
#endif

varying vec2 v_texCoord;
uniform sampler2D CC_Texture0;
uniform		vec4 u_color;

varying vec2 v_texCorrdYRang[9];
varying vec2 v_texCorrdYRang2[9];

void main()
{
   vec4 sum = vec4(0.0);
    vec4 sum2 = vec4(0.0);
         
    sum += (texture2D(CC_Texture0, v_texCorrdYRang[0]) - texture2D(CC_Texture0, v_texCorrdYRang[8])) * 0.05;
    sum += (texture2D(CC_Texture0, v_texCorrdYRang[1]) - texture2D(CC_Texture0, v_texCorrdYRang[7])) * 0.09;
    sum += (texture2D(CC_Texture0, v_texCorrdYRang[2]) - texture2D(CC_Texture0, v_texCorrdYRang[6])) * 0.12;
    sum += (texture2D(CC_Texture0, v_texCorrdYRang[3]) - texture2D(CC_Texture0, v_texCorrdYRang[5])) * 0.15;
    
    sum2 += (texture2D(CC_Texture0, v_texCorrdYRang2[0]) - texture2D(CC_Texture0, v_texCorrdYRang2[8])) * 0.05;
    sum2 += (texture2D(CC_Texture0, v_texCorrdYRang2[1]) - texture2D(CC_Texture0, v_texCorrdYRang2[7])) * 0.09;
    sum2 += (texture2D(CC_Texture0, v_texCorrdYRang2[2]) - texture2D(CC_Texture0, v_texCorrdYRang2[6])) * 0.12;
    sum2 += (texture2D(CC_Texture0, v_texCorrdYRang2[3]) - texture2D(CC_Texture0, v_texCorrdYRang2[5])) * 0.15;
    
    gl_FragColor = vec4(sum.rgb*4.5 + sum2.rgb * 5.5 + texture2D(CC_Texture0, v_texCoord).rgb, texture2D(CC_Texture0, v_texCoord).a);//sum*2.5 + texture2D(CC_Texture0, v_texCoord);  //vec4(sum.rgb+centerColor.rgb, centerColor.a);
    
}
