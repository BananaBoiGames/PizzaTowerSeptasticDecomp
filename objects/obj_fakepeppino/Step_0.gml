var xx, yy, ixs, v, msk, b;

if (!touched)
{
    xx = obj_player1.x;
    yy = obj_player1.y;
    ixs = obj_player1.xscale;
    v = obj_player1.vsp;
    msk = obj_player1.mask_index;
    ds_queue_enqueue(followqueue, [xx, yy, ixs, v, msk]);
    
    if (ds_queue_size(followqueue) > LAG_STEPS)
    {
        b = ds_queue_dequeue(followqueue);
        x = b[0];
        y = b[1];
        image_xscale = b[2];
        vsp = b[3];
        mask_index = b[4];
    }
    
    image_speed = 0.35;
    
    switch (state)
    {
        case UnknownEnum.Value_0:
            if (sprite_index != spr_fakepeppino_land)
            {
                if (x != xprevious)
                    sprite_index = spr_fakepeppino_walk;
                else
                    sprite_index = spr_fakepeppino_idle;
            }
            else if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_fakepeppino_idle;
            }
            
            if (sprite_index == spr_fakepeppino_walk)
            {
                if (!steppy && (floor(image_index) == 2 || floor(image_index) == 7))
                {
                    steppy = 1;
                    create_particle(x, y + 38, UnknownEnum.Value_1, 0);
                }
                
                if (steppy && floor(image_index) != 2 && floor(image_index) != 7)
                    steppy = 0;
            }
            
            if (!grounded)
            {
                state = UnknownEnum.Value_92;
                
                if (vsp < 0)
                {
                    with (instance_create(x, y, obj_highjumpcloud1))
                    {
                        if (scr_solid(x, y + 64))
                        {
                            while (!scr_solid(x, y + 1))
                                y++;
                        }
                    }
                    
                    sprite_index = spr_fakepeppino_jumpstart;
                    image_index = 0;
                }
                else
                {
                    sprite_index = spr_fakepeppino_fall;
                    image_index = 0;
                }
            }
            
            break;
        
        case UnknownEnum.Value_92:
            if (floor(image_index) == (image_number - 1))
            {
                if (sprite_index == spr_fakepeppino_jumpstart)
                    sprite_index = spr_fakepeppino_jump;
                else if (sprite_index == spr_fakepeppino_jump)
                    sprite_index = spr_fakepeppino_fall;
            }
            
            if (grounded && vsp > 0)
            {
                create_particle(x, y, UnknownEnum.Value_12, 0);
                sprite_index = spr_fakepeppino_land;
                image_index = 0;
                state = UnknownEnum.Value_0;
            }
            
            break;
    }
    
    grounded = scr_solid(x, y + 1);
}
