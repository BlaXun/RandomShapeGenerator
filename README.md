# RandomShapeGenerator
Creates "random" shapes by combining modified subimages and saves the shapes to your HDD (as png) for usage. 
Draws an outline, inner-shadow and texturizes the output. Customizable behavior. GameMakerStudio2 Project

**Samples**
![Sample Shapes](RandomSamples.PNG?raw=true "Random Samples")<br/><br/>

**Instructions**<br/>
Open the project in Game Maker Studio 2 (project was created with v2.2.5.481)
<br/>
The sprite which all shapes will be based on is the *sprShapes*. Change it as you see fit, but keep in mind that the basic shapes should all use the same color. This is important for the algorithm to find the shapes and generate outlines and inner-shadow.
In case you are interested in texturizing the output you can go ahead and change the subimages of the *sprTextures* sprite.
<br/>
You are ready to launch the application.<br/>
You most likely won't see a UI, as the application will start generating shapes directly and save them all into its directory.
<br/>
To modify behavior do the following
<br/>
* Open the *initShapeGenerator* Script
* Apply changes to the following variables
* *addOutline*  to toggle adding outlines. Outlines are required for shading to work.
* *addShading* to toggle adding shading. Outlines are required for this to work.
* *amountOfShapesToGenerate* defines how many shapes should be generated on a single run
* *possibleBorderColors* to add/reduce the colors used to apply a border
* *possibleInsideColors* to add/reduce the colors used to fill the inside of the shape
* *generateShapeInis* to toggle creation of ini-files for each generated shape. This could later be used to reconstruct single shapes
* *texturizeShape* to toggle texturizing
* *applyBlendOnTexturizing* to toggle other colors than c_white to be applied on the texturizing subimage.
* *possibleTextureBlendColors* to add/reduce the colors used when *applyBlendOnTexturizing* is set. The project starts with some nice pastel colors.
<br/>

**How does this work?**<br/>
Its quite simple. All it needs are some subimages on a single sprite. The algorithm will stack randomly chosen subimages on top of each other while each of these subimages can be scaled and rotated.
Next up, the stacked image will get abstracted into a ds_map. All corners are detected, outlines are drawn. Next up edges are detected and shading is "applied". Now that the ds_map holds all the information it is simply drawn to screen and, if activated, a texture is drawn on-top using blend modes. Finally the image is saved... and thats it.


**Where to find the generated shapes**<br/>
As soon as shape generating is done you will get a popup telling you how long it took to create those shapes.
The shapes themself will be located in **%LOCALAPPDATA%/RandomShapeGenerator** - unless your renamed the project.

**Why is this "slow"?**<br/>
For all of this to work I relied heavily on pixel functions in GML. These are slow... you probably could do all this with shaders ...but my knowledge on that topic is lacking... and I was looking for a fun side-project.. so yeah.. thats my excuse. Its not horrible though. <br/>Give it a try!
