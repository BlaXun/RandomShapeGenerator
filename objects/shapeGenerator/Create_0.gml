initShapeGenerator();

startTime = current_time;

numberOfShapesToCreate = 1000;
for(i=0;i<numberOfShapesToCreate;i++) {
	generateShape();
	saveShape();
}

_isDone = true;
endTime = current_time;

var secondsDuration, minutesDuration;
secondsDuration = (endTime-startTime)/1000;
minutesDuration = secondsDuration/60;

show_message("Done creating " + string(numberOfShapesToCreate) + " shapes in " + string(secondsDuration) +"s / " + string(minutesDuration) +"m");
game_end();