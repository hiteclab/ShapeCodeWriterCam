class Rectangulo{
  int posx, posy, tamx, tamy, level;
  color borde=0, relleno;
  String txt="";
  boolean visible=true;
    Rectangulo(int xpos, int ypos, int xtam, int ytam, color rellenon){
    posx = xpos;
    posy = ypos;
    tamx = xtam;
    tamy = ytam;
    relleno = rellenon;
    muestra();
  }

  void muestra(){
    if(visible==true){
        fill(relleno);
        stroke(borde);
        rect(posx, posy, tamx, tamy);
    }
  }

}