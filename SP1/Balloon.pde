class Balloon {
  
  private float x, y, size;
  private color c;

  Balloon(float x, float y, float size, float r, float g, float b) {
    
    this.x = x;
    this.y = y;
    this.size = size;
    c = color(r, g, b);
  }

  void balloonRise() {
    //Balloon ascend
    y -= getBalloonSpeed(1, 2); // Balloons assend with different speeds
    
    //If balloon out of bound, start over from bottom
    if (y < -size) {
      y = height + size;
    }
  }

  //Method to display balloon
  void displayBalloon() {
    fill(c);
    noStroke();
    ellipse(x, y, size, size);

    //Call method to get balloons to rise
    balloonRise();
  }

  //Method to generate different balloonspeeds
  float getBalloonSpeed(float x, float y) {
    return random(x, y);
  }
}
