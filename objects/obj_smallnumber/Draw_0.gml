var c;

draw_set_font(global.smallnumber_fnt);
draw_set_halign(fa_center);
c = negative ? global.smallnumber_color2 : global.smallnumber_color1;
draw_set_color(c);

if (!flash)
    draw_text(x, y, number);
