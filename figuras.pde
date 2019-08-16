class Figuras{
  int posx, posy, tamx, tamy, level, tipo;
  color borde=0, relleno;
  String txt="";
  boolean visible=true;
    Figuras(int xpos, int ypos, int xtam, int ytam, color rellenon, int tip){
    posx = xpos;
    posy = ypos;
    tamx = xtam;
    tamy = ytam;
    tipo = tip;
    relleno = rellenon;
    muestra();
  }

  void muestra(){
    if(visible==true){
        fill(relleno);
        stroke(borde);
        if(tipo==0){
          rect(posx, posy, tamx, tamy);
          shapes.append("rect( "+rx+", "+ry+", "+rw+", "+rh+" );");
        } else if(tipo==1){
          ellipse(posx, posy, tamx, tamy);
          shapes.append("ellipse( "+rx+", "+ry+", "+rw+", "+rh+" );");
        }
        

    }
  }

}