varying vec3 vColor;


void main()
{   

    // Soft circular point sprite falloff
    float d = distance(gl_PointCoord, vec2(0.5));
    float alpha = smoothstep(0.5, 0.45, d);

    gl_FragColor = vec4(vColor, alpha);

}