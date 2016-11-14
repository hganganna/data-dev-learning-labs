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
   //vec3 sum = vec3(0.0);
    //vec3 sum2 = vec3(0.0);
    float sum =0.0;
    float sum2 = 0.0;
    
    sum += (texture2D(CC_Texture0, v_texCorrdYRang[0]).a - texture2D(CC_Texture0, v_texCorrdYRang[8]).a) * 0.00;
    sum += (texture2D(CC_Texture0, v_texCorrdYRang[1]).a - texture2D(CC_Texture0, v_texCorrdYRang[7]).a) * 0.10;
    sum += (texture2D(CC_Texture0, v_texCorrdYRang[2]).a - texture2D(CC_Texture0, v_texCorrdYRang[6]).a) * 0.210;
    sum += (texture2D(CC_Texture0, v_texCorrdYRang[3]).a - texture2D(CC_Texture0, v_texCorrdYRang[5]).a) * 0.35;
    
    //  if(sum < 0.0) sum = 0.0;
    sum2 += (texture2D(CC_Texture0, v_texCorrdYRang2[0]).a - texture2D(CC_Texture0, v_texCorrdYRang2[8]).a) * 0.00;
    sum2 += (texture2D(CC_Texture0, v_texCorrdYRang2[1]).a - texture2D(CC_Texture0, v_texCorrdYRang2[7]).a) * 0.00;
    sum2 += (texture2D(CC_Texture0, v_texCorrdYRang2[2]).a - texture2D(CC_Texture0, v_texCorrdYRang2[6]).a) * 0.00;
    sum2 += (texture2D(CC_Texture0, v_texCorrdYRang2[4]).a - texture2D(CC_Texture0, v_texCorrdYRang2[5]).a) * 0.35;
/*    sum += (texture2D(CC_Texture0, v_texCorrdYRang[0]).a - texture2D(CC_Texture0, v_texCorrdYRang[8]).a) * 0.05;
    sum += (texture2D(CC_Texture0, v_texCorrdYRang[1]).a - texture2D(CC_Texture0, v_texCorrdYRang[7]).a) * 0.09;
    sum += (texture2D(CC_Texture0, v_texCorrdYRang[2]).a - texture2D(CC_Texture0, v_texCorrdYRang[6]).a) * 0.12;
    sum += (texture2D(CC_Texture0, v_texCorrdYRang[3]).a - texture2D(CC_Texture0, v_texCorrdYRang[5]).a) * 0.15;
    
  //  if(sum < 0.0) sum = 0.0;
    sum2 += (texture2D(CC_Texture0, v_texCorrdYRang2[0]).a - texture2D(CC_Texture0, v_texCorrdYRang2[8]).a) * 0.05;
    sum2 += (texture2D(CC_Texture0, v_texCorrdYRang2[1]).a - texture2D(CC_Texture0, v_texCorrdYRang2[7]).a) * 0.09;
    sum2 += (texture2D(CC_Texture0, v_texCorrdYRang2[2]).a - texture2D(CC_Texture0, v_texCorrdYRang2[6]).a) * 0.12;
    sum2 += (texture2D(CC_Texture0, v_texCorrdYRang2[3]).a - texture2D(CC_Texture0, v_texCorrdYRang2[5]).a) * 0.15;
*/    
//    if(sum2 < -0.1) sum2 = -0.1;
    gl_FragColor = vec4(vec3(sum*0.0) + vec3(sum2 * 1.0)+ 1.0*u_color.rgb , texture2D(CC_Texture0, v_texCorrdYRang2[4]).a); // //sum*2.5 + texture2D(CC_Texture0, v_texCoord);  //vec4(sum.rgb+centerColor.rgb, centerColor.a);
    //gl_FragColor = vec4(u_color.rgb, texture2D(CC_Texture0, v_texCoord).a);
}
