audio_play_sound(snd_collected,0,0);
repeat (irandom_range(1, 4)) {
    instance_create(x+4, y+4,obj_ore);
}