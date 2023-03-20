 class Flugsaurier {
 
  int numberOfFrames;        //die Ganzen Attriube bestimmen
  float size = 2f;
  float animation_time = 4f;


                        
  PImage flugsaurier[];
  public int flugsaurier_x;
  public int flugsaurier_y;   //Public damit ich von anderen Klassen zugreifen kann
 public  int image_width;
 public  int image_height;
  int animation;
  float time;
  int tempo = -70;      //Das der Flugsaurier von Rechts kommt und die Geschwindigkeit
  
  
  
   String image_path[] = {    "flugsaurier/Flugsaurier.png",      //Die Ganze Bilder vom Helikopter damit es eine Animation ergibt
                              "flugsaurier/Flugsaurier4.png",};
                                 
  
  Flugsaurier(){    
    animation = 0;
    time = 5;
    flugsaurier = new PImage[image_path.length];
    for(int i = 0 ; i < image_path.length; i++){
      flugsaurier[i] = loadImage(image_path[i]); 
    }
    
   
    
    flugsaurier_x = start_flugsaurier_x;
    flugsaurier_y = start_flugsaurier_y;
  }
  
   void drawing(){                                                                  
    image_width = Math.round( flugsaurier[0].width * width / background.background.width * size);   //Damit der Flugsaurier erscheint, und Math damit es eine Runde zahl ergibt, weil wir Integer haben
    image_height = Math.round( flugsaurier[0].height * height / background.background.height * size);
    image(flugsaurier[animation], flugsaurier_x, flugsaurier_y, image_width, image_height); 
  }
  void act(){
    flugsaurier_x = flugsaurier_x + tempo;    // Die Animation vom Heli
    
    float delta_time = 0 / frameRate;      
    time = time + delta_time;
    
    if(time >= animation_time){
      animation++;
      if(animation >= image_path.length){
        animation = 0;
          
      }
    }
    if(flugsaurier_x <0){
      flugsaurier_x = width;
      flugsaurier_y = Math.round( random(10, height -5));    // Sobald der Flugsaurier Links out of Map ist, soll er von Rechts auf einer Random Position auf der Y achse spawnen und wieder auf uns zu fliegen
    }
      
}
}
