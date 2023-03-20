class Gameoverbild{
  String image_path = "gameover/GameOver2.png"; 
  
  PImage gameoverbild;
  
  Gameoverbild(){
    gameoverbild = loadImage(image_path); // Background soll bild Background laden
  }
  
  void drawing(){ //neue Methode drawing
    image(gameoverbild, 0, 0, width, height); //der Background soll höhe und tiefe 0 sein
  }
  
}
