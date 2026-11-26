var _font = font_add_sprite(spr_font,ord("!"),0,0);
draw_set_font(_font);
draw_text_ext_transformed(4,4,"Minector Alpha",0,999,4,4,0);
draw_text_ext_transformed(4,320+160+64,"Ores " + string(obj_player.ores),0,999,4,4,0);
draw_set_font(-1);