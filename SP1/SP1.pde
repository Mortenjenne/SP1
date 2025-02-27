ArrayList<Balloon> balloons = new ArrayList();
ArrayList<Football> footballs = new ArrayList();
Group wcGroups;
Country wcCountries;
WelcomeScreen welcome;
boolean showGroups = false;

void setup() {
  size(1050,450);
  
  wcGroups = new Group();
  wcCountries = new Country(wcGroups);
  welcome = new WelcomeScreen();
  
  //Make 100 instances of balloon 
  for(int i = 0; i < 100; i++) {
    float xPos;
    //Make random 50% change for xpos on each side
    if(random(1) < 0.5) {
      xPos = random(10,330);
    } else {
      xPos = random(700,1040);
    }
    balloons.add(new Balloon(xPos, random(height), random(3,20), random(256), random(256), random(256)));
  }
}

void draw() {
  smooth();
  
  //When ENTER is pressed groups A-D are shown
  if(showGroups) {
  wcGroups.makeGroup();
  wcGroups.groupName();
  wcGroups.makeShadow();
  wcCountries.loadCountries();
  //If user clicks mouse a new football is displayed
  for (Football ball : footballs) {
    ball.move();
    ball.display();
  }
  
  } else {
    //Until ENTER is pressed, a welcome screen with balloons is displayed
    welcome.draw();
    for(Balloon b : balloons) {
      b.balloonRise();
      b.displayBalloon();
    }
  }

}

void keyPressed() {
  if(key == ENTER) {
    showGroups = true;
  }
}

void mousePressed() {
footballs.add(new Football(wcGroups));
}
  
