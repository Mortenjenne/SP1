class Group {
  
  private float x, y, rectH, rectW, yGroup;
  private float centerX, centerY, groupHeight;
  private float spacing, centerXOffset, sizeAdjustment, shadowLength, shadowSpacing, colorBoxWidth;
  private color yellow, lightBlue;

  Group() {
    x = 10;
    y = 10;
    rectH = 37;//Height of white rects, flags, colored small rects
    rectW = width/2-30;//Width of white rects
    yGroup = 42; //Position to start white rect
    sizeAdjustment = 20;
    centerXOffset = 10;
    spacing = 45; //Spacing between each group
    colorBoxWidth = 10; //Width of the small colored rects
    shadowLength = 16;//Lenght of shadow
    shadowSpacing = 70; // Point where the flag's width ends, marking the starting position of the shadow
    groupHeight = 180; // Height that determines where to stop drawing the white rectangles
    centerX = width/2; //Middle of width
    centerY = height/2; //Middle of height

    //Colors for small rects
    yellow = color(255, 255, 5, 255);
    lightBlue = color(0, 218, 254, 255);
  }

  void makeGroups() {

    //Darkish background outline
    background(34, 34, 34, 255);

    //Dark blue rect "Background"
    noStroke();
    fill(33, 53, 80, 255);
    rectMode(CENTER);
    rect(width/2, height/2, width-sizeAdjustment, height-sizeAdjustment);

    //White line in the center
    strokeWeight(3);
    stroke(255);
    line(centerX, y, centerX, height-y);

    //Make 16 white rect with blue and yellow color on far right in each rect
    for (int row = 0; row < groupHeight; row +=spacing) { 
        rectMode(CORNER);

        //White rect in group A and C
        noStroke();
        fill(255);
        rect(x, yGroup+row, rectW, rectH);
        rect(centerX+centerXOffset, yGroup+row, rectW, rectH);

        //White rect in group B and D
        rect(x, yGroup+centerY+row-y/2, rectW, rectH);
        rect(centerX+centerXOffset, yGroup+centerY+row-y/2, rectW, rectH);

        //Light blue rect in Group A and Group C
        fill(lightBlue);
        rect(centerX-sizeAdjustment, yGroup+row, colorBoxWidth, rectH);
        rect(width-sizeAdjustment, yGroup+row, colorBoxWidth, rectH);

        //Yellow color rect in Group B and D
        fill(yellow);
        rect(centerX-sizeAdjustment, yGroup+centerY+row-y/2, colorBoxWidth, rectH);
        rect(width-sizeAdjustment, yGroup+centerY+row-y/2, colorBoxWidth, rectH);
    }
  }
  //Method to draw shadows
  void makeShadows() {
    for (int row = 0; row < groupHeight; row +=spacing) {
      
        //Flag shadow in Group A and C
        drawShadows(x+shadowSpacing, yGroup+row, shadowLength, rectH);
        drawShadows(centerX+centerXOffset+shadowSpacing, yGroup+row, shadowLength, rectH);

        //Flag shadow in Group B and D
        drawShadows(x+shadowSpacing, yGroup+centerY+row-y/2, shadowLength, rectH);
        drawShadows(centerX+centerXOffset+shadowSpacing, yGroup+centerY+row-y/2, shadowLength, rectH);
    }
  }

  //Method to make Group names "A,B,C,D"
  void groupNames() {

    PFont fatFont;
    fatFont = createFont("CodeNext-ExtraBold.otf", height*0.06);
    textFont(fatFont);
    textAlign(CENTER, CENTER);

    //Group A top left lightblue color
    fill(lightBlue);
    text("GROUP A", centerX*0.5, height*0.058);

    //Group C top right lightblue color
    text("GROUP C", centerX*1.50, height*0.058);

    // Group B middle left yellow color
    fill(yellow);
    text("GROUP B", centerX*0.5, height*0.545);

    // Group D middle left yellow color
    text("GROUP D", centerX*1.50, height*0.545);
  }

  //Method to make shadows after flags
  void drawShadows(float x, float y, float w, float h) {
    for (int i = 0; i < w; i++) { // Make more rect to create a gradient effect
      fill(220, map(i, 0, w, 235, 50)); // Grey color with opacity
      noStroke();
      rect(x + i, y, 1, h);
    }
  }

  //Getters to use in other classes
  float getCenterX() {
    return centerX;
  }

  float getCenterY() {
    return centerY;
  }

  float getRectH() {
    return rectH;
  }

  float getX() {
    return x;
  }

  float getYGroup() {
    return yGroup;
  }

  float getCenterXOffset() {
    return centerXOffset;
  }

  float getSpacing() {
    return spacing;
  }
}
