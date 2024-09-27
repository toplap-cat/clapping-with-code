/* Implementation of Steve Reich's Clapping Music in P5Live by Julia Múgica */

let clap1 = [1,1,1,0,1,1,0,1,0,1,1,0];
let clap2 = [1,1,1,0,1,1,0,1,0,1,1,0];

let note = 0;
let rep = 0;

function setup() {
	createCanvas(windowWidth, windowHeight);
}

function draw() {
	noStroke();
	background(0);
	frameRate(5);
	
	clapping(clap1[note], 0, 0, windowWidth/2, windowHeight);
	clapping(clap2[note], windowWidth/2, 0, windowWidth, windowHeight);

	if(note==clap1.length){
		note = 0;
		rep++;
	}
	if(rep == 7){
		rep = 0;
		let first = clap2.shift(); 
		clap2.push(first);
	}
	note++;
}

function clapping(c, x1, y1, x2, y2){
	if(c == 1){
		fill(255);
	} else {
		fill(0);
	}
	rect(x1, y1, x2, y2);
}
