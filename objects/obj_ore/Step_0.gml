if(z > 0){
    z += zspd;
    zspd += zgra;
} else if(z < 0){
    z = -z;
    zspd = abs(zspd) * 0.6 - 0.7;
    if(z < 1){
        z = 0;
        zspd = 0;
    }
}

repeat (abs(hspeed)) {
	if(place_meeting(x+hspeed,y,obj_collision)){
        hspeed = 0;
        break;
    }
}

repeat (abs(vspeed)) {
	if(place_meeting(x,y+vspeed,obj_collision)){
        vspeed = 0;
        break;
    }
}

depth = -y;