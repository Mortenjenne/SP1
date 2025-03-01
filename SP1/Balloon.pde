
class Balloon {
  float x, y, size;
  color c;

  Balloon(float x, float y, float size, float r, float g, float b) {
    this.x = x;
    this.y = y;
    this.size = size;
    c = color(r, g, b);
  }
  
  void balloonRise() {
    //Balloon ascend
    y -= 1;
    //If balloon out of bound start over from bottom
    if(y < -size) {
      y = height + size;
    }
  }
  
  void displayBalloon() {
    fill(c);
    noStroke();
    ellipse(x,y,size,size);
    
    //Call method to get balloons to rise
    balloonRise();
}
}
