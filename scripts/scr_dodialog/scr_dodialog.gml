function do_dialog(argument0, argument1, argument2, argument3, argument4, argument5)
{
    with (instance_create(x, y, obj_dialogcontroller))
    {
        npcID = other.id;
        dialog = argument0;
        dialogsnd = argument1;
        portrait = argument2;
        fontselect = argument3;
        bucket = argument5;
        talking = argument4;
        dialogsprite = dialog[0][1];
        currenttext = scr_calculate_text(dialog[0][0]);
        dialogheight = scr_calculate_height(currenttext);
    }
    
    with (obj_player)
    {
        if (state == UnknownEnum.Value_17)
        {
            visible = true;
            
            with (possessID)
            {
                state = UnknownEnum.Value_138;
                stunned = 50;
            }
        }
        
        sprite_index = spr_idle;
        image_speed = 0.35;
        state = UnknownEnum.Value_146;
        hsp = 0;
        vsp = 0;
        movespeed = 0;
    }
}

function npc_do_dialog()
{
    do_dialog(dialog, dialogsnd, portrait, fontselect, talking, bucket);
}

function vigilante_add_battle()
{
    if (global.vigilantecutscene1 == -4 || !global.vigilantecutscene1)
    {
        global.vigilantecutscene1 = 1;
        quick_ini_write_real(get_savefile_ini(), "cutscene", "vigilante1", 1);
    }
}

function do_dialog_cutscene(argument0, argument1 = 0, argument2 = 0)
{
    var i;
    
    with (instance_create(argument1, argument2, obj_cutscene_handler))
    {
        scene_info = argument0;
        
        for (i = 0; i < array_length(scene_info); i++)
            scene_info[i][0] = method(id, scene_info[i][0]);
    }
}
