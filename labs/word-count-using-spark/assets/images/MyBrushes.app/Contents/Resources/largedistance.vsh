// http://www.cocos2d-iphone.org

attribute vec4 a_position;								
attribute vec2 a_texCoord;								
														
#ifdef GL_ES											
varying mediump vec2 v_texCoord;
varying mediump vec2 v_texCorrdYRang[9];
varying mediump vec2 v_texCorrdYRang2[9];
#else													
varying vec2 v_texCoord;
varying vec2 v_texCorrdYRang[9];
varying vec2 v_texCorrdYRang2[9];
#endif
														
void main()												
{														
    gl_Position = CC_MVPMatrix * a_position;			
	v_texCoord = a_texCoord;
    
    const float texelHeight = 0.0010;
    vec2 heightStep = vec2(0.0, texelHeight);

    v_texCorrdYRang[0] = v_texCoord - 4.0 * heightStep;
    v_texCorrdYRang[8] = v_texCoord + 4.0 * heightStep;

    v_texCorrdYRang[1] = v_texCoord - 3.0 * heightStep;
    v_texCorrdYRang[7] = v_texCoord + 3.0 * heightStep;

    v_texCorrdYRang[2] = v_texCoord - 2.0 * heightStep;
    v_texCorrdYRang[6] = v_texCoord + 2.0 * heightStep;

    v_texCorrdYRang[3] = v_texCoord - heightStep;
    v_texCorrdYRang[5] = v_texCoord + heightStep;
    v_texCorrdYRang[4] = v_texCoord;
    
    heightStep = vec2(-texelHeight/2.0, -texelHeight/2.0);
    
    v_texCorrdYRang2[0] = v_texCoord - 4.0 * heightStep;
    v_texCorrdYRang2[8] = v_texCoord + 4.0 * heightStep;
    
    v_texCorrdYRang2[1] = v_texCoord - 3.0 * heightStep;
    v_texCorrdYRang2[7] = v_texCoord + 3.0 * heightStep;
    
    v_texCorrdYRang2[2] = v_texCoord - 2.0 * heightStep;
    v_texCorrdYRang2[6] = v_texCoord + 2.0 * heightStep;
    
    v_texCorrdYRang2[3] = v_texCoord - heightStep;
    v_texCorrdYRang2[5] = v_texCoord + heightStep;
    v_texCorrdYRang2[4] = v_texCoord;
}