var filename = filenamePrefix+string(amountOfExistingFiles)+filenameSuffix+".png"
surface_save(mySurface, filename);
amountOfExistingFiles +=1;

// Files are located in %LOCALAPPDATA%