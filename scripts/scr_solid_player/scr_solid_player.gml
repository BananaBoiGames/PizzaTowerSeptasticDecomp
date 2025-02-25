function scr_solid_player(argument0, argument1)
{
    var old_x, old_y, num, _collided, i, b;
    
    old_x = x;
    old_y = y;
    x = argument0;
    y = argument1;
    ds_list_clear(global.instancelist);
    num = instance_place_list(x, y, 811, global.instancelist, false);
    _collided = false;
    
    for (i = 0; i < num; i++)
    {
        b = ds_list_find_value(global.instancelist, i);
        
        if (instance_exists(b))
        {
            switch (b.object_index)
            {
                case obj_ghostwall:
                    if (state != UnknownEnum.Value_16)
                        _collided = true;
                    
                    break;
                
                case obj_mach3solid:
                    if (state != UnknownEnum.Value_121 && (state != UnknownEnum.Value_105 || sprite_index != spr_mach3boost) && (state != UnknownEnum.Value_61 || tauntstoredstate != UnknownEnum.Value_121))
                        _collided = true;
                    
                    break;
                
                default:
                    _collided = true;
            }
        }
        
        if (_collided)
            break;
    }
    
    ds_list_clear(global.instancelist);
    
    if (_collided)
    {
        x = old_x;
        y = old_y;
        return true;
    }
    
    if (y > old_y && state != UnknownEnum.Value_93 && place_meeting(x, y, obj_platform))
    {
        num = instance_place_list(x, y, 816, global.instancelist, false);
        _collided = false;
        
        for (i = 0; i < num; i++)
        {
            b = ds_list_find_value(global.instancelist, i);
            
            if (!place_meeting(x, old_y, b) && place_meeting(x, y, b))
                _collided = true;
        }
        
        ds_list_clear(global.instancelist);
        
        if (_collided)
        {
            x = old_x;
            y = old_y;
            return true;
        }
    }
    
    if (y > old_y && state == UnknownEnum.Value_78 && !place_meeting(x, old_y, obj_grindrail) && place_meeting(x, y, obj_grindrail))
    {
        x = old_x;
        y = old_y;
        return true;
    }
    
    if (check_slope_player(832))
    {
        x = old_x;
        y = old_y;
        return true;
    }
    
    if (state == UnknownEnum.Value_78 && check_slope_player(1))
    {
        x = old_x;
        y = old_y;
        return true;
    }
    
    x = old_x;
    y = old_y;
    return false;
}

function check_slope_player(argument0)
{
    var slope, object_side, slope_start, slope_end, m;
    
    slope = instance_place(x, y, argument0);
    
    if (slope)
    {
        with (slope)
        {
            object_side = 0;
            slope_start = 0;
            slope_end = 0;
            
            if (image_xscale > 0)
            {
                object_side = other.bbox_right;
                slope_start = bbox_bottom;
                slope_end = bbox_top;
            }
            else
            {
                object_side = other.bbox_left;
                slope_start = bbox_top;
                slope_end = bbox_bottom;
            }
            
            m = (sign(image_xscale) * (bbox_bottom - bbox_top)) / (bbox_right - bbox_left);
            slope = slope_start - round(m * (object_side - bbox_left));
            
            if (other.bbox_bottom >= slope)
                return true;
        }
    }
    
    return false;
}
