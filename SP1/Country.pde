class Country {
  //Country flags
  PImage[] flags = new PImage[16];

  //Country flag data names
  String[] flagNames = {"Russia.png", "Saudi-Arabia.png", "Egypt.png", "Uruguay.png", "Portugal.png", "Spain.png", "Morocco.png", "Iran.png", "France.png", "Australia.png",
    "Peru.png", "Denmark.png", "Argentina.png", "Iceland.png", "Croatia.png", "Nigeria.png"};

  //Country names to display
  String[] countries = {"RUSSIA", "SAUDI ARABIA", "EGYPT", "URUGUAY", "PORTUGAL", "SPAIN", "MOROCCO", "IRAN", "FRANCE", "AUSTRALIA",
    "PERU", "DENMARK", "ARGENTINA", "ICELAND", "CROATIA", "NIGERIA"};

  float x,y,h,xposC;
  float spacing, groupHeight, rectCenterX, rectCenterY, nextGroup;
  
  Group group;

  Country(Group g) {
    group = g;
    x = 17.8;
    y = 23;
    h = 63;
    nextGroup = 34;
    //Text right side spacing
    xposC = 106;
    
    //Loads the 16 different country flags with loadImage()
    for (int i = 0; i < flagNames.length; i++) {
      flags [i] = loadImage(flagNames[i]); // Loads image
      flags[i].resize(81, 64); // change size so it fits white rect
    }
  }
  //Method to make country flags and names
  void loadCountries() {
    //Intilliaze flag and country settings
    imageMode(CORNER);
    PFont countryFont;
    countryFont = createFont("Arial", 35);
    textFont(countryFont);
    fill(0);
    textAlign(LEFT);
    
    //Get variables from Group class 
    float centerX = group.centerX;
    float spacing = group.spacing;
    float centerXOffset = group.centerXOffset;

    //Group A
    for (int i = 0; i < 4; i++) {
      image(flags[i], x, y+i*spacing);
      text(countries[i], centerX/5+centerXOffset, y+spacing+i*spacing);

    }
    //Group B
    for (int i = 4; i < 8; i++) {
      image(flags[i], x, y+i*spacing+nextGroup);
      text(countries[i], centerX/5+centerXOffset, y+spacing+i*spacing+nextGroup);
    }
    //Group C
    for (int i = 0; i < 4; i++) {
      image(flags[i+8], centerX+7, y+i*spacing);
      text(countries[i+8], centerX+xposC, y+spacing+i*spacing);
    }
    //Group D
    for (int i = 4; i < 8; i++) {
      image(flags[i+8], centerX+7, y+i*spacing+nextGroup);
      text(countries[i+8], centerX+xposC, y+spacing+i*spacing+nextGroup);
    }
  }

    
  
}
