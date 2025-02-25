var lag;

if (instance_exists(baddieID) && instance_exists(other.baddieID) && baddieID.thrown != 1 && !other.baddieID.mach3destroy && baddieID.state != UnknownEnum.Value_137 && other.baddieID.thrown == 1 && other.baddieID.state != UnknownEnum.Value_137 && baddieID.killbyenemy && baddieID != other.id && baddieID.state != UnknownEnum.Value_4 && !baddieID.invincible && baddieID.instantkillable && ((global.attackstyle != 2 && !global.kungfu) || baddieID.hp <= 0) && !global.kungfu)
{
    scr_soundeffect(74);
    
    if (baddieID.object_index != obj_tank || baddieID.hp <= 0)
        baddieID.hp -= 99;
    
    if (!baddieID.important)
    {
        global.style += (5 + global.combo);
        global.combo += 1;
        global.combotime = 60;
        global.heattime = 60;
    }
    
    with (obj_player1)
    {
        if (supercharge < 10)
            supercharge += 1;
    }
    
    lag = 5;
    
    if (baddieID.object_index != obj_tank || baddieID.hp <= 0)
    {
        baddieID.hitLag = lag;
        baddieID.hitX = baddieID.x;
        baddieID.hitY = baddieID.y;
        
        if (baddieID.object_index != obj_tank || baddieID.hp <= 0)
            baddieID.hp -= 1;
        
        instance_create(baddieID.x, baddieID.y, obj_parryeffect);
        baddieID.alarm[3] = 3;
        baddieID.state = UnknownEnum.Value_137;
        baddieID.image_xscale = other.baddieID.image_xscale;
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_baddiegibs);
        instance_create(x, y, obj_baddiegibs);
        instance_create(x, y, obj_baddiegibs);
        
        with (obj_camera)
        {
            shake_mag = 3;
            shake_mag_acc = 3 / room_speed;
        }
        
        baddieID.hitvsp = -8;
        baddieID.hithsp = -other.baddieID.image_xscale * 15;
        
        if (baddieID.destroyable)
            instance_destroy(baddieID);
    }
    
    if (other.baddieID.object_index != obj_tank || other.baddieID.hp <= 0)
        instance_destroy(other.baddieID);
}
