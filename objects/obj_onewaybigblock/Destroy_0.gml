if (room == rm_editor)
    exit;

if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create(x + (32 * image_xscale), y + 32, obj_sausageman_dead))
        sprite_index = spr_bigdoughblockdead;
    
    scr_sleep(5);
    
    if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
    {
        audio_stop_sound(sfx_breakblock1);
        audio_stop_sound(sfx_breakblock2);
    }
    
    scr_soundeffect(43, 44);
    ds_list_add(global.saveroom, id);
}

instance_destroy(solid_inst);
