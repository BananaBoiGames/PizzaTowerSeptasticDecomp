var _railinst;

if (defused == 1)
    countdown -= 0.5;

if (countdown < 50)
    sprite_index = bomblit_spr;

if (countdown == 0)
    instance_destroy();

if (kickbuffer > 0)
{
    if (!place_meeting(x, y, obj_player))
        kickbuffer = 0;
}

switch (state)
{
    case UnknownEnum.Value_0:
        hsp = movespeed * image_xscale;
        
        if (place_meeting(x + hsp, y, obj_solid))
            image_xscale *= -1;
        
        if (place_meeting(x + hsp, y, obj_ratblock) || place_meeting(x, y + vsp, obj_ratblock))
            instance_destroy();
        
        if (scr_solid(x + 1, y) || scr_solid(x - 1, y))
            drop = 1;
        
        if (scr_solid(x, y + 1))
        {
            if (movespeed > 0)
                movespeed -= 1;
            
            vsp = -5;
        }
        
        if (place_meeting(x, y + 1, obj_railparent))
        {
            _railinst = instance_place(x, y + 1, obj_railparent);
            hsp = _railinst.movespeed * _railinst.dir;
        }
        
        if (vsp < 12)
            vsp += grav;
        
        scr_collide();
        break;
    
    case UnknownEnum.Value_4:
        grounded = 0;
        x = playerid.x;
        y = playerid.y - 40;
        image_xscale = playerid.xscale;
        
        if (playerid.state != UnknownEnum.Value_52 && playerid.state != UnknownEnum.Value_76)
            state = UnknownEnum.Value_0;
        
        if (playerid.state == UnknownEnum.Value_76)
        {
            if (playerid.grounded)
                instance_destroy();
        }
        
        break;
    
    default:
        state = UnknownEnum.Value_0;
        break;
}
