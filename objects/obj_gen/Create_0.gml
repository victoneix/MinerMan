cell = 16;
cell_w = room_width div cell;
cell_h = room_height div cell;
grid = ds_grid_create(cell_w,cell_h);
ds_grid_clear(grid,0);


for(var _i = 0; _i < cell_w; _i++){
    for(var _j = 0; _j < cell_h; _j++){
            if(_i == 0 || _i == cell_w-1 || _j == 0 || _j == cell_h-1){
                 grid[# _i,_j] = 1;
            } else {
            	var _grid_type = 0;
                var _noise = irandom_range(0,100);
                if(_noise < 48){
                    _grid_type = 1;
                } else {
                    _grid_type = 0;
                }
                 grid[# _i,_j] = _grid_type;
            }
    }
}

neighboringwall = function(_gridx, _gridy){
    var _wallcount = 0;
    for(var _neighbor_x = _gridx-1; _neighbor_x <= _gridx+1;_neighbor_x++){
        for(var _neighbor_y = _gridy-1; _neighbor_y <= _gridy+1;_neighbor_y++){
            if(_neighbor_x >= 0 && _neighbor_x < cell_w-1 && _neighbor_y >= 0 && _neighbor_y < cell_h-1){
                if(_neighbor_x != _gridx || _neighbor_y != _gridy){
                    _wallcount += grid[# _neighbor_x, _neighbor_y];   
                } 
            }  else {
                	_wallcount++;
            }
        }
    }
    return _wallcount;
}

smoothmap = function(){
    for(var _i = 0; _i < cell_w; _i++){
        for(var _j = 0; _j < cell_h; _j++){
            var _wall = neighboringwall(_i,_j);
            if(_wall > 4){
                grid[# _i,_j] = 1;
            } else if(_wall < 4){
                grid[# _i,_j] = 0;
            }
         }
    }
}

for(var _i = 0; _i < 5; _i++){
    smoothmap();
}


for(var _i = 0; _i < cell_w; _i++){
    for(var _j = 0; _j < cell_h; _j++){
        if(grid[# _i,_j] == 1) instance_create_layer(_i*cell,_j*cell,layer,obj_collision);
    }
}


ores = function(_xx,_yy,_ore,_noise_id,_fraq,_veio_min,_veio_max){
    
    if(_noise_id > _fraq){
        var _pos_x = _xx;
        var _pos_y = _yy;
        var _veio = irandom_range(_veio_min,_veio_max);

        repeat (_veio) {
            
            if (_pos_x < 0 || _pos_x >= cell_w || _pos_y < 0 || _pos_y >= cell_h) {
                break;
            }
            
            var _grid = grid[# _pos_x,_pos_y];
            
            if(_grid == 0){
                instance_create_layer(_pos_x*cell,_pos_y*cell,layer,_ore);
                grid[# _pos_x,_pos_y] = 2
                var _dis_x = choose(-1,1,0);
                var _dis_y = choose(-1,1,0);
                _pos_x += _dis_x;
                _pos_y += _dis_y;
            } else {
                break;
            }
            
        }
    }
}

for(var _i = 0; _i < cell_w; _i++){
    for(var _j = 0; _j < cell_h; _j++){
        ores(_i,_j,obj_ore,random(1),0.97,4,6);
        ores(_i,_j,obj_iron,random(1),0.98,3,5);
        ores(_i,_j,obj_gould,random(1),0.99,3,5);
        //if(!instance_exists(obj_player) && grid[# _i,_j] == 0){
            //instance_create_layer(x*cell,y*cell,layer,obj_player);
        //}
    }
}

