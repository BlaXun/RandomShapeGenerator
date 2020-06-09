/// @function initShapeGenerator
/// @description	Initializes the shape generator. 

_isDone = false;

//	The fill color of the subimages that are used to build the final shape
//	If this is not set to the correct color... nothing will happen
shapeOriginalColor = c_white;

//	The surfaces size is based on the size of the sprite that holds the shapes
size = sprite_get_width(self.sprite_index);
mySurface = surface_create(size,size);

possibleBorderColors = [c_black,c_gray,c_dkgray];
possibleInsideColors = [c_white,c_ltgray,make_color_rgb(200,200,200),make_color_rgb(191,255,228),make_color_rgb(255,221,191),make_color_rgb(239,255,191),make_color_rgb(222,191,255)];

//	Grid to store the border-coordinates
pixelGrid = ds_grid_create(size,size);
abstractionGrid = ds_grid_create(size,size);

generateShapeInis = false;

//	Defines wether shapes should be texturized with one of the subimages of sprTextures
texturizeShape = true;

//	Wether the applied texture should use a color for blending
applyBlendOnTexturizing = true;

//	The colors that are available for blending the texture. Will be choosend randomly
possibleTextureBlendColors = [make_color_rgb(191,255,228),make_color_rgb(255,221,191),make_color_rgb(239,255,191),make_color_rgb(222,191,255)];

amountOfExistingFiles = 0;
if (file_find_first("*.png",0) != "") {
	amountOfExistingFiles +=1;	
	while (file_find_next() != "") {
		amountOfExistingFiles +=1;
	}
};