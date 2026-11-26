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
                if(_noise < 34){
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