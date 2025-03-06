class Country {
  
  //Country flags
  private PImage[] flags = new PImage[16];

  //Country flag data names
  private String[] flagNames = {"Russia.png", "Saudi-Arabia.png", "Egypt.png", "Uruguay.png", "Portugal.png", "Spain.png", "Morocco.png", "Iran.png", "France.png", "Australia.png",
    "Peru.png", "Denmark.png", "Argentina.png", "Iceland.png", "Croatia.png", "Nigeria.png"};

  //Country names to display
  private String[] countries = {"RUSSIA", "SAUDI ARABIA", "EGYPT", "URUGUAY", "PORTUGAL", "SPAIN", "MOROCCO", "IRAN", "FRANCE", "AUSTRALIA",
    "PERU", "DENMARK", "ARGENTINA", "ICELAND", "CROATIA", "NIGERIA"};

  private float yText, textMargin, nextGroup;
  Group group;

  Country(Group g) {
    group = g;
    yText = 15;
    textMargin = 100;
    nextGroup = 40;
    float rectH = group.getRectH();

    //Loads the 16 different country flags with loadImage()
    for (int i = 0; i < flagNames.length; i++) {
      flags [i] = loadImage(flagNames[i]); // Loads image
      flags[i].resize(80, (int)rectH); // Change size so it fits white rect
    }
  }

  //Method to make country flags and names
  void loadCountries() {

    //Intilliaze flag and country settings
    imageMode(CORNER);
    PFont countryFont;
    countryFont = createFont("arial.ttf", 35);
    textFont(countryFont);
    fill(0);
    textAlign(LEFT, CENTER);

    //Get variables from Group class
    float x = group.getX();
    float y = group.getYGroup();
    float centerX = group.getCenterX();
    float centerXOffset = group.getCenterXOffset();
    float spacing = group.getSpacing();

    //Group A
    for (int i = 0; i < 4; i++) {
      image(flags[i], x, y+i*spacing);
      text(countries[i], x+textMargin, yText+spacing+i*spacing);
    }

    //Group B
    for (int i = 4; i < 8; i++) {
      image(flags[i], x, y+i*spacing+nextGroup);
      text(countries[i], x+textMargin, yText+spacing+i*spacing+nextGroup);
    }

    //Group C
    for (int i = 0; i < 4; i++) {
      image(flags[i+8], centerX+centerXOffset, y+i*spacing);
      text(countries[i+8], centerX+textMargin+centerXOffset, yText+spacing+i*spacing);
    }

    //Group D
    for (int i = 4; i < 8; i++) {
      image(flags[i+8], centerX+centerXOffset, y+i*spacing+nextGroup);
      text(countries[i+8], centerX+textMargin+centerXOffset, yText+spacing+i*spacing+nextGroup);
    }
  }
}
