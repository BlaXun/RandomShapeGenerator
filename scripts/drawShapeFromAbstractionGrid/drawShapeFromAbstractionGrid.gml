var _abstractionGrid = argument[0];
var _gridHeight = ds_grid_width(_abstractionGrid);
var _gridWidth = ds_grid_height(_abstractionGrid);
var _borderColor = argument[1];
var _shadeColor = argument[2];
var _insideColor = argument[3];

for (var yPos=0;yPos<_gridHeight;yPos+=1) {

	for (var xPos=0;xPos<_gridWidth;xPos+=1) {
		
		switch(ds_grid_get(_abstractionGrid,yPos,xPos)) {
			
			case PixelAbstraction.Border:
			draw_point_color(xPos,yPos,_borderColor);
			break;
			
			case PixelAbstraction.Shade:
			draw_point_color(xPos,yPos,_shadeColor);
			break;
			
			case PixelAbstraction.Inside:
			draw_point_color(xPos,yPos,_insideColor);
			break;
		}
	}
}