surface_set_target(mySurface);

draw_clear_alpha(c_red,0);

var spriteCenterX, spriteCenterY;
spriteCenterX = sprite_get_xoffset(self.sprite_index);
spriteCenterY = sprite_get_yoffset(self.sprite_index)

randomise();

var logFile = noone;

if (generateShapeInis == true) {
	logFile =  ini_open("random"+string(amountOfExistingFiles)+".ini");	
}

for (var i=0;i<(2+ceil(random(6)));i++) {
	
	var subimageIndex = floor(random(sprite_get_number(self.sprite_index)));
	var imageRotation = round(random(360));
	var xScale = min(0.2+random(1),1);
	var yScale = min(0.2+random(1),1);
	
	if (generateShapeInis == true) {
		ini_write_real("shapes",string(i)+"_subimage",subimageIndex);
		ini_write_real("shapes",string(i)+"_rotation",imageRotation);
		ini_write_real("shapes",string(i)+"_xscale",xScale);
		ini_write_real("shapes",string(i)+"_yscale",yScale);
	}
	
	draw_sprite_ext(self.sprite_index,subimageIndex,(size/2),(size/2),xScale,yScale,imageRotation,c_white,1);
}

populatePixelGridFromSurface(pixelGrid,mySurface);
draw_clear_alpha(c_red,0);
populatePixelAbstractionGridFromPixelGrid(abstractionGrid,pixelGrid,shapeOriginalColor);

var borderColor =  possibleBorderColors[floor(random(array_length_1d(possibleBorderColors)))];
var insideColor = possibleInsideColors[floor(random(array_length_1d(possibleInsideColors)))];

var shade = make_color_rgb(0,0,0);

//	Choose a shade intensity. You can modify this if you see a need to do so
var shadeColor = merge_color(insideColor,shade,choose(0.2,0.3,0.4,0.5));

if (generateShapeInis == true) {
	
	ini_write_real("colors","inside",insideColor);
	
	if (addOutline) {
		ini_write_real("colors","outline",borderColor);
	}
	
	if (addShading) {
		ini_write_real("colors","shade",shadeColor);
	}	
}
	
if (addOutline) {	
	generateBorderOnAbstractionGrid(abstractionGrid);
}

if (addShading) {	
	generateShadeOnAbstractionGrid(abstractionGrid);
}

drawShapeFromAbstractionGrid(abstractionGrid,borderColor,shadeColor,insideColor);

if (texturizeShape == true) {	
	
	gpu_set_blendmode_ext(bm_dest_colour,bm_src_colour);

	var blendColor = c_white;
	if (applyBlendOnTexturizing == true) {
		blendColor = possibleTextureBlendColors[floor(random(array_length_1d(possibleTextureBlendColors)))];
	}
	
	var textureSubimage = floor(random(sprite_get_number(sprTextures)+1));
	var textureRotation = random(360);
	
	if (generateShapeInis == true) {
		ini_write_real("texturize","subimage",textureSubimage);
		ini_write_real("texturize","rotation",insideColor);
		ini_write_real("texturize","blendcolor",blendColor);
	}
	
	draw_sprite_ext(sprTextures,textureSubimage,size/2,size/2,1,1,textureRotation,blendColor,1);
	gpu_set_blendmode(bm_normal);
}

ds_grid_clear(pixelGrid,noone);
ds_grid_clear(abstractionGrid,noone);

if (logFile != noone) {
	ini_close();
}

surface_reset_target();