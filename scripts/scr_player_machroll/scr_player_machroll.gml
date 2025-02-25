function scr_player_machroll()
{
    var _railinst, ty;
    
    if (!place_meeting(x, y + 1, obj_railparent))
    {
        hsp = xscale * movespeed;
    }
    else
    {
        _railinst = instance_place(x, y + 1, obj_railparent);
        hsp = (xscale * movespeed) + (_railinst.movespeed * _railinst.dir);
    }
    
    mach2 = 100;
    machslideAnim = 1;
    move = key_right + key_left;
    
    switch (character)
    {
        case "P":
            if (scr_solid(x + xscale, y) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
            {
                scr_soundeffect(56);
                hsp = 0;
                image_speed = 0.35;
                flash = 0;
                combo = 0;
                state = UnknownEnum.Value_106;
                hsp = -2.5;
                vsp = -3;
                mach2 = 0;
                image_index = 0;
                instance_create(x + 10, y + 10, obj_bumpeffect);
                mask_index = spr_player_mask;
                
                if (scr_solid(x, y))
                {
                    ty = try_solid(0, 1, 811, 32);
                    
                    if (ty != -1)
                        y += ty;
                }
            }
            
            if (!instance_exists(dashcloudid) && grounded)
            {
                with (instance_create(x, y + 43, obj_cloudeffect))
                {
                    image_xscale = other.xscale;
                    other.dashcloudid = id;
                }
            }
            
            if (grounded && sprite_index != spr_playerV_divekickstart)
            {
                sprite_index = !skateboarding ? spr_machroll : spr_clowncrouch;
            }
            else if (sprite_index != spr_dive && !skateboarding)
            {
                sprite_index = spr_dive;
                vsp = 10;
            }
            
            if (scr_slope())
                movespeed += 0.1;
            
            image_speed = 0.8;
            
            if (!key_down && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
            {
                image_index = 0;
                
                if (grounded)
                {
                    scr_soundeffect(118);
                    sprite_index = spr_rollgetup;
                }
                
                if (movespeed < 12 || skateboarding == 1)
                {
                    if (!grounded)
                        sprite_index = spr_mach;
                    
                    state = UnknownEnum.Value_104;
                }
                else
                {
                    if (!grounded)
                        sprite_index = spr_mach4;
                    
                    state = UnknownEnum.Value_121;
                }
            }
            
            if (skateboarding && movespeed < 12)
                movespeed += 0.5;
            
            break;
        
        case "V":
            if (sprite_index == spr_playerV_divekickstart && floor(image_index) == (image_number - 1))
                sprite_index = spr_playerV_divekick;
            
            if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope))
            {
                scr_soundeffect(56);
                hsp = 0;
                image_speed = 0.35;
                flash = 0;
                combo = 0;
                state = UnknownEnum.Value_106;
                hsp = -2.5;
                vsp = -3;
                mach2 = 0;
                image_index = 0;
                instance_create(x + 10, y + 10, obj_bumpeffect);
            }
            
            if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope))
            {
                scr_soundeffect(56);
                hsp = 0;
                image_speed = 0.35;
                flash = 0;
                combo = 0;
                state = UnknownEnum.Value_106;
                hsp = 2.5;
                vsp = -3;
                mach2 = 0;
                image_index = 0;
                instance_create(x - 10, y + 10, obj_bumpeffect);
            }
            
            if (!instance_exists(dashcloudid) && grounded)
            {
                with (instance_create(x, y + 43, obj_cloudeffect))
                {
                    image_xscale = other.xscale;
                    other.dashcloudid = id;
                }
            }
            
            if (grounded && sprite_index != spr_playerV_divekickstart)
            {
                sprite_index = spr_machroll;
            }
            else if (sprite_index != spr_dive)
            {
                sprite_index = spr_dive;
                vsp = 10;
            }
            
            image_speed = 0.8;
            
            if (!key_down && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
            {
                image_index = 0;
                scr_soundeffect(118);
                state = UnknownEnum.Value_104;
                sprite_index = spr_rollgetup;
            }
            
            break;
        
        case "N":
            if (scr_solid(x + 1, y) && xscale == 1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
            {
                scr_soundeffect(56);
                hsp = 0;
                image_speed = 0.35;
                flash = 0;
                combo = 0;
                state = UnknownEnum.Value_106;
                hsp = -2.5;
                vsp = -3;
                mach2 = 0;
                image_index = 0;
                instance_create(x + 10, y + 10, obj_bumpeffect);
            }
            
            if (scr_solid(x - 1, y) && xscale == -1 && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
            {
                scr_soundeffect(56);
                hsp = 0;
                image_speed = 0.35;
                flash = 0;
                combo = 0;
                state = UnknownEnum.Value_106;
                hsp = 2.5;
                vsp = -3;
                mach2 = 0;
                image_index = 0;
                instance_create(x - 10, y + 10, obj_bumpeffect);
            }
            
            if ((!key_down || !grounded) && !scr_solid(x + 27, y - 32) && !scr_solid(x - 27, y - 32) && !scr_solid(x, y - 32) && !scr_solid(x, y - 16))
            {
                image_index = 0;
                scr_soundeffect(118);
                state = UnknownEnum.Value_121;
                sprite_index = spr_playerN_jetpackboost;
            }
            
            if (!instance_exists(dashcloudid) && grounded)
            {
                with (instance_create(x, y + 43, obj_cloudeffect))
                {
                    image_xscale = other.xscale;
                    other.dashcloudid = id;
                }
            }
            
            image_speed = 0.8;
            break;
    }
}
