// i'll do this for one image, so you see the concept
// hope it works.. just off the top of my head
//
// first, you need a stored imageposition
int imgX, imgY;
// and an image
int maxpics = 7;

// mouseposition offset to image
//int mX, mY;
//Draggable d;
//Draggable d2;
//Draggable d3;
//Draggable ds[];

Draggable[] ds=new Draggable[maxpics+1];

// regular old setup
void setup()
{
  
 //d = new Draggable(50,50,300,200,1);
 //d2 = new Draggable(300,300,300,200,2);
 
 for (int nu = 1; nu < maxpics +1 ; nu++) {
   ds[nu] = new Draggable((nu*100)-100,((nu*100)-100),400,300,nu);
   //if (nu == 2) {java.awt.Toolkit.getDefaultToolkit().beep();}
   
 }
 
 
 size(1400,800);
 //img = loadImage("1_0.png");
 // Draggable d1 = d;
}

// draw method
void draw()
{
 background(100);
  for (int nu = 1; nu < maxpics + 1 ; nu++) {
  ds[nu].rollover(mouseX,mouseY); ds[nu].drag(mouseX,mouseY); ds[nu].display();
  //if (nu==2) { java.awt.Toolkit.getDefaultToolkit().beep();}
  }
  
  //d.rollover(mouseX,mouseY); d.drag(mouseX,mouseY); d.display();
  //d2.rollover(mouseX,mouseY); d2.drag(mouseX,mouseY); d2.display();
  
}

// mousepressed
void mousePressed()
{

// d.clicked(mouseX,mouseY);
// d2.clicked(mouseX,mouseY);
for (int nu = 1; nu < maxpics +1 ; nu++) {
  ds[nu].clicked(mouseX,mouseY);
  }
}

void mouseClicked()
  {
  //d.singleclick(mouseX,mouseY);
  //d2.singleclick(mouseX,mouseY);
  
for (int nu = 1; nu < maxpics +1 ; nu++) {
  ds[nu].singleclick(mouseX,mouseY);
  }
  
  }
  
void mouseReleased() {
  //d.stopDragging();
  //d2.stopDragging();
  
for (int nu = 1; nu < maxpics +1 ; nu++) {
  ds[nu].stopDragging();
  }
  
}

// any key pressed, will re-center the image
//void keyPressed()
//{
//centerImage();
//}

// center image function
//void centerImage()
//{
// imgX = (width-img.width)/2;
// imgY = (height-img.height)/2;
//}


// Click and Drag an object
// Daniel Shiffman 

// A class for a draggable thing

class Draggable {
  PImage img;
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  
  float x,y,w,h;          // Location and size
  float offsetX, offsetY; // Mouseclick offset
  int fNum;
  private int i = 0;
  
  Draggable(float tempX, float tempY, float tempW, float tempH, int fileNum) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    offsetX = 0;
    offsetY = 0;
    fNum=fileNum;
    img = loadImage(fNum+"_0.png");
  }

  // Method to display
  void display() {
    stroke(0);
    image(img,x,y,w,h);
    if (dragging) fill (50);
    //else if (rollover) fill(100);
    //else if (rollover) image(img,x,y,w/2,h/2);
    else fill(175,200);
    
    //rect(x,y,w,h);
    //img = loadImage("1_"+i+".png");
    
  }

  // Is a point inside the rectangle (for click)?
  void clicked(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      dragging = true;
      // If so, keep track of relative location of click to corner of rectangle
      offsetX = x-mx;
      offsetY = y-my;
      
      //works but even with dragging
      //i = i +1;
      //if (i== 2) {
      //i = 0; }
      //img = loadImage("1_"+i+".png");
      //java.awt.Toolkit.getDefaultToolkit().beep();
    }
  }
  
  void singleclick(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
    
    i = i +1;
    if (i== 2) {
    i = 0; }
    //img = loadImage("1_"+i+".png");
    img = loadImage(fNum+"_"+i+".png");
      //java.awt.Toolkit.getDefaultToolkit().beep();
    }
  }
  
  // Is a point inside the rectangle (for rollover)
  void rollover(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      rollover = true;
    } else {
      rollover = false;
    }
  }

  
  
  // Stop dragging
  void stopDragging() {
    dragging = false;
  }
  
  // Drag the rectangle
  void drag(int mx, int my) {
    if (dragging) {
      x = mx + offsetX;
      y = my + offsetY;
    }
  }

}
