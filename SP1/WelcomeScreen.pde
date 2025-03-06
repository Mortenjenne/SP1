class WelcomeScreen {
  private PImage img;
  private PFont font;

  WelcomeScreen() {
    img = loadImage("background.jpg");
    font = createFont("BebasNeue-Regular.ttf", 45);
  }

  // Draw the background image
  void drawBackground() {
    image(img, 0, 0, width, height);
  }

  // Draw the welcome text
  void drawWelcomeText() {
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(font);
    text("Welcome to the 2018 FIFA World Cup in Russia!", width / 2, 50);
  }

  // Draw the instruction text
  void drawInstructions() {
    fill(255);
    textSize(30);
    text("Click or press ENTER to show groups A-D", width / 2, 100);
  }

  // Main that displays everything
  void draw() {
    drawBackground();
    drawWelcomeText();
    drawInstructions();
  }
}
