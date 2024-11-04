function scr_player_trickjump()
{
    hsp = movespeed * xscale;
    
    if (sprite_index != spr_supertaunt1 && sprite_index != spr_supertaunt2 && sprite_index != spr_supertaunt3 && sprite_index != spr_supertaunt4)
    {
        image_speed = 0.35;
        
        if (key_taunt2 && ramp)
        {
            sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4);
            image_index = 0;
            ramp_points++;
        }
    }
    else
    {
        image_speed = 0.5;
        
        if (floor(image_index) == (image_number - 1))
            sprite_index = spr_mach2jump;
    }
    
    if (ramp_buffer > 0)
        ramp_buffer--;
    
    if (grounded && ramp_buffer <= 0)
    {
        if (sprite_index == spr_mach2jump)
        {
            if (movespeed < 12)
                state = UnknownEnum.Value_104;
            else
                state = UnknownEnum.Value_121;
        }
        else
        {
            ramp_points = 0;
            scr_soundeffect(55);
            state = UnknownEnum.Value_111;
            sprite_index = spr_bodyslamland;
            image_index = 0;
        }
        
        global.collect += (ramp_points * 100);
        ramp = 0;
    }
}
