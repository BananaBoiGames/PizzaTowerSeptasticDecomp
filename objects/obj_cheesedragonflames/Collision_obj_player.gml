var b;

with (other)
{
    b = 1;
    
    for (i = 0; i < array_length(transformation); i += 1)
    {
        if (state == transformation[i])
            b = 0;
    }
    
    if (b == 1)
    {
        state = UnknownEnum.Value_9;
        image_index = 0;
        vsp = -25;
        sprite_index = spr_fireass;
        scr_soundeffect(84);
    }
}
