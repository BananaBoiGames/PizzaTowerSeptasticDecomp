if (sprite_index != spr_pizzaball_roll)
    image_speed = 0.35;
else
    image_speed = movespeed / 10;

if (image_speed < 0.2)
    image_speed = 0.2;

current = place_meeting(x, y + 1, obj_current);

switch (state)
{
    case UnknownEnum.Value_0:
        scr_pizzaball_normal();
        break;
    
    case UnknownEnum.Value_5:
        scr_pizzaball_roll();
        break;
    
    case UnknownEnum.Value_148:
        scr_pizzaball_golf();
        break;
}

if (kicked)
    mask_index = msk_pizzaball_crouch;
else
    mask_index = spr_pizzaball_idle2;

with (instance_place(x, y + 1, obj_destructibleplatform))
{
    falling = 1;
    
    if (falling == 1)
        image_speed = 0.35;
}

if (grounded && obj_player.state == UnknownEnum.Value_111)
    vsp = -11;
