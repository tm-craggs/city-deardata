// declaring common destinations
int HOME = 100;
int UNI = 850;
int SHOPS = 150;
int WORK = 320;

// declaring colours
color BLACK = color(0);
color RED = color(255, 0, 0);
color GREEN = color(10, 160, 10);
color BLUE = color(100, 120, 230);
color PURPLE = color(130, 0, 130);
color ORANGE = color(255, 165, 0);
color GRAY = color(128, 128, 128);

String[] week = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
int dayNum = 0;

int[] xCoords = {HOME, UNI, SHOPS}; // x-coords array for monday
color[] circleColours = {BLACK, GREEN, BLUE};  // category colours for monday
int currentIndex = 0; // index to track number of clicks
float circleY = 100; // y-coordinate of the circle
float circleRadius = 20;
float circleX = xCoords[currentIndex]; // start position of the circle
float speed = 0.05;


void setup() {
  // set up window and text size
  size(1200, 200);
  textSize(32);
}

void draw(){
  frameUpdate();  // draw static elements
  moveCircle();  // draw circle and move if needed
}

void frameUpdate(){
  float lineWidth = 1000;  // main line width
  float lineHeight = 20;  // main line height
  float centerX = (width - lineWidth) / 2; // centre line x cord
  float centerY = (height - lineHeight) / 2; // centre line y cord
 
  background(240);  // refresh background
 
  // draw static elements
  
  // line
  fill(GRAY);
  rect(centerX, centerY, lineWidth, lineHeight);
  fill(0);
  
  //title
  text("Dear Data: A week of movement", 360, 40);
  
  // subtitle
  textSize(16);
  text("Click to move through the day, press space to move through the week", 345, 60);
  
  // line labels
  textSize(32);
  text(week[dayNum], 100, 160);
  text("Home", 100, 60);
  text("20km", 1025, 60);
  fill(GREEN);
  text("Education", 460, 160);
  fill(BLUE);
  text("Shopping", 630, 160);
  fill(ORANGE);
  text("Leisure", 790, 160);
  fill(RED);
  text("Work", 920, 160);
  fill(PURPLE);
  text("Other", 1020, 160);
}

void moveCircle(){
  noStroke();
  fill(circleColours[currentIndex]);  // get circle colour from array
  ellipse(circleX, circleY, circleRadius * 2, circleRadius * 2);  // draw circle at relevent x and y
 
  // check the positive difference between the xcoord and current position is less than 1
  if (abs(circleX - xCoords[currentIndex]) > 1) {
    // move xcoord towards target
    circleX += (xCoords[currentIndex] - circleX) * speed; // find difference between cricle and xcoord, multiply by speed then add to xcoord
  } else {
    circleX = xCoords[currentIndex]; // set exact position of coordinate
  }
}

void mousePressed(){
  
  // when mouse pressed, move to next item in xCords array, looping back to start if nessesary
  
  // check if currentIndex is at the end of the array
  if (currentIndex == xCoords.length - 1){
    currentIndex = 0;  // reset current pos to start
  } else {
    currentIndex++;  // move to next array item
  }
  
}

void keyPressed(){
    if (key == ' ') { // if spacebar is pressed
      currentIndex = 0;  // move to first item in new array
      if(dayNum < 6){  // if the day is not sunday
        dayNum++;  // move to next day
      } else {
        dayNum = 0;  // move to monday
      }
     
     // switch statement for all destinations and circle colours
      switch(dayNum){
       
        case 0: // monday
          xCoords = new int[] {HOME, UNI, SHOPS};  // destinations
          circleColours = new color[] {BLACK, GREEN, BLUE};  // corresponding colours
          break;
        case 1: // tuesday
          xCoords = new int[] {HOME, UNI, 865, HOME};
          circleColours = new color[] {BLACK, GREEN, ORANGE, BLACK};
          break;
        case 2: // wednesday
          xCoords = new int[] {HOME, 200, 210, };
          circleColours = new color[] {BLACK, GREEN, PURPLE, RED};
          break;
        case 3: // thursday
          xCoords = new int[] {HOME, UNI, HOME, WORK};
          circleColours = new color[] {BLACK, GREEN, BLACK, RED};
          break;
        case 4: // friday
          xCoords = new int[] {HOME, UNI, HOME, 400};
          circleColours = new color[] {BLACK, GREEN, BLACK, ORANGE};
          break;
        case 5: // saturday
          xCoords = new int[] {HOME, WORK};
          circleColours = new color[] {BLACK, RED};
          break;
        case 6: // sunday
          xCoords = new int[] {HOME, 1005};
          circleColours = new color[] {BLACK, PURPLE};
          break;
         
      }
     
  }
}
