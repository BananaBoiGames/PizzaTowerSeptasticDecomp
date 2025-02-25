var _baddieID, lag, baddie_id, debriscount;

_baddieID = other.baddieID;

if (!instance_exists(_baddieID))
    exit;

if (_baddieID.state != UnknownEnum.Value_4 && !_baddieID.invincible && _baddieID.hittable && _baddieID.state != UnknownEnum.Value_17)
{
    with (playerid)
    {
        if ((floor(image_index) < 4 || (global.attackstyle == 3 && image_index < 6)) && (state == UnknownEnum.Value_43 || state == UnknownEnum.Value_42) && state != UnknownEnum.Value_61 && _baddieID.state != UnknownEnum.Value_137)
        {
            lag = 5;
            baddie_id = _baddieID.id;
            movespeed = 6;
            
            if (ds_list_find_index(hitlist, baddie_id) == -1)
            {
                ds_list_add(hitlist, baddie_id);
                
                with (_baddieID)
                {
                    hp -= 0.5;
                    instance_create(x, y, obj_bangeffect);
                    state = UnknownEnum.Value_137;
                    image_xscale = -other.xscale;
                    hit_connected = 1;
                    hithsp = ((other.x + ((other.movespeed + 0.5) * 60 * other.xscale)) - x) / 60;
                    hitvsp = (other.y - 180 - y) / 60;
                    hitLag = lag;
                    hitX = x;
                    hitY = y;
                    invtime = lag + 5;
                    flash = 1;
                    
                    if (!important)
                    {
                        global.combo += 1;
                        global.combotime = 60;
                        global.heattime = 60;
                    }
                }
                
                hit_connected = 1;
                lunge_hits++;
                finisher_hits++;
                lunge_hit_buffer = 100;
                
                if (state == UnknownEnum.Value_42)
                {
                    state = UnknownEnum.Value_43;
                    randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 580, 579, 578, spr_punch]);
                    image_index = 0;
                }
                
                tauntstoredstate = state;
                tauntstoredsprite = sprite_index;
                tauntstoredmovespeed = movespeed;
                tauntstoredvsp = 0;
                state = UnknownEnum.Value_61;
                hitLag = lag;
                hitX = x;
                
                if (hit_connected)
                    hitvsp = 0;
                else
                    hitvsp = vsp;
                
                hitY = y;
                scr_soundeffect(54);
                debriscount = floor(lunge_hits / 5);
                
                repeat (2 + debriscount)
                {
                    with (create_debris(x, y, 1288))
                        vsp = irandom_range(-6, -11);
                }
                
                instance_create(other.x, other.y, obj_parryeffect);
            }
        }
    }
}
