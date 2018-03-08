PImage img;
color c;
int ITER = 500000;
int ANGLES = 15;
int SIZE = 10;
int OPACITY = 70;
String NAME = "trump";
int x,y;
int RESOLUTION[] = {720,180};

void sizing(PImage i) {
  int r;
  // if(i.width >= i.height) {
    r = 10000*RESOLUTION[0]/i.width;
  // } else {
  //   r = 10000*RESOLUTION[1]/i.height;
  // }
  surface.setSize(r*i.width/10000, r*i.height/10000);
  i.resize(r*i.width/10000, r*i.height/10000);
}

void setup() {
  size(200,200);
  img = loadImage(NAME + ".jpg");
  sizing(img);
  imageMode(CENTER);
  noStroke();
  background(0);
  noLoop();
}

void draw() {
  for(int i = 0; i < ITER; i++) {
    x = floor(random(img.width));
    y = floor(random(img.height));
    c = img.get(x,y);
    fill(c,OPACITY);
    beginShape();
    for(int a = 0; a < random(ANGLES); a++) {
      x+=random(-SIZE,SIZE);
      y+=random(-SIZE,SIZE);
      vertex(x,y);
    }
    endShape(CLOSE);
  } 
  save("generated-" +  NAME + ".jpg");
}