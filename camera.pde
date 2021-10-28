import processing.video.*;
//import controlP5.*;
Capture image;


//PImage image;
PImage[] units;

void setup() {
  size(1280, 720);
  String[] cameras = Capture.list();
  image = new Capture(this, cameras[0]);
  image.start();
  //image = loadImage("hi.jpeg");


  units = new PImage[10];

  for (int i = 0; i < units.length; i++) {
    float a =random(90);
    if(a<30){
    units[i] = loadImage("series/" + "img"+(i + 1) + ".png");
    }
    if(a>30 && a < 60){
    units[i] = loadImage("seriesv2/" + "img"+(i + 1) + ".png");
    }
       if(a>60 && a < 90){
    units[i] = loadImage("seriesv3/" + "img"+(i + 1) + ".png");
    }
  }

  blendMode(ADD);
}

void draw() {
  if (image.available() == true) {
    image.read();
  }
    


  pushMatrix();
  background(#FFFCB5);

  int gridSize = mouseX/10 +10;
  image.loadPixels();

  if (image.pixels.length > 0) {
    for (int x = 0; x < width; x += gridSize) {
      for (int y = 0; y < height; y += gridSize) {
        color c = image.pixels[x + y * width];

        float redChannel = red(c);
        int unitIndexRedChannel = round(map(redChannel, 0, 255, 0, units.length - 1));

        float greenChannel = green(c);
        int unitIndexGreenChannel = round(map(greenChannel, 0, 255, 0, units.length - 1));

        float blueChannel = blue(c);
        int unitIndexBlueChannel = round(map(blueChannel, 0, 255, 0, units.length - 1));
        pushMatrix();
   translate(x+gridSize/2, y+gridSize/2);
        tint(#FF92BC);
        image(units[unitIndexRedChannel], -gridSize/2, -gridSize/2, gridSize, gridSize);
//rotate(radians(a*10 %360));
        tint(#4DFFCC);
        image(units[unitIndexGreenChannel], -gridSize/2, -gridSize/2, gridSize, gridSize);
//rotate(radians(a*10 %360));
        tint(#7171FF);
        image(units[unitIndexBlueChannel], -gridSize/2,-gridSize/2, gridSize, gridSize);
//rotate(radians(a*10 %360));
        popMatrix();
      }
    }
  }
  popMatrix();
    blendMode(NORMAL);
}
