class Football {
  
  private float x, y, xSpeed, ySpeed, size;
  private int counter;
  private PImage football;
  private int direction;
  private Group group;

  Football(Group g, float size) {
    group = g;
    football = loadImage("soccer-ball-png-26391.png");
    this.size = size;

    //Speed of football
    xSpeed = 4;
    ySpeed = 4;

    //Start position and direction of ball
    direction = 0;
    counter = 0;
  }

  //Display ball at x=0 and y=0
  void display() {
    image(football, x, y, size, size);
  }

  void move() {

    //Get variable from Group class
    float centerX = group.getCenterX();
    float centerY = group.getCenterY();

    //Move ball around canvas with switch case:
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
        if (x > centerX - 10) {
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
      //Every second time the ball goes left in the middle of the screen, other wise all the way to the top
      if (counter % 2 == 0) {
        if (y < 2) {
          direction = 3;
        }
      } else {
        if (y < centerY - 10) {
          direction = 3;
        }
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
