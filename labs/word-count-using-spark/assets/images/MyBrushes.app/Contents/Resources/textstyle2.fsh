// http://www.cocos2d-iphone.org

#ifdef GL_ES
precision lowp float;
#endif

varying vec2 v_texCoord;
uniform sampler2D CC_Texture0;
uniform		vec4 u_color;

varying vec2 v_texCorrdYRang[9];

void main()
{
    vec3 sum = vec3(0.0);
    float fValue = 1.0;
    float fTemp;
    
    for(int y=-1; y<2; y++)
        for(int x=-1; x<2; x++)
        {
      //      int y=0; int x=-1;
            if(x==0 && y==0)
                fValue = 0.2;
            else fValue = 0.1;
            
            vec2 topleft = v_texCorrdYRang[(y+1)*3+x+1] - vec2(0.00030*8.0, 0.00030*8.0);
            
            fTemp = (texture2D(CC_Texture0, v_texCorrdYRang[(y+1)*3+x+1]).a - texture2D(CC_Texture0, topleft).a);
           // if(fTemp < 0.0)  fTemp = 0.0;
            //fTemp += 1.0*u_color.rgb;
            
            sum += vec3(fValue*fTemp) + fValue*u_color.rgb;
        }
    
   // sum = sum/12.0;
    
    gl_FragColor = vec4(sum  , texture2D(CC_Texture0, v_texCorrdYRang[1*3+1]).a);//+ 1.0*u_color.rgb
}
