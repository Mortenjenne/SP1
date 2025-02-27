class Group {
  float x, y, h;
  float centerX, centerY, groupHeight;
  float spacing,centerXOffset, sizeAdjustment, shadowLength, shadowSpacing, colorBoxWidth;
  color yellow, lightBlue;

  Group() {
    x = 20;
    y = 35;
    h = 40;
    sizeAdjustment = 32;
    centerXOffset = 10;
    spacing = 47;
    colorBoxWidth = 10;
    shadowLength = 9;
    shadowSpacing = 74;
    groupHeight = 160;
    
    // Find middle of width and height on blue rect
    centerX = x-x + 20 + (width - 30) / 2;
    centerY = y-y + 2 + (height - 10) / 2;
    
    //Colors for small rects
    yellow = color(255, 255, 5, 255);
    lightBlue = color(0, 218, 254, 255);
  }

  void makeGroup() {
    //Darkish background outline
    background(34, 34, 34, 255);

    //Dark blue rect "Background"
    noStroke();
    fill(33, 53, 80, 255);
    rect(x, y-33, width-30, height-10);

    //White line in the center
    strokeWeight(3);
    stroke(255);
    line(centerX, y-sizeAdjustment, centerX, height-10);

    //Make 16 white rect with blue and yellow color on far right in each rect
    for (int row = 0; row < groupHeight; row +=spacing) {
      for (int col = 0; col < 4; col++) {

        //White rect in group A and C
        noStroke();
        fill(255);
        rect(x, y+row, width/2-sizeAdjustment, h);
        rect(centerX+centerXOffset, y+row, width/2-sizeAdjustment, h);

        //White rect in group B and D
        rect(x, y+centerY+row, width/2-sizeAdjustment, h);
        rect(centerX+centerXOffset, y+centerY+row, width/2-sizeAdjustment, h);

        //Light blue rect in Group A and Group C
        fill(lightBlue);
        rect(centerX-20, y+row, colorBoxWidth, h);
        rect(width-25, y+row, colorBoxWidth, h);

        //Yellow color rect in Group B and D
        fill(yellow);
        rect(centerX-20, y+centerY+row, colorBoxWidth, h);
        rect(width-25, y+centerY+row, colorBoxWidth, h);
      }
    }
  }
  
  void makeShadow() {
    for (int row = 0; row < groupHeight; row +=spacing) {
      for (int col = 0; col < 4; col++) {

        //Flag shadow in Group A and C
        drawShadow(x+shadowSpacing, y+row, shadowLength, h);
        drawShadow(centerX+centerXOffset+shadowSpacing, y+row, shadowLength, h);

        //Flag shadow in Group B and D
        drawShadow(x+shadowSpacing, y+centerY+row, shadowLength, h);
        drawShadow(centerX+centerXOffset+shadowSpacing, y+centerY+row, shadowLength, h);
      }
    }
  }
  
  //Method to make Group names "A,B,C,D"
  void groupName() {
    PFont fatFont;
    fatFont = createFont("CodeNext-ExtraBold.otf", 24);
    textFont(fatFont);
    fill(lightBlue);
    textAlign(CENTER);
    text("GROUP A", centerX/2, y-10);
    text("GROUP C", centerX+265, y-10);
    fill(yellow);
    text("GROUP B", centerX/2, centerY+25);
    text("GROUP D", centerX+265, centerY+25);
  }

  //Method to make shadows after flags
  void drawShadow(float x, float y, float w, float h) {
    for (int i = 0; i < w; i++) { // Make more rect to create a gradient effect
      fill(240, map(i, 0, w, 235, 50)); // Grey color with opacity
      noStroke();
      rect(x + i, y, 1, h);
    }
  }
}
