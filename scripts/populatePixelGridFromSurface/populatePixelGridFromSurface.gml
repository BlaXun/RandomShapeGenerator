/// @description	Populates the pixel grid with information from the given surface
/// @param	{ds_grid} grid	The ds_grid to be used as pixel grid
/// @param	{surface} surface	The surface which is used to populate the pixel grid

var _grid = argument[0];
var _surface = argument[1];

var _gridHeight = ds_grid_width(_grid);
var _gridWidth = ds_grid_height(_grid);

for (var yPos=0;yPos<_gridHeight;yPos++) {		
	for (var xPos=0;xPos<_gridWidth;xPos++) {		
		ds_grid_set(_grid,xPos,yPos,surface_getpixel(_surface,xPos,yPos));
	}
}