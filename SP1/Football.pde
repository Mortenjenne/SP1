class Football {
  float x, y, xSpeed, ySpeed, size;
  int counter;
  PImage football;
  int direction;
  Group group;

  Football(Group g) {
    group = g;
    football = loadImage("soccer-ball-png-26391.png");
    size = 20;
    //Speed of football
    xSpeed = 4;
    ySpeed = 4;
    //Start position direction of ball
    direction = 0;
    counter = 0;
  }

  //Display ball at x=0 and y=0
  void display() {
    image(football, x, y, size, size);
  }

  void move() {
    //Get variables from Group class
    float centerX = group.centerX;
    
    //Move ball with switch case
    switch(direction) {

    case 0: //Move down
      y += ySpeed;
      if (y > height-size-4) {
        direction = 1;
      }
      break;

    case 1: //Move right
      x += xSpeed;
      //Every second time the ball goes up in the middle of the screen
      if (counter % 2 == 0) {
        if (x > centerX - 14) {
          direction = 2;
        }
      } else {
        if (x > width -size-4) {
          direction = 2;
        }
      }
      break;

    case 2: //Move up
      y -= ySpeed;
      if (y < 2) {
        direction = 3;
      }
      break;

    case 3: // Move left
      x -= xSpeed;
      if (x < 2) {
        direction = 0;
        counter++;
      }
      break;
    }
  }
}
