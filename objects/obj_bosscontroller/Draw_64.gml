var sprplayer, sprboss, xx, yy, str, textseconds, _color, _temp_local_var_17, _boss_hp;

if (bossID == -4)
    exit;

if (!instance_exists(bossID))
    exit;

if (bossID.destroyed)
    exit;

if (bossID.playerdestroyed)
    exit;

switch (state)
{
    case UnknownEnum.Value_144:
        draw_sprite_tiled(spr_versusflame, -1, 0, flamey);
        sprplayer = (playerx != 0) ? playersprshadow : playerspr;
        sprboss = (playerx != 0) ? bosssprshadow : bossspr;
        draw_sprite(sprplayer, -1, playerx, room_height - sprite_get_height(sprplayer));
        draw_sprite(sprboss, -1, bossx, room_height - sprite_get_height(sprboss));
        xx = irandom_range(-1, 1);
        yy = irandom_range(-1, 1);
        draw_sprite(vstitle, -1, xx, vsy + yy);
        
        if (flash)
        {
            shader_set(shd_hit);
            draw_sprite(sprplayer, -1, playerx, room_height - sprite_get_height(sprplayer));
            draw_sprite(sprboss, -1, bossx, room_height - sprite_get_height(sprboss));
            draw_sprite(vstitle, -1, xx, vsy + yy);
            shader_reset();
        }
        
        exit;
    
    case 145:
        draw_set_halign(fa_center);
        str = concat("ROUND ", round_count);
        draw_text(480 + irandom_range(-1, 1), 78 + irandom_range(-1, 1), str);
        break;
    
    case UnknownEnum.Value_0:
        draw_set_halign(fa_center);
        textseconds = (seconds < 10) ? ("0" + string(seconds)) : string(seconds);
        _color = (seconds <= 30 && minutes == 0) ? 255 : c_white;
        _temp_local_var_17 = (_color == 255) ? irandom_range(-1, 1) : 0;
        draw_text_color(480 + ((_color == 255) ? irandom_range(-1, 1) : 0), 558, string(minutes) + ":" + textseconds, _color, _color, _color, _color, 1);
        break;
}

draw_healthbar(64, 192, 448, 224, (player_hp / player_hpmax) * 100, c_dkgray, c_red, c_red, 0, 1, 1);
_boss_hp = instance_exists(bossID) ? ((bossID.hp / bossID.max_hp) * 100) : 0;
draw_healthbar(512, 192, 896, 224, _boss_hp, c_dkgray, c_red, c_red, 1, 1, 1);
