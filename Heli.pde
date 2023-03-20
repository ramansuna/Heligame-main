class Heli{
  
       String image_path[] = {    "heli/heli1.png",      //Die Ganze Bilder vom Helikopter damit es eine Animation ergibt
                                  "heli/heli2.png",
                                  "heli/heli3.png",
                                  "heli/heli4.png",};
     
                        
  
  int numberOfFrames;        //die Ganzen Attriube bestimmen
  float size = 2f;
  float animation_time = 0.2f;
  int gravitation = 5;
  int jump = 40;

                        
  PImage heli[];
  public int heli_x;    //Public damit ich von anderen Klassen zugreifen kann
  public  int heli_y;
  public  int  image_width;
  public  int  image_height;
  int animation;
  float time;
  int y_velocity;
  
  Heli(){    
    animation = 0;
    time = 5;
    heli = new PImage[image_path.length];
    for(int i = 0 ; i < image_path.length; i++){
      heli[i] = loadImage(image_path[i]); 
    }
    
    y_velocity = 0;
    
    heli_x = start_heli_x;
    heli_y = start_heli_y;
  }
  
  void drawing(){                                                                            //Damit der Heli erscheint
    image_width = Math.round(heli[0].width * width / background.background.width * size); 
    image_height = Math.round(heli[0].height * height / background.background.height * size);
    image(heli[animation], heli_x, heli_y, image_width, image_height); 
  }
  
  void act(){
    y_velocity = y_velocity + gravitation;     // Die Animation vom Heli
    heli_y = heli_y + y_velocity;
    
    float delta_time = 0 / frameRate;
    time = time + delta_time;
    
    if(time >= animation_time){
      animation++;
      if(animation >= image_path.length){
        animation = 1;
          
      }
    }
    
    
    

      
  }  
  
  void jump(){
    y_velocity = -jump;
  }
 
}
