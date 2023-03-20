class Ground {
  String image_path = "Ground/Lava.png";  //Bild laden

  PImage ground1;        //Ground 1 erstellen
  PImage ground2;        //Ground 2 erstellen

  float ground1_x = 40;     //Bild startet bei x 40
  float ground1_y = 40;    //Bild startet bei y 40

  float ground2_x = width;
  float ground2_y = 40;

  Ground(){
    ground1 = loadImage(image_path);  //Bild 1 soll laden
    ground2 = loadImage(image_path);  //Bild 1 soll laden
  }

  void drawing(){                                          //Methode drawing
    image(ground1, ground1_x, ground1_y, width, height);  //
    image(ground2, ground2_x, ground2_y, width, height);
  }

  void act(){                          //Methode act
    ground1_x = ground1_x - speed;
    ground2_x = ground2_x - speed;

    if(ground1_x <= -width){          //sobald ground 1 fertig, kommt ground 2
      ground1_x = width + ground2_x;
    }

    if(ground2_x <= -width){        //sobald ground 2 fertig, kommt ground 1
      ground2_x = width + ground1_x;
    }

  }
 
 
}
