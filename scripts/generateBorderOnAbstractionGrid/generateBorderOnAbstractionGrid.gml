var _abstractionGrid = argument[0];

var _gridHeight = ds_grid_width(_abstractionGrid);
var _gridWidth = ds_grid_height(_abstractionGrid);

var leftContent, rightContent, topContent, bottomContent;
for (var yPos=0;yPos<_gridHeight;yPos++) {
		
	for (var xPos=0;xPos<_gridWidth;xPos++) {
		
		skipX = false;		
		var positionContent = ds_grid_get(_abstractionGrid,xPos,yPos);
		if (positionContent != PixelAbstraction.Inside) {
			continue;
		} else if (positionContent == PixelAbstraction.Inside) {
		
		leftContent = (xPos-1>=0) ? ds_grid_get(_abstractionGrid,xPos-1,yPos) : noone;
		rightContent = (xPos+1<sizeWidth) ? ds_grid_get(_abstractionGrid,xPos+1,yPos) : noone;
		topContent = (yPos-1>=0) ? ds_grid_get(_abstractionGrid,xPos,yPos-1) : noone;
		bottomContent = (yPos+1<sizeHeight) ? ds_grid_get(_abstractionGrid,xPos,yPos+1) : noone;

			//	check left
			if (leftContent != noone && leftContent == PixelAbstraction.Empty) {			
				ds_grid_set(_abstractionGrid,xPos-1,yPos,PixelAbstraction.Border);
			}

			//	check top
			if (topContent != noone && topContent == PixelAbstraction.Empty) {	
				ds_grid_set(_abstractionGrid,xPos,yPos-1,PixelAbstraction.Border);
			}

			//	check right
			if (rightContent != noone && rightContent == PixelAbstraction.Empty) {	
				skipX = true;
				ds_grid_set(_abstractionGrid,xPos+1,yPos,PixelAbstraction.Border);
			}
						
			//	check bottom
			if (bottomContent != noone && bottomContent == PixelAbstraction.Empty) {							
				ds_grid_set(_abstractionGrid,xPos,yPos+1,PixelAbstraction.Border);
			}
			
			if (skipX) {
				xPos+=1;
			}	
		}
	}
}