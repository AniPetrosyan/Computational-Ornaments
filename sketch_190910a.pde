PImage myImage;



void setup() {
  size(1920, 1080);
tint(255,127);
frameRate(30);


  myImage = loadImage("hi.jpeg");
  myImage.loadPixels();

  strokeCap(SQUARE);
  blendMode(MULTIPLY);
}

void draw() {
  //background(255);
  noFill();

  int gridSize = 16;
  int crossSize = 14;
  int margin = 20;

  color colorA = #FFE4D1;   
  color colorB = #FF1EE9;
  color colorC = #EA53FF;
  
  
  
  //image(myImage, 0, 0);
  for (int x = margin; x < width - margin; x += gridSize) {
    for (int y = margin; y < height - margin; y += gridSize) {
      int centerX = x + gridSize/2;
      int centerY = y + gridSize/2;

      int index = x + y * width;

      color pixelColor = myImage.pixels[index];

      float redChannel = red(pixelColor);
      float redStrokeWeight = map(redChannel, 0, 255, 1, crossSize);

      float greenChannel = green(pixelColor);
      float greenStrokeWeight = map(greenChannel, 0, 255, 1, crossSize);

      float blueChannel = blue(pixelColor);
      float blueStrokeWeight = map(blueChannel, 0, 255, 1, crossSize);

      stroke(colorA);
      strokeWeight(redStrokeWeight);

      //rect(x, y, gridSize, gridSize);
      pushMatrix();
      translate(centerX, centerY);

      stroke(colorA);
      strokeWeight(redStrokeWeight);

      //line(-crossSize / 2, -crossSize / 2, crossSize / 2, crossSize / 2);
      line(crossSize / 2, -crossSize / 2, -crossSize / 2, crossSize / 2);

      stroke(colorB);
      strokeWeight(greenStrokeWeight);

      line(-crossSize / 2, -crossSize / 2, crossSize / 2, crossSize / 2);
      //line(crossSize / 2, -crossSize / 2, -crossSize / 2, crossSize / 2);
      //ellipse(0, 0, gridSize, gridSize);

      stroke(colorC);
      strokeWeight(blueStrokeWeight);
      
      line(crossSize / 2, -crossSize / 2, -crossSize / 2, crossSize / 2);
      line(-crossSize / 2, -crossSize / 2, crossSize / 2, crossSize / 2);
      
      popMatrix();
      
      
    }
  }
}
