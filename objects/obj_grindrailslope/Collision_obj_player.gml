if ((other.y > other.yprevious || (other.xscale == sign(image_xscale) && other.y < bbox_bottom)) && other.state != UnknownEnum.Value_84 && other.state != UnknownEnum.Value_106)
{
    with (other)
    {
        if (!scr_transformationcheck())
            exit;
        
        while (place_meeting(x, y, obj_grindrailslope))
            y--;
    }
    
    if (!other.isgustavo)
    {
        if (other.movespeed < 10)
            other.movespeed = 10;
        
        other.state = UnknownEnum.Value_78;
    }
    else
    {
        other.y = y + 8;
        other.state = UnknownEnum.Value_202;
    }
}
