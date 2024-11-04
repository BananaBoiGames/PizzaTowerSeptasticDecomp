function scr_player_grabbing()
{
    var attackdash, airattackdash, airattackdashstart;
    
    landAnim = 0;
    hsp = xscale * movespeed;
    move = key_left + key_right;
    momemtum = 1;
    dir = xscale;
    
    if (sprite_index != spr_player_Sjump)
    {
        if (movespeed < 12 && grounded)
            movespeed += 1;
        else if (!grounded)
            movespeed = 12;
    }
    
    attackdash = 709;
    airattackdash = 925;
    airattackdashstart = 927;
    
    if (sprite_index == attackdash && !grounded)
    {
        image_index = 0;
        sprite_index = airattackdashstart;
    }
    
    if (grounded && key_slap2)
    {
        suplexdashsnd = audio_play_sound(sfx_suplexdash, 1, false);
        sfx_gain(suplexdashsnd);
        state = UnknownEnum.Value_55;
        image_index = 0;
        vsp = 0;
        sprite_index = spr_player_suplexdash;
        movespeed = 8;
        
        with (instance_create(x, y, obj_superdashcloud))
            image_xscale = other.xscale;
        
        particle_set_scale(UnknownEnum.Value_2, xscale, 1);
        create_particle(x, y, UnknownEnum.Value_2, 0);
    }
    
    if (sprite_index == airattackdash && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_fall;
        state = UnknownEnum.Value_92;
    }
    
    if (floor(image_index) == (image_number - 1) && (sprite_index == attackdash || sprite_index == spr_player_Sjump))
        state = UnknownEnum.Value_0;
    
    if (floor(image_index) == (image_number - 1) && sprite_index == airattackdashstart)
        sprite_index = airattackdash;
    
    grav = 0;
    
    if (scr_solid(x + 1, y) && xscale == 1 && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
    {
        scr_soundeffect(56);
        grav = 0.5;
        movespeed = 0;
        state = UnknownEnum.Value_106;
        hsp = -2.5;
        vsp = -3;
        mach2 = 0;
        image_index = 0;
        machslideAnim = 1;
        machhitAnim = 0;
        instance_create(x + 10, y + 10, obj_bumpeffect);
    }
    
    if (scr_solid(x - 1, y) && xscale == -1 && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
    {
        scr_soundeffect(56);
        grav = 0.5;
        movespeed = 0;
        state = UnknownEnum.Value_106;
        hsp = 2.5;
        vsp = -3;
        mach2 = 0;
        image_index = 0;
        machslideAnim = 1;
        machhitAnim = 0;
        instance_create(x - 10, y + 10, obj_bumpeffect);
    }
    
    if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale;
    }
    
    if (character == "S")
    {
        if (key_attack)
        {
            hsp = 0;
            
            if (movespeed < 20)
                movespeed += 0.5;
            
            if (movespeed == 20)
                sprite_index = spr_snick_superpeelout;
            else if (movespeed < 20 && movespeed > 12)
                sprite_index = spr_snick_mach3;
            else if (movespeed < 12 && movespeed > 8)
                sprite_index = spr_snick_mach2;
            else
                sprite_index = spr_snick_walk;
        }
        else if (movespeed >= 12)
        {
            state = UnknownEnum.Value_121;
        }
        else
        {
            state = UnknownEnum.Value_0;
            movespeed = 0;
        }
        
        if (!instance_exists(obj_dashcloud2) && grounded && movespeed > 5)
        {
            with (instance_create(x, y, obj_dashcloud2))
                image_xscale = other.xscale;
        }
    }
    
    image_speed = 0.35;
    
    if (move != xscale && move != 0)
    {
        image_index = 0;
        
        if (!grounded)
        {
            sprite_index = spr_player_suplexcancel;
            grav = 0.5;
            state = UnknownEnum.Value_92;
        }
        else
        {
            state = UnknownEnum.Value_0;
            grav = 0.5;
        }
    }
}
