var ty, tx;

if (!colliding)
    exit;

ty = try_solid(0, -1, 811, 64);

if (ty != -1)
    y -= ty;

tx = try_solid(image_xscale, 0, 811, 64);

if (tx != -1)
    x += (tx * image_xscale);

if (place_meeting(x, y, obj_solid))
{
    ty = try_solid(0, 1, 811, 64);
    
    if (ty != -1)
        y += ty;
    
    tx = try_solid(-image_xscale, 0, 811, 64);
    
    if (tx != -1)
        x += (tx * -image_xscale);
}
