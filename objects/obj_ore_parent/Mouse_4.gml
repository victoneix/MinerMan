durab -= 0.1;
audio_play_sound(snd_hit,0,0, , , random_range(0.4,1.8));

var _drop = random(1);

if(_drop < 0.5){
    instance_create_layer(x+4,y+4,layer,obj_ore);
}