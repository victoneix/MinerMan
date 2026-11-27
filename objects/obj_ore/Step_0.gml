if(z > 0){
    z += zspd;
    zspd += zgrav;
} else if(z <= 0){
    z = 0;
    zspd = 0;
}