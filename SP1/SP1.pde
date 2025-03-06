ArrayList<Balloon> balloons = new ArrayList<>();
ArrayList<Football> footballs = new ArrayList<>();

Group groups;
Country countries;
WelcomeScreen welcome;

boolean showGroups = false;

void setup() {
  size(1050, 450);
  smooth(2);

  groups = new Group();
  countries = new Country(groups);
  welcome = new WelcomeScreen();

  //Make 100 instances of balloon
  for (int i = 0; i < 100; i++) {
    float xPos;
    
    //Make random 50% change for xpos on each side. Leaves the middle of the screen without balloons
    if (random(1) < 0.5) {
      xPos = random(5, 300);
    } else {
      xPos = random(750, width-5);
    }
    balloons.add(new Balloon(xPos, random(height), random(3, 20), random(256), random(256), random(256)));
  }
}

void draw() {

  //When ENTER or mouse is pressed, groups A-D are shown
  if (showGroups) {
    groups.makeGroups();
    groups.groupNames();
    groups.makeShadows();
    countries.loadCountries();

    //If user press 'f' a new football is displayed
    for (Football ball : footballs) {
      ball.move();
      ball.display();
    }
    
  } else {
    //Until ENTER or mouseclick is pressed, a welcome screen with balloons is displayed
    welcome.draw();
    
    for (Balloon b : balloons) {
      b.displayBalloon();
    }
  }
}

//Method to back to welcome screen
void resetGroups() {
  showGroups = false;  // Return to welcome screen
  footballs.clear();   // Removes all the footballs
}

void keyPressed() {
  if (key == ENTER) {
    showGroups = true;
  }
  if (key == 'f'|| key == 'F' && showGroups) {
    footballs.add(new Football(groups,20));
    
  } else if (key == 'r'|| key == 'R') {
    resetGroups();
  }
}

void mousePressed() {
  showGroups = true;
}
