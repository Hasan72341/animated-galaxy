uniform float uSize;

attribute float aScale;
uniform float uTime;

attribute vec3 color;
varying vec3 vColor;


void main(){

    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    float time = uTime * 0.2;
    float angle = mod(time * time, 6.28318530718);
    //updated coordinate
    float x = modelPosition.x;
    float z = modelPosition.z;
    float distanceToCenter = distance(vec2(0.0), vec2(x, z));
    float angleOffset = 2.0/distanceToCenter;
    angleOffset += (1.0/distanceToCenter) * 0.5 * uTime;

    float xDev = x * cos(angle + angleOffset) - z * sin(angle + angleOffset);
    float zDev = x * sin(angle + angleOffset) + z * cos(angle + angleOffset);




    modelPosition.x = xDev;
    modelPosition.z = zDev;


    vec4 modelView =  viewMatrix * modelPosition;
    vec4  projection =  projectionMatrix * modelView  ;
    gl_Position = projection;

    gl_PointSize = uSize * aScale;
    gl_PointSize *= (-1.0/modelView.z);
    vColor = color;
}