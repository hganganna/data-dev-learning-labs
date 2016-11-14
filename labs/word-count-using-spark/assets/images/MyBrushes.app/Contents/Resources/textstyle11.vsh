// http://www.cocos2d-iphone.org

attribute vec4 a_position;								
attribute vec2 a_texCoord;								
														
#ifdef GL_ES											
varying mediump vec2 v_texCoord;
varying mediump vec2 v_texCorrdYRang[9];

#else													
varying vec2 v_texCoord;
varying vec2 v_texCorrdYRang[9];


#endif
														
void main()												
{														
    gl_Position = CC_MVPMatrix * a_position;			
	v_texCoord = a_texCoord;
    const float texelHeight = 0.000375*8.0;

    for(int y=0; y<3; y++)
        for(int x=0; x<3; x++)
        {
            v_texCorrdYRang[y*3+x] = v_texCoord - vec2((1.0 - float(x)) *texelHeight*0.5, (1.0 - float(y)) *texelHeight)*0.5;
        }
}