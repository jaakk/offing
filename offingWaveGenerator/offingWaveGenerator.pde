//  Offing Wave Heightmap Generator

int waveAX = 350;
int waveAY = 200;
int waveAL = 13;

int waveBX = 550;
int waveBY = 250;
int waveBL = 10;

int waveCX = 200;
int waveCY = 550;
int waveCL = 5;

Wave waveA = new Wave(waveAX, waveAY, waveAL); 
Wave waveB = new Wave(waveBX, waveBY, waveBL);
Wave waveC = new Wave(waveCX, waveCY, waveCL);

PFont font;

void setup() {
  size(1600, 900);
  font = loadFont("Menlo-Regular-11.vlw");
}

void draw() {
  int paramX = int(mouseX);
  int paramY = int(mouseY);
  Wave waveA = new Wave(paramX, paramY, waveCL);

  background(255);
  noFill();
  stroke(0);
  strokeWeight(1);
  for (int y = 0; y < height; y += 6) {
    beginShape();
    for (int x = 0; x <= width; x += 6) {
      float a = (waveA.amp(x, y) + waveB.amp(x, y) + waveC.amp(x, y)) * 2;
      vertex(x, y + a);
    }
    endShape();
  }
  filter(BLUR, 5);

  fill(93, 178, 186, 200);
  noStroke();
  textFont(font, 11);
  ellipse(paramX, paramY, 4, 4);
  text("X:" + paramX + " Y:" + paramY, paramX + 10, paramY + 3);
  ellipse(waveBX, waveBY, 4, 4);
  text("X:" + waveBX + " Y:" + waveBY, waveBX + 10, waveBY + 3);
  ellipse(waveCX, waveCY, 4, 4);
  text("X:" + waveCX + " Y:" + waveCY, waveCX + 10, waveCY + 3);

  saveFrame("o-######.png");
}

