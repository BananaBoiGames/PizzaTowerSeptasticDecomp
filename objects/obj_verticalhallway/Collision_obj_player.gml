var _x, _percentage, bbox_size;

with (other)
{
    if (!instance_exists(obj_fadeout))
    {
        _x = x - other.x;
        _percentage = _x / other.sprite_width;
        obj_player1.vertical_x = _percentage;
        obj_player2.vertical_x = _percentage;
        obj_player1.verticalhall_vsp = vsp;
        obj_player2.verticalhall_vsp = vsp;
        obj_player1.lastroom = room;
        obj_player2.lastroom = room;
        obj_player1.targetDoor = other.targetDoor;
        obj_player1.targetRoom = other.targetRoom;
        obj_player1.verticalhallway = 1;
        obj_player2.verticalhallway = 1;
        obj_player1.vhallwaydirection = sign(other.image_yscale);
        obj_player2.vhallwaydirection = sign(other.image_yscale);
        obj_player1.hallway = 0;
        obj_player2.hallway = 0;
        
        if (instance_exists(obj_player2))
        {
            obj_player2.targetDoor = other.targetDoor;
            obj_player2.targetRoom = other.targetRoom;
        }
        
        other.visited = 1;
        scr_soundeffect(103);
        instance_create(x, y, obj_fadeout);
    }
    
    y = other.y + (other.sprite_height - 46);
    x = other.x + (other.sprite_width * vertical_x);
    bbox_size = abs(bbox_right - bbox_left);
    x = clamp(x, other.x + bbox_size, other.bbox_right - bbox_size);
    
    while (scr_solid(x, y))
    {
        x -= xscale;
        i++;
        
        if (i > room_width)
            break;
        else
            continue;
    }
    
    if (state == UnknownEnum.Value_37)
    {
        i = 0;
        x = floor(x);
        
        while (!scr_solid(x + xscale, y))
        {
            x += xscale;
            i++;
            
            if (i > room_width)
                break;
            else
                continue;
        }
    }
}
