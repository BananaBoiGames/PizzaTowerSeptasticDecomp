if (vsp < 20)
    vsp += grav;

if (buffer > 0)
    buffer--;

if (spinspeed > 0)
    angle += spinspeed;

if (place_meeting(x + floor(hsp), y, obj_null))
{
    x = floor(x);
    
    while (!place_meeting(x + sign(hsp), y, obj_null))
        x += sign(hsp);
    
    hsp = 0;
}

x += hsp;

if (place_meeting(x, y + floor(vsp), obj_null))
{
    y = floor(y);
    
    while (!place_meeting(x, y + sign(vsp), obj_null))
        y += sign(vsp);
    
    vsp = 0;
}

y += floor(vsp);
