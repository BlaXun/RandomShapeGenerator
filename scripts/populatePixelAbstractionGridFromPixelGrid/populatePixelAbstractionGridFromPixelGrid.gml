var _pixelAbstractionGrid = argument[0];
var _pixelGrid = argument[1];
var _insideColor = argument[2];

var _gridHeight = ds_grid_width(_pixelAbstractionGrid);
var _gridWidth = ds_grid_height(_pixelAbstractionGrid);

var _insideR, _insideG, _insideB;
_insideR = color_get_red(_insideColor);
_insideG = color_get_green(_insideColor);
_insideB = color_get_blue(_insideColor);

for (var yPos=0;yPos<_gridHeight;yPos++) {
	
	for (var xPos=0;xPos<_gridWidth;xPos++) {
		
		ds_grid_set(_pixelAbstractionGrid,xPos,yPos,PixelAbstraction.Empty);
		var pixelInfo = ds_grid_get(_pixelGrid,xPos,yPos);
		var _r, _g, _b;
		_r = color_get_red(pixelInfo);
		_g = color_get_green(pixelInfo);
		_b = color_get_blue(pixelInfo);
		
		if (_r == _insideR && _g == _insideG && _b == _insideB) {
			ds_grid_set(_pixelAbstractionGrid,xPos,yPos,PixelAbstraction.Inside);
		}
	}
}