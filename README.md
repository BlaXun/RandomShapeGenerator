# RandomShapreGenerator
Creates "random" shapes by combining modified subimages. 
Draws an outline, inner-shadow and texturizes the output. Customizable behavior. GameMakerStudio2 Project

<b>Instructions</b><br/>
Open the project in Game Maker Studio 2 (project was created with v2.2.5.481)
<br/>
The sprite which all shapes will be based on is the <i>sprShapes</i>. Change it as you see fit, but keep in mind that the basic shapes should all use the same color. This is important for the algorithm to find the shapes and generate outlines and inner-shadow.
In case you are interested in texturizing the output you can go ahead and change the subimages of the <i>sprTextures</i> sprite.
<br/>
You are ready to launch the application.<br/>
You most likely won't see a UI, as the application will start generating shapes directly and save them all into its directory.
<br/>
To modify behavior do the following
<br/>
<ul>
<li>Open the <i>initShapeGenerator</i> Script</li>
<li>Apply changes to the following variables</i>
<li><i>amountOfShapesToGenerate</i> defines how many shapes should be generated on a single run</li>
<li><i>possibleBorderColors</i> to add/reduce the colors used to apply a border</li>
<li><i>possibleInsideColors</i> to add/reduce the colors used to fill the inside of the shape</i>
<li><i>generateShapeInis</i> to toggle creation of ini-files for each generated shape. This could later be used to reconstruct single shapes</li>
<li><i>texturizeShape</i> to toggle texturizing</li>
<li><i>applyBlendOnTexturizing</i> to toggle other colors than c_white to be applied on the texturizing subimage.</li>
<li><i>possibleTextureBlendColors</i> to add/reduce the colors used when <i>applyBlendOnTexturizing</i> is set. The project starts with some nice pastel colors.</li>
</ul>
<br/>
<b>Where to find the generated shapes</b><br/>
As soon as shape generating is done you will get a popup telling you how long it took to create those shapes.
The shapes themself will be located in <b>%LOCALAPPDATA%/RandomShapeGenerator</b> - unless your renamed the project.
<br/>
<b>Why is this "slow"?</b><br/><br/>
For all of this to work I relied heavily on pixel functions in GML. These are slow... you probably could do all this with shaders ...but my knowledge on that topic is lacking... and I was looking for a fun side-project.. so yeah.. thats my excuse. Its not horrible though. <br/>Give it a try!
<br/><br/>
<b>Samples</b><br/>
<img url="https://i.imgur.com/RREWYds.png"></img>
