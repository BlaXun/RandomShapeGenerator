var _abstractionGrid = argument[0];
var _gridHeight = ds_grid_width(_abstractionGrid);
var _gridWidth = ds_grid_height(_abstractionGrid);

var leftContent, rightContent, topContent, bottomContent;

//	Draw inner-shadow
for (var yPos=0;yPos<_gridHeight;yPos+=1) {

	//	Try skipping rows if no inside-pixel exists in that row
	if (ds_grid_value_exists(_abstractionGrid,0,yPos,_gridWidth-1,yPos,PixelAbstraction.Inside) == false) {
		continue;
	}

	for (var xPos=0;xPos<_gridWidth;xPos+=1) {

		var positionContent = ds_grid_get(_abstractionGrid,xPos,yPos);		
		if (positionContent == PixelAbstraction.Inside) {
			leftContent = (xPos-1>=0) ? ds_grid_get(_abstractionGrid,xPos-1,yPos) : noone;
			rightContent = (xPos+1<_gridWidth) ? ds_grid_get(_abstractionGrid,xPos+1,yPos) : noone;
			topContent = (yPos-1>=0) ? ds_grid_get(_abstractionGrid,xPos,yPos-1) : noone;
			bottomContent = (yPos+1<_gridHeight) ? ds_grid_get(_abstractionGrid,xPos,yPos+1) : noone;
			
			//	check top and right neighbors
			if	(topContent == PixelAbstraction.Border && rightContent == PixelAbstraction.Border) ||
				(bottomContent == PixelAbstraction.Border && rightContent == PixelAbstraction.Border) ||
				(bottomContent == PixelAbstraction.Border && leftContent == PixelAbstraction.Border) || 
				(topContent == PixelAbstraction.Border && leftContent == PixelAbstraction.Border) {
					 
				ds_grid_set(_abstractionGrid,xPos,yPos,PixelAbstraction.Shade);				
			}
		}
	}
}