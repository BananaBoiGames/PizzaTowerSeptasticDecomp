with (other)
{
    if (state != UnknownEnum.Value_184 && state != UnknownEnum.Value_186)
    {
        xscale = other.image_xscale;
        state = UnknownEnum.Value_184;
        tv_push_prompt_once(tv_create_prompt("This is the rocket transformation text", UnknownEnum.Value_2, 201, 3), "rocket");
        sprite_index = spr_rocketstart;
        image_index = 0;
        
        if (movespeed < 14)
            movespeed = 14;
        
        x = other.x;
        
        if (sprite_index == spr_player_rocketstart)
            y = other.y - 18;
        else if (sprite_index == spr_playerN_rocketstart)
            y = other.y - 14;
    }
}
