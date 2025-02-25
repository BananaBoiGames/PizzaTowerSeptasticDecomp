with (instance_place(x - 1, y, obj_player))
{
    if (state == UnknownEnum.Value_11 && other.eaten == 0)
    {
        other.eaten = 1;
        grav = 0.5;
        state = UnknownEnum.Value_0;
    }
}

with (instance_place(x + 1, y, obj_player))
{
    if (state == UnknownEnum.Value_11 && other.eaten == 0)
    {
        other.eaten = 1;
        grav = 0.5;
        state = UnknownEnum.Value_0;
    }
}

if (eaten)
{
    x = -100;
    y = -100;
    sprite_index = spr_corneaten;
    
    if (ds_list_find_index(global.saveroom, id) == -1)
        ds_list_add(global.saveroom, id);
}

if (eaten && ds_list_find_index(global.saveroom, id) == -1 && instance_exists(obj_mort))
{
    x = xstart;
    y = ystart;
    eaten = 0;
    sprite_index = spr_corn;
}
