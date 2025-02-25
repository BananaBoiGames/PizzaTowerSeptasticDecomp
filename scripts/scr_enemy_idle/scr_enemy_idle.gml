function scr_enemy_idle()
{
    var _railinst;
    
    hsp = 0;
    
    if (vsp > 1 && (grounded || (grounded && !place_meeting(x, y, obj_platform))))
    {
        create_particle(x, y, UnknownEnum.Value_12, 0);
        image_index = 0;
    }
    
    if ((vsp >= 0 || object_index == obj_miniufo || object_index == obj_kentukybomber) && sprite_index == scaredspr && scaredbuffer <= 0)
    {
        state = UnknownEnum.Value_134;
        sprite_index = walkspr;
        
        if (object_index == obj_treasureguy)
            state = 141;
        
        if (object_index == obj_pickle && attacking)
        {
            attacking = 0;
            bombreset = 0;
        }
    }
    
    if (scaredbuffer > 0)
        scaredbuffer--;
    
    if (sprite_index == spr_tank_spawnenemy && floor(image_index) == (image_number - 1))
    {
        sprite_index = walkspr;
        state = UnknownEnum.Value_134;
    }
    
    if (sprite_index == spr_forknight_turn && floor(image_index) == (image_number - 1))
    {
        sprite_index = walkspr;
        state = UnknownEnum.Value_134;
    }
    
    if (sprite_index == spr_pizzaslug_turn && floor(image_index) == (image_number - 1))
    {
        sprite_index = walkspr;
        image_xscale *= -1;
        state = UnknownEnum.Value_134;
    }
    
    if (sprite_index == spr_indiancheese_turn && floor(image_index) == (image_number - 1))
    {
        sprite_index = walkspr;
        state = UnknownEnum.Value_134;
    }
    
    if (sprite_index == spr_tank_turn && floor(image_index) == (image_number - 1))
    {
        sprite_index = walkspr;
        state = UnknownEnum.Value_134;
    }
    
    if (place_meeting(x, y + 1, obj_railparent))
    {
        _railinst = instance_place(x, y + 1, obj_railparent);
        hsp += (_railinst.movespeed * _railinst.dir);
    }
    
    image_speed = 0.35;
}
