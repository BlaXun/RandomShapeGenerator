initShapeGenerator();

startTime = current_time;

for(i=0;i<amountOfShapesToGenerate;i++) {
	generateShape();
	saveShape();
}

_isDone = true;
endTime = current_time;

var secondsDuration, minutesDuration;
secondsDuration = (endTime-startTime)/1000;
minutesDuration = secondsDuration/60;

show_message("Done creating " + string(amountOfShapesToGenerate) + " shapes in " + string(secondsDuration) +"s / " + string(minutesDuration) +"m");

game_end();
