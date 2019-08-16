import processing.video.*;
import java.awt.event.KeyEvent;

Capture camara;
StringList shapes;

int rx=0, ry=0, rw=0, rh=0;
int mpx, mpy, mrx, mry;
int ok=0, tipo=0;
int linea=1;
int[][] objetos= new int[width/2][height];


ArrayList<Figuras> rectangulos;
//ArrayList<Rectangulo> rectangulos;

void setup(){
//size(width, height);
  fullScreen();
  //size(320, 240);
  fill(0);
  ellipseMode(CORNER);
    camara = new Capture(this);
  camara.start();
     shapes = new StringList();
     rectangulos = new ArrayList<Figuras>();// Create an empty ArrayList
     //rectangulos = new ArrayList<Rectangulo>();// Create an empty ArrayList

       background(255);
  shapes.append("void setup(){");
  shapes.append("fullScreen();");
cursor(CROSS);

}

void draw(){
  //background(255);
    if (camara.available() == true)
{
camara.read();
}
//image(camara, 0, 0, width, height);
background(255);
fill(0);
  //text("rect( "+rx+", "+ry+", "+rw+", "+rh+" );",width/2+20, 20);
  text("( "+mouseX+", "+mouseY+" )", 10, 20);
  line(width/2, 0, width/2, height);
 //println(rectangulos.size());
    
//for(int j = rectangulos.size()-1 ; j > -1 ; j--){
for(int j = 0; j < rectangulos.size() ; j++){

    rectangulos.get(j).muestra();
    fill(0);
    if(rectangulos.get(j).tipo==0){
      text("rect( "+rectangulos.get(j).posx+", "+rectangulos.get(j).posy+", "+rectangulos.get(j).tamx+", "+rectangulos.get(j).tamy+" );",width/2+20, 20*(j+1));
    }
    if(rectangulos.get(j).tipo==1){
      text("ellipse( "+rectangulos.get(j).posx+", "+rectangulos.get(j).posy+", "+rectangulos.get(j).tamx+", "+rectangulos.get(j).tamy+" );",width/2+20, 20*(j+1));
    }    

      } // fin for
fill(255);
      
  if(ok==1 && tipo==0)rect(rx,ry,rw,rh);
  if(ok==1 && tipo==1)ellipse(rx,ry,rw,rh);

  
if(mousePressed==true&& tipo==0)rect(rx,ry,mouseX-rx,mouseY-ry);
if(mousePressed==true&& tipo==1)ellipse(rx,ry,mouseX-rx,mouseY-ry);


stroke(125);
line(0,mouseY, width,mouseY); // linea horizontal
line(mouseX,0, mouseX, height); // linea vertical
stroke(0);

}

void keyPressed(){
//println(shapes);
if (key == CODED){

      if(keyCode== KeyEvent.VK_F1){
          shapes.append("}");
        String[] mapasave = shapes.array();
        saveStrings("data/data.pde", mapasave);
    }

}
}

void mousePressed(){
  ok = 0;
  rx=mouseX;
  ry=mouseY;
  if (mouseButton == LEFT) {
    tipo=0;
  } else if (mouseButton == RIGHT) {
    tipo=1;
  } 
  
}

  
void mouseReleased(){
  rw=mouseX-rx;
  rh=mouseY-ry;
  //rectangulos.add(new Rectangulo(rx, ry, rw,rh, #FFFFFF));
  rectangulos.add(new Figuras(rx, ry, rw,rh, #FFFFFF,tipo));

//rectangulos.get(lastpressed).borde = #FFCC00;
      ok=1;
  }