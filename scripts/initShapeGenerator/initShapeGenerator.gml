/// @function initShapeGenerator
/// @description	Initializes the shape generator. 

//	Private (ReadOnly) - Please do not change these unless you know what you are doing!

amountOfExistingFiles = 0;
if (file_find_first("*.png",0) != "") {
	amountOfExistingFiles +=1;	
	while (file_find_next() != "") {
		amountOfExistingFiles +=1;
	}
};

_isDone = false;

sizeWidth = sprite_get_width(self.sprite_index);	//	The height to use for the surface and grid. Based on the sprite thats used as base for generating shapes
sizeHeight = sprite_get_height(self.sprite_index);

mySurface = surface_create(sizeWidth,sizeHeight);

//	Grid to store the border-coordinates
pixelGrid = ds_grid_create(sizeWidth,sizeHeight);
abstractionGrid = ds_grid_create(sizeWidth,sizeHeight);

//	The fill color of the subimages that are used to build the final shape
//	If this is not set to the correct color... nothing will happen
shapeOriginalColor = c_white;


//	CHANGE THESE TO MODIFY THE BEHAVIOR
allowShapeRotation = true;	//	Toggle rotating of subimages that are used to compose the final shape.
allowShapeScaling = true	//	Toggle scaling of subimages that are used to compose the final shape.
addOutline = true;	//	Toggle drawing outlines / border. This is required for shading / inner-shadow to work.
addShading = true;	//	Toggle drawing shading / inner-shadow. This will only work when borders are drawn.
filenamePrefix = "myTest";	//	Prefix for the generated files
filenameSuffix = "_isNice"; //	Suffix for the generated files
amountOfShapesToGenerate = 1000;	//	Amount of shapes to generate on a single run
possibleBorderColors = [c_black,c_gray,c_dkgray];	//	List of colors that can be used for drawing the border/outline
possibleInsideColors = [c_white,c_ltgray,make_color_rgb(200,200,200),make_color_rgb(191,255,228),make_color_rgb(255,221,191),make_color_rgb(239,255,191),make_color_rgb(222,191,255)];	//	List of colors to mask the inside of the shape with
generateShapeInis = false;	//	Wether ini-files, describing the shape,  for each shape should be generated

texturizeShape = true;	//	Defines wether shapes should be texturized with one of the subimages of sprTextures
applyBlendOnTexturizing = true;	//	Wether the applied texture should use a color for blending

//	The colors that are available for blending the texture. Will be choosend randomly
possibleTextureBlendColors = [make_color_rgb(191,255,228),make_color_rgb(255,221,191),make_color_rgb(239,255,191),make_color_rgb(222,191,255)];
