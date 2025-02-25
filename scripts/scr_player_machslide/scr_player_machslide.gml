function scr_player_machslide()
{
    var _railinst;
    
    if (!place_meeting(x, y + 1, obj_railparent))
    {
        hsp = xscale * movespeed;
    }
    else
    {
        _railinst = instance_place(x, y + 1, obj_railparent);
        hsp = (xscale * movespeed) + (_railinst.movespeed * _railinst.dir);
    }
    
    move = key_right + key_left;
    
    if (movespeed >= 0)
        movespeed -= 0.4;
    
    if (sprite_index == spr_machslidestart && floor(image_index) == (image_number - 1))
        sprite_index = spr_machslide;
    
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_machslideboost || sprite_index == spr_mach3boost))
        image_speed = 0;
    else
        image_speed = 0.35;
    
    landAnim = 0;
    
    if (floor(movespeed) <= 0 && (sprite_index == spr_machslide || sprite_index == spr_crouchslide))
    {
        state = UnknownEnum.Value_0;
        image_index = 0;
        
        if (sprite_index == spr_machslide)
            machslideAnim = 1;
        
        movespeed = 0;
    }
    
    if (place_meeting(x + xscale, y, obj_solid) && (sprite_index == spr_machslide || sprite_index == spr_machslidestart))
    {
        sprite_index = spr_player_wallsplat;
        state = UnknownEnum.Value_106;
        image_index = 0;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslideboost && grounded)
    {
        hsp = 0;
        image_index = 0;
        xscale *= -1;
        movespeed = 8;
        state = UnknownEnum.Value_104;
    }
    
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach3boost && grounded)
    {
		// maybe could be the issue
        hsp = 0;
        sprite_index = spr_mach4;
        image_index = 0;
        xscale *= -1;
        movespeed = 12;
        state = UnknownEnum.Value_121;
    }
    
    if (sprite_index == spr_player_crouchslide && movespeed == 0 && grounded)
    {
        facehurt = 1;
        state = UnknownEnum.Value_0;
        sprite_index = spr_facehurtup;
    }
    
    if (!instance_exists(dashcloudid) && grounded && !place_meeting(x, y + 1, obj_water))
    {
        with (instance_create(x, y, obj_dashcloud2))
        {
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
    
    if (!instance_exists(dashcloudid) && grounded && place_meeting(x, y + 1, obj_water))
    {
        with (instance_create(x, y, obj_dashcloud2))
        {
            sprite_index = spr_watereffect;
            image_xscale = other.xscale;
            other.dashcloudid = id;
        }
    }
}
