
varying vec2 v_texCoord;

uniform sampler2D CC_Texture0;

uniform float aspectRatio;
//uniform vec2 center;
uniform float radius;
uniform float scale;
uniform float opacity;

void main()
{
    vec2 center = vec2(0.5, 0.5);
    vec2 textureCoordinateToUse = vec2(v_texCoord.x, (v_texCoord.y * aspectRatio + 0.5 - 0.5 * aspectRatio));
    float dist = distance(center, textureCoordinateToUse);
    textureCoordinateToUse = v_texCoord;

    
    if (dist < radius)
    {
        textureCoordinateToUse -= center;
        float percent = 1.0 - ((radius - dist) / radius) * scale;
        percent = percent * percent;
        
        textureCoordinateToUse = textureCoordinateToUse * percent;
        textureCoordinateToUse += center;
    }
    
    gl_FragColor = texture2D(CC_Texture0, textureCoordinateToUse ) * opacity;
}