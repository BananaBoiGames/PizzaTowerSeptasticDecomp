if (global.timedgate == 1)
{
    global.timedgate = 0;
    global.seconds = 30;
    ded = 0;
    alarm[2] = -1;
}

if (global.miniboss == 1)
{
    with (obj_player)
    {
        instance_create(x, y, obj_bangeffect);
        
        repeat (6)
            instance_create(x, y, obj_slapstar);
        
        state = UnknownEnum.Value_7;
        vsp = -10;
        audio_stop_all();
        scr_soundeffect(148);
    }
    
    alarm[2] = -1;
    global.miniboss = 0;
}
