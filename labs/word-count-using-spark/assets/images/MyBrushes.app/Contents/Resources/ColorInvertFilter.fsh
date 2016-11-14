
 varying vec2 v_texCoord;
 
 uniform sampler2D CC_Texture0;
  uniform float opacity;
 
 void main()
 {
     vec4 textureColor = texture2D(CC_Texture0, v_texCoord);
     
     
     if (textureColor.a < 0.001)
     {
         gl_FragColor = vec4(0.0);
     }
     else
     {
/*         float fAlpha = textureColor.a;
         float fRed = (1.0-textureColor.r/fAlpha)*fAlpha;
         float fGreen = (1.0-textureColor.g/fAlpha)*fAlpha;
         float fBlue = (1.0- textureColor.b/fAlpha)*fAlpha;
*/
         gl_FragColor = vec4(textureColor.a - textureColor.rgb, textureColor.a)  * opacity;
     }

     
     
     
     //gl_FragColor = vec4(fRed,fGreen,fBlue, fAlpha);
 }
