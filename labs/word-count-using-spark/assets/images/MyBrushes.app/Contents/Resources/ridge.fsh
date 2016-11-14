
 varying vec2 v_texCoord;
 
 uniform sampler2D CC_Texture0;
 uniform float cordstepx;
 uniform float coordstepy;
 uniform float fAlpha;
 uniform float opacity;

 void main()
 {
     vec4 textureColor = texture2D(CC_Texture0, v_texCoord);
     

     if(textureColor.a <= fAlpha)
     {
         vec4 textureColorleft      = texture2D(CC_Texture0, v_texCoord + vec2(-cordstepx, 0));
         vec4 textureColorright     = texture2D(CC_Texture0, v_texCoord + vec2(cordstepx, 0));
         vec4 textureColortop       = texture2D(CC_Texture0, v_texCoord + vec2(0, -coordstepy));
         vec4 textureColorbottom    = texture2D(CC_Texture0, v_texCoord + vec2(0, coordstepy));
         
         if(textureColorleft.a > fAlpha || textureColorright.a > fAlpha || textureColortop.a > fAlpha || textureColorbottom.a > fAlpha)
         {
             if(mod(v_texCoord.x/cordstepx + v_texCoord.y/coordstepy + CC_Random01.z, 10.0) >  5.0 )
                 gl_FragColor = vec4(vec3(0.0), 0.5);
             else
                 gl_FragColor = vec4(1.0,0.5,0.0, 0.5);
        }
         else gl_FragColor = vec4(1.0)*(1.0-textureColor.a)*0.5*opacity;//textureColor * opacity;
         
     }
     else
     {
        gl_FragColor = vec4(1.0)*(1.0-textureColor.a)*0.5*opacity;//textureColor * opacity;
     }
   
   
 }

