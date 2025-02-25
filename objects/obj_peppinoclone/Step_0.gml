var inst_front, inst_down, inst_down2, inst_up, player;

if (room == rm_editor)
    exit;

targetplayer = instance_nearest(x, y, obj_player);

switch (state)
{
    case UnknownEnum.Value_126:
        scr_enemy_idle();
        break;
    
    case UnknownEnum.Value_130:
        scr_enemy_turn();
        break;
    
    case UnknownEnum.Value_134:
        if (targetplayer.x > (x - 700) && targetplayer.x < (x + 700) && targetplayer.y < (y + 500) && targetplayer.y > (y - 500))
        {
            if (grounded && x != targetplayer.x)
                image_xscale = sign(targetplayer.x - x);
            
            if (cooldown > 0)
                cooldown--;
            
            if (targetplayer.x > (x - 100) && targetplayer.x < (x + 100) && grounded)
            {
                hsp = Approach(hsp, 0, 0.5);
                
                if (cooldown <= 0)
                {
                    state = UnknownEnum.Value_80;
                    sprite_index = spr_fakepeppino_grabattack;
                    image_index = 0;
                    hitboxID = instance_create(x, y, obj_forkhitbox);
                    
                    with (hitboxID)
                        ID = other.id;
                }
            }
            else
            {
                hsp = image_xscale * 6;
            }
            
            if (state != UnknownEnum.Value_80)
            {
                if (grounded)
                {
                    if (hsp != 0)
                        sprite_index = walkspr;
                    else
                        sprite_index = idlespr;
                }
                else if (sprite_index != spr_player_jump && sprite_index != spr_player_fall)
                {
                    sprite_index = spr_player_fall;
                }
                else if (sprite_index == spr_player_jump && floor(image_index) == (image_number - 1))
                {
                    sprite_index = spr_player_fall;
                }
                
                inst_front = collision_line(x, y + 25, x + (sign(hsp) * 78), y + 25, obj_solid, false, true);
                inst_down = collision_line(x + (sign(hsp) * 16), y, x + (sign(hsp) * 16), y + 64, obj_solid, false, true);
                inst_down2 = collision_line(x + (sign(hsp) * 16), y, x + (sign(hsp) * 16), y + 64, obj_platform, false, true);
                inst_up = collision_line(x + (sign(hsp) * 96), y + 25, x + (sign(hsp) * 96), (y - 78) + 50, obj_platform, false, true);
                
                if (((!place_meeting(x, y + 1, obj_slope) && (inst_front != -4 || inst_up != -4)) || (inst_down == -4 && inst_down2 == -4)) && targetplayer.y <= (y + 32) && grounded && state != 128)
                {
                    vsp = -11;
                    sprite_index = spr_player_jump;
                    image_index = 0;
                }
            }
        }
        
        break;
    
    case UnknownEnum.Value_80:
        hsp = Approach(hsp, 0, 1);
        
        if (floor(image_index) == (image_number - 1))
        {
            state = UnknownEnum.Value_134;
            instance_destroy(hitboxID);
            cooldown = 100;
        }
        
        break;
    
    case UnknownEnum.Value_136:
        scr_enemy_land();
        break;
    
    case UnknownEnum.Value_137:
        scr_enemy_hit();
        break;
    
    case UnknownEnum.Value_138:
        scr_enemy_stun();
        break;
    
    case UnknownEnum.Value_129:
        scr_pizzagoblin_throw();
        break;
    
    case UnknownEnum.Value_4:
        scr_enemy_grabbed();
        break;
    
    case UnknownEnum.Value_154:
        scr_enemy_pummel();
        break;
    
    case UnknownEnum.Value_155:
        scr_enemy_staggered();
        break;
    
    case UnknownEnum.Value_125:
        scr_enemy_rage();
        break;
    
    case UnknownEnum.Value_17:
        scr_enemy_ghostpossess();
        break;
}

if (state == UnknownEnum.Value_138 && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = 0;

if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

scr_scareenemy();
player = instance_nearest(x, y, obj_player);

if (global.stylethreshold >= 3)
{
    if (state == UnknownEnum.Value_134)
    {
        if (player.x > (x - 200) && player.x < (x + 200) && y <= (player.y + 60) && y >= (player.y - 60))
        {
            if (state != UnknownEnum.Value_125 && ragebuffer == 0)
            {
                state = UnknownEnum.Value_125;
                sprite_index = ragespr;
                
                if (x != player.x)
                    image_xscale = -sign(x - player.x);
                
                ragebuffer = 100;
                image_index = 0;
                image_speed = 0.5;
                flash = 1;
                alarm[4] = 5;
                create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
            }
        }
    }
    
    if (ragebuffer > 0)
        ragebuffer--;
}

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_138)
    thrown = 0;

if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index;
        mask_index = other.sprite_index;
        baddieID = other.id;
        other.boundbox = 1;
    }
}
