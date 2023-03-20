import processing.sound.*;
SoundFile file;
import java.awt.Rectangle;



float speed = 40;    
float gap = 250;
int start_heli_x = 100;    //Start Punkt Heli
int start_heli_y = 100;

int start_flugsaurier_x; //Start Flugsaurer
int start_flugsaurier_y;


  boolean game_started = false;  //Game Started auf False
  String play_button_path = "Button/play2.png";  
  float play_button_x ;
  float play_button_y;


boolean gameover = false; //Gameover false


Background background;  //Instanzieren
Ground ground;
Flugsaurier flugsaurier;
Gameoverbild gameoverbild;

Heli heli;
Button play_button;

void setup(){
  file = new SoundFile(this, "Sound/HeliSound.mp3");   //Sound 
  file.loop(); 
  System.out.println("Das Game startet");
  size(1280,800);             //Auflösung vom Spiel
  start_flugsaurier_x = width;  //Start Flugsaurier
  start_flugsaurier_y = 100;
  play_button_x = width/2;  //Start Button, damit immer in Mitte vom Bild
  play_button_y = height/2;
  frameRate(60);
  background = new Background();
  ground = new Ground();
  heli = new Heli();
  flugsaurier = new Flugsaurier();
  gameoverbild = new Gameoverbild();
  
  play_button = new Button(play_button_path);
  play_button.setPosition(play_button_x, play_button_y);
}

void draw(){
 
  if(!game_started){    //Erst wenn, Button geklickt wird, startet Game
  play_button.drawing();
  if(play_button.clicked()){
    game_started = true;
    gameover = false;
  }
  
  }
 if(gameover){                        
   System.out.println("NOOOOOOOOOOB");
    gameoverbild.drawing();
    return;
    
  }
  
  
  if(game_started){   //Sobald Button geklickt wird, startet diese Funktion
    
  
  ground.act();
  heli.act();
  flugsaurier.act();
  background.drawing();
  
  ground.drawing();
  heli.drawing();

  flugsaurier.drawing();
 
Rectangle flugsaurier_rect = new Rectangle(flugsaurier.flugsaurier_x, flugsaurier.flugsaurier_y, flugsaurier.image_width, flugsaurier.image_height); //Die Hitbox vom Flugsaurier
Rectangle heli_rect = new Rectangle(heli.heli_x, heli.heli_y, heli.image_width, heli.image_height); //Die Hitbox vom Heli
if(flugsaurier_rect.intersects(heli_rect)){  //Sobald Heli und Flugsaurier kollidiere, stoppt das Game
  gameover = true;
  }
  }
  
  
  if(heli.heli_y > height){   //Sobald Heli und Flugsaurier out of Map, stoppt das Game
      gameover = true;
    }
}
 

void keyReleased(){  // Wenn man leertaste drückt kann sich der Heli bewegen
  if(key == ' '){ 
    heli.jump();
  }
  
  
  
}
