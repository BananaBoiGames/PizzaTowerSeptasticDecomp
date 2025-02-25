function scr_player_punch()
{
    if (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend)
    {
        move = key_left + key_right;
        landAnim = 1;
        jumpstop = 0;
        image_speed = 0.4;
        hsp = movespeed;
        
        if (move != 0)
        {
            dir = move;
            movespeed = Approach(movespeed, move * 4, 0.5);
        }
        
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_breakdanceuppercut)
            sprite_index = spr_breakdanceuppercutend;
        
        if (grounded && vsp > 0 && (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend))
        {
            if (hsp != 0)
            {
                dir = sign(hsp);
                xscale = dir;
            }
            
            movespeed = abs(movespeed);
            state = UnknownEnum.Value_0;
        }
        
        if (punch_afterimage > 0)
        {
            punch_afterimage--;
        }
        else
        {
            punch_afterimage = 5;
            create_mach3effect(x, y, sprite_index, image_index, true);
        }
    }
    else
    {
        switch (character)
        {
            case "P":
            case "N":
                move = key_left + key_right;
                
                if (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend)
                    hsp = move * movespeed;
                else
                    hsp = xscale * movespeed;
                
                if (sprite_index == spr_player_lungehit)
                    movespeed -= 0.25;
                
                if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_lungehit)
                    state = UnknownEnum.Value_0;
                
                jumpstop = 0;
                
                if (sprite_index == spr_player_breakdancesuper && key_slap2)
                    movespeed = 14;
                
                if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdanceuppercut)
                {
                    state = UnknownEnum.Value_92;
                    sprite_index = spr_player_breakdanceuppercutend;
                }
                
                if (grounded && vsp > 0 && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))
                    state = UnknownEnum.Value_92;
                
                if (movespeed > 0 && sprite_index == spr_player_breakdance && grounded)
                    movespeed -= 0.5;
                
                if (movespeed > 0 && sprite_index == spr_player_breakdancesuper)
                    movespeed -= 0.25;
                
                if (place_meeting(x + xscale, y, obj_solid) && (sprite_index == spr_player_breakdancestart || sprite_index == spr_player_breakdance))
                    movespeed = 0;
                
                if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_breakdancestart)
                    sprite_index = spr_player_breakdance;
                
                if (key_slap2 && sprite_index == spr_player_breakdance)
                {
                    sprite_index = spr_player_breakdancesuper;
                    movespeed = 12;
                }
                
                if (sprite_index == spr_player_breakdanceuppercut && floor(image_index) == (image_number - 1))
                    image_index = image_number - 1;
                
                if (breakdance > 0)
                    breakdance--;
                
                landAnim = 1;
                
                if (movespeed <= 0 && (sprite_index == spr_player_breakdancesuper || sprite_index == spr_player_buttattackend))
                    state = UnknownEnum.Value_0;
                
                if (breakdance <= 0 && sprite_index == spr_player_breakdance)
                    state = UnknownEnum.Value_0;
                
                if (place_meeting(x + xscale, y, obj_solid) && sprite_index == spr_player_breakdancesuper && mask_index == spr_crouchmask)
                    xscale *= -1;
                
                if (sprite_index == spr_player_breakdancesuper)
                    image_speed = movespeed / 24;
                else
                    image_speed = 0.4;
                
                if (sprite_index == spr_player_buttattack || sprite_index == spr_player_buttattackstart || sprite_index == spr_player_buttattackend)
                {
                    if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + xscale, y, obj_destructibles))
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
                    
                    if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + xscale, y, obj_destructibles))
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
                }
                
                if (!instance_exists(obj_dashcloud2) && grounded && movespeed > 5)
                {
                    with (instance_create(x, y, obj_dashcloud2))
                        image_xscale = other.xscale;
                }
                
                break;
        }
    }
}
