
class Balloon {
  float x, y, size;
  color c;

  Balloon(float tempX, float tempY, float tempSize, float r, float g, float b) {
    x = tempX;
    y = tempY;
    size = tempSize;
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
}
}
