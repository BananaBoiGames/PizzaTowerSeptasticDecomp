if (instance_exists(other.baddieID))
{
    if (other.baddieID != baddieID && !other.baddieID.invincible && other.baddieID.killbyenemy && other.baddieID.destroyable)
        instance_destroy(other.baddieID);
}
