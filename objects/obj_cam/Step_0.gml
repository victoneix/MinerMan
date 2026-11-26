if(!instance_exists(obj_player)) exit;
x = lerp(x,target.x,0.1);
y = lerp(y,target.y,0.1);
camera_set_view_pos(view_camera[0],x-cam_w/2,y-cam_h/2);