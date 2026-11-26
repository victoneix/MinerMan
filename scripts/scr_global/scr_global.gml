function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 1000; // obj_control
	global.__objectDepths[1] = 0; // obj_chest_closed
	global.__objectDepths[2] = 0; // obj_chest_open
	global.__objectDepths[3] = 0; // obj_coin


	global.__objectNames[0] = "obj_control";
	global.__objectNames[1] = "obj_chest_closed";
	global.__objectNames[2] = "obj_chest_open";
	global.__objectNames[3] = "obj_coin";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}


/// @description Returns the depth of the specified object.
/// @param {Number} obj The index of the object to check
/// @return {Number} depth of the object
function object_get_depth(argument0) {

	var objID = argument0;
	var ret = 0;
	if (objID >= 0) && (objID < array_length_1d(global.__objectID2Depth)) {
		ret = global.__objectID2Depth[objID];
	} // end if
	return ret;


}


/// @description Creates an instance of a given object at a given position.
/// @param x The x position the object will be created at.
/// @param y The y position the object will be created at.
/// @param obj The object to create an instance of.
function instance_create(argument0, argument1, argument2) {
	var myDepth = object_get_depth( argument2 );
	return instance_create_depth( argument0, argument1, myDepth, argument2 );

}

