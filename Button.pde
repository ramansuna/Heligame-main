class Button{
  PImage button_image;
  float x; 
  float y;
  boolean mouse_was_down = false;  
  
  
  Button(String image_path){
    button_image = loadImage(image_path);
  }
  
  void setPosition(float x, float y){   //Positio vom Button
    this.x = x - button_image.width/2;
    this.y = y - button_image.height/2;
   
  }
  
  void drawing(){
    image(button_image, x, y);
  }
  
  boolean clicked(){          //Sobald Maus gedrückt wird, startet es
    if(!mouse_was_down){
      if(mousePressed && isMouseInImage()){
        mouse_was_down = true;
      }
    }else{
      if(!mousePressed){
        mouse_was_down = false;
        return true;
      }
    }
    return false;
  }
  
  boolean isMouseInImage(){
    if(mouseX > x && mouseX < (x + button_image.width)){
      if(mouseY > y && mouseY < (y + button_image.height)){
        return true;
      }
    }
    
    return false;
  }
  
}
