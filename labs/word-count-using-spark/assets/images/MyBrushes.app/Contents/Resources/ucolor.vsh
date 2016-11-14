// http://www.cocos2d-iphone.org

attribute vec4 a_position;
attribute vec2 a_texCoord;

#ifdef GL_ES
varying mediump vec2 v_texCoord;
varying mediump vec4 v_fragmentColor;

#else
varying vec2 v_texCoord;
varying vec4 v_fragmentColor;


#endif

uniform	vec4 u_color;
uniform float u_pointSize;

void main()
{
    gl_Position = CC_MVPMatrix * a_position;
    
    gl_PointSize = u_pointSize;
    v_texCoord = a_texCoord;
    v_fragmentColor = u_color;
    
    
}



