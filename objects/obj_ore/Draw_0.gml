var vz = z + lengthdir_x(1, image_index / image_number * 360);
//draw_shadow(x, y, 6 / (1 + vz / 20));
draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
