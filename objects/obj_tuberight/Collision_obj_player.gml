var _offset_x, _offset_y;

if (other.tube_id == id)
    exit;

if (other.state == UnknownEnum.Value_107)
    exit;

if (other.state == UnknownEnum.Value_186)
    exit;

_offset_x = 32 * image_xscale;
_offset_y = 14 * image_yscale;

with (other)
{
    if (other.stored_spd == 0)
    {
        if (abs(hsp) < other.movespeed)
            hsp = other.movespeed;
        
        if (abs(vsp) < other.movespeed)
            vsp = other.movespeed;
        
        other.stored_spd = max(abs(hsp), abs(vsp));
    }
    
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    tube_vsp = 0;
    state = UnknownEnum.Value_150;
    x = Approach(x, other.x + _offset_x, other.approach_spd);
    y = Approach(y, other.y + _offset_y, other.approach_spd);
}

if (floor(other.x) == (x + _offset_x) && floor(other.y) == (y + _offset_y))
{
    other.state = UnknownEnum.Value_150;
    other.tube_id = id;
    other.hsp = hsp * stored_spd;
    other.vsp = vsp * stored_spd;
    other.tube_vsp = vsp * stored_spd;
    stored_spd = 0;
    trace("hsp: ", other.hsp, " vsp: ", other.vsp);
}
