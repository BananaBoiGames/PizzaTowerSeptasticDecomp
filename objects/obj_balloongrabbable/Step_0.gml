if (cooldown > 0)
{
    cooldown--;
    active = 0;
}
else if (!active)
{
    active = 1;
    create_particle(x, y, UnknownEnum.Value_9, 0);
}
