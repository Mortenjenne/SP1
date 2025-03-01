class WelcomeScreen {
  PImage img;
  
  WelcomeScreen() {
    img = loadImage("background.jpg");
  }

  void draw() {
    //background(33, 53, 80, 255);
    image(img, 0, 0, width, height);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(height*0.1);
    text("Welcome to the 2018 FIFA World Cup in Russia!", width / 2, 50);
    textSize(25);
    text("Click or press ENTER to show groups A-D", width / 2, 100);
  }
}
