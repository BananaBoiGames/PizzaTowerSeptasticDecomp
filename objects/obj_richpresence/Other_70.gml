var ev_type;

ev_type = ds_map_find_value(async_load, "event_type");

if (ev_type == "DiscordReady")
{
    global.discord_initialized = true;
    window_set_caption("Pizza Tower: Sep-Tastic");
    ready = true;
    show_debug_message("date: " + string(date_current_datetime()));
    np_setpresence_timestamps(date_current_datetime(), 0, false);
    np_setpresence_more("", "", false);
    np_setpresence("", "", "image-530", "");
    sprite_add(np_get_avatar_url(ds_map_find_value(async_load, "user_id"), ds_map_find_value(async_load, "avatar")), 1, false, false, 0, 0);
}
