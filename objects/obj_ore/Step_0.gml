if (z > 0) {
    z += zspeed;
    zspeed += zgravity;
}
if (z < 0) {
    z = -z;
    zspeed = abs(zspeed) * 0.6 - 0.7;
    if (zspeed < 1) {
        z = 0;
        zspeed = 0;
    }
}
move_and_collide(0,0,obj_collision);