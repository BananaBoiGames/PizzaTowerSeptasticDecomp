function state_boss_stun()
{
    switch (hp)
    {
        case -1:
            grav = 1.1;
            break;
        
        case -2:
            grav = 1.3;
            break;
    }
    
    stunned -= 1;
    
    if (stuntouchbuffer > 0)
        stuntouchbuffer--;
    
    sprite_index = stunfallspr;
    image_speed = 0.35;
    
    if ((grounded || (grounded && !place_meeting(x, y, obj_platform))) && vsp > 0)
    {
        if (thrown == 1 && hp <= 0 && destroyable)
            instance_destroy();
        
        grav = 0.5;
        hsp = 0;
    }
    
    if (place_meeting(x, y + 1, obj_railh))
        hsp = -5;
    else if (place_meeting(x, y + 1, obj_railh2))
        hsp = 5;
    
    if (place_meeting(x - image_xscale, y, obj_solid) && !place_meeting(x - image_xscale, y, obj_destructibles))
    {
        particle_set_scale(UnknownEnum.Value_8, -image_xscale, 1);
        create_particle(x, y, UnknownEnum.Value_8, 0);
        
        if (thrown == 1 && hp <= 0 && destroyable)
            instance_destroy();
        
        grav = 0.5;
    }
    
    if (stunned <= 0)
    {
        if (object_index != obj_miniufo && object_index != obj_ancho && object_index != obj_pizzaboy)
            vsp = -4;
        else
            vsp = 0;
        
        image_index = 0;
        sprite_index = walkspr;
        state = UnknownEnum.Value_134;
    }
}
