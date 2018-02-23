//Declaro los personajes y variables con los que trabajaré.
personaje sheriff;
personaje robot;
personaje p1;
personaje p2;
personaje p3;
personaje sheriffp2;
personaje robotp2;
personaje p1p2;
personaje p2p2;
personaje p3p2;

int x;
int y;
int jugador1 = 0;
int jugador2 = 0;
int escenario = 0;
int atacante = 1;

//Inicializo a mis personajes y les doy valores.
void setup(){
  size(1000,700);
  sheriff = new personaje("Sheriff",400,ceil(random(50,100)),0);
  robot = new personaje("PLC-BOT",400,ceil(random(50,100)),1);
  p1 = new personaje("1101", 400,50,2);
  p2 = new personaje("0010", 400,50,3);
  p3 = new personaje("1110", 400,50,4);
  sheriffp2 = new personaje("Sheriff",400,ceil(random(50,100)),5);
  robotp2 = new personaje("PLC-BOT",400,ceil(random(50,100)),6);
  p1p2 = new personaje("1101", 400,50,7);
  p2p2 = new personaje("0010", 400,50,8);
  p3p2 = new personaje("1110", 400,50,9);
  
   background(0);
}

//Comienzo
void draw(){
  if(escenario == 0){
  //Primera pantalla(Pantalla de inicio)
  textAlign(CENTER);
  textSize(100);
  fill(random(255),random(255),random(255),80);
  text("R A Z E", width/2,200);
  fill(0);
  text("R A Z E", width/2,205);
  textSize(20);
  fill(150);
  text("Para iniciar presiona\nENTER",width/2,600);
  }
  if (key == ENTER){
    escenario = 1;
  }
  
  //Segunda pantalla(Pantalla de selección de personaje)
  if(escenario == 1){
    background(0);
    noStroke();
    
    pushMatrix();
    //Sheriff
    fill(150);
    scale(.2);
    translate(1900,800);
    sheriff.Display();
    
    //Robot
    fill(150);
    translate(800,100);
    robot.Display();
    
    //Cabeza 1101
    fill(150);
    translate(-1150,800);
    p1.Display();
    
    //0010
    fill(150);
    translate(800,0);
    p2.Display();
    
    //1110
    fill(150);
    translate(800,0);
    p3.Display();
    popMatrix();
    
    fill(150);
    text("q,y.",370,280);
    text("w,u.",510,280);
    text("e,i.",290,470);
    text("r,o.",450,470);
    text("t,p.",610,470);
    textSize(50);
    text("SELECCIÓN DE PERSONAJE",width/2,100);
    textSize(20);
    text("Selecciona a tu personaje presionando la letra correspondiente\nJugador 1: q,w,e,r,t\nJugador 2: y,u,i,o,p",width/2,600);

    if(key == 'q'){
      
      jugador1 = 1;
      
    }else if(key == 'w'){
      
      jugador1 = 2;
      
    }else if(key == 'e'){
      
      jugador1 = 3;
      
      
    }else if(key == 'r'){
      
      jugador1 = 4;
      
    }else if(key == 't'){
      
      jugador1 = 5;
 
    }
    
    if(key == 'y'){
      
      jugador2 = 1;
      
    }else if(key == 'u'){
      
      jugador2 = 2;
      
    }else if(key == 'i'){
      
      jugador2 = 3;
      
      
    }else if(key == 'o'){
      
      jugador2 = 4;
      
    }else if(key == 'p'){
      
      jugador2 = 5;
      
    }
    
   if (jugador1 != 0 && jugador2 != 0){
     escenario = 2;
   }
 }
 
  //Tercera pantalla(Comienzo de la batalla)
  if(escenario == 2){
    background(0);
    fill(150);
    textSize(20);
    text("Ataque: s",200,80);
    textSize(20);
    text("Ataque: k",800,80);
    switch(jugador1){
      case 1:
      sheriff.BarraDeVida();
      sheriff.Display();
      break;
      case 2:
      sheriff.BarraDeVida();
      robot.Display();
      break;
      case 3:
      sheriff.BarraDeVida();
      p1.Display();
      break;
      case 4:
      sheriff.BarraDeVida();
      p2.Display();
      break;
      case 5:
      sheriff.BarraDeVida();
      p3.Display();
      break;
    }
    
    switch(jugador2){
      case 1:
      sheriffp2.Display();
      resetMatrix();
      translate(560,0);
      robot.BarraDeVida();
      break;
      case 2:
      robotp2.Display();
      translate(560,0);
      robot.BarraDeVida();
      break;
      case 3:
      p1p2.Display();
      translate(560,0);
      robot.BarraDeVida();
      break;
      case 4:
      p2p2.Display();
      translate(560,0);
      robot.BarraDeVida();
      break;
      case 5:
      p3p2.Display();
      translate(560,0);
      robot.BarraDeVida();
      break;
    }
    if(key == 's'){
      if (atacante == 1){
        atacante = 2;
        robot.vida -= sheriff.ataque;
      }
    } else if(key == 'k'){ 
      if (atacante == 2){
        atacante = 1;
        sheriff.vida -= robot.ataque; 
      }
    }
    
    if(sheriff.vida <= 0){
      escenario = 3;
    }
    
    if(robot.vida <= 0){
      escenario = 4;
    }
  }
  //Pantalla final(1)
  if(escenario == 3){
    background(0);
    fill(150);
    textSize(50);
    text("JUGADOR 2 GANASTE",width/2,height/2);
    textSize(20);
    text("Presiona ENTER para volver a Jugar",width/2,600);
    
    if(key == ENTER){
    escenario = 1;
    key = 0;
    jugador1 = 0;
    jugador2 = 0;
    sheriff.vida = 400;
    robot.vida = 400;
    atacante = 1;
    }
    
  }
  //Pantalla final(2)
  if(escenario == 4){
    background(0);
    fill(150);
    textSize(50);
    text("JUGADOR 1 GANASTE",width/2,height/2);
    textSize(20);
    text("Presiona ENTER para volver a Jugar",width/2,600);
    
    if(key == ENTER){
    escenario = 1;
    key = 0;
    jugador1 = 0;
    jugador2 = 0;
    sheriff.vida = 400;
    robot.vida = 400;
    atacante = 1;
    }
    
  }
}
 
//Creo la clase para cada uno de los personajes a utilizar.
class personaje{
String nombre;
int vida, ataque, ilustracion;

personaje(String nombre_, int vida_, int ataque_, int ilustracion_){
  nombre = nombre_;
  vida = vida_;
  ataque = ataque_;
  ilustracion = ilustracion_;
}

//Ilustro a mis personajes
void Display(){
  
  switch(ilustracion){
    
    case 0://Sheriff
    pushMatrix();
     noStroke();
     
     //Piernas
     fill(#32302D);
     rect(100,620,20,40);
     rect(160,620,20,40);
     fill(#CABFB3);
     rect(100,520,20,100);
     rect(160,520,20,100);
     rect(120,380,20,140);
     rect(140,380,20,60);
     rect(160,380,20,140);
     rect(180,380,20,40);
     fill(#988F86);
     rect(100,400,20,120);
     fill(#D5CCC2);
     rect(180,420,20,100);
     fill(#5A4C3D);
     rect(140,360,20,20);
     rect(180,360,20,20);
     rect(200,360,20,60);
     fill(#44392E);
     rect(120,360,20,20);
     fill(#FFFFBB);
     rect(160,360,20,20);
     
     //Torso
     fill(#737373);
     rect(160,200,20,160);
     fill(#565656);
     rect(140,200,20,160);
     fill(#B9AA9A);
     rect(180,320,20,40);
     fill(#7D7061);
     rect(120,320,20,40);
     fill(#A79581);
     rect(180,240,20,80);
     fill(#FFFFBB);
     rect(180,220,20,20);
     fill(#A79581);
     rect(120,220,20,100);
     fill(#B9AA9A);
     rect(200,220,20,100);
     fill(#7D7061);
     rect(100,220,20,100);
     fill(#7D7061);
     rect(120,200,20,20);
     fill(#B9AA9A);
     rect(180,200,20,20);
     
     //Brazos
     fill(#737373);
     rect(220,240,20,60);
     rect(80,240,20,60);
     rect(240,300,20,120);
     rect(60,300,20,120);
     fill(#F4E5D4);
     rect(240,420,20,20);
     rect(60,420,20,20);
     
     //Cabeza
     fill(#F4E5D4);
     rect(160,140,20,60);
     rect(180,140,20,40);
     fill(#B7AC9F);
     rect(140,180,20,20);
     fill(#A79581);
     rect(140,140,20,40);
     fill(#7D7061);
     rect(140,120,60,20);
     rect(160,100,20,20);
     fill(#978D81);
     rect(180,100,20,20);
     rect(200,120,20,20);
     fill(#5E5449);
     rect(140,100,20,20);
     rect(120,120,20,20);
     
     popMatrix();
     break;
     
     case 1://robot
     pushMatrix();
     noStroke();
     
     //Piernas
     fill(#FF755F);
     rect(140,460,20,40);
     rect(160,420,20,40);
     rect(120,420,20,40);
     rect(180,380,20,40);
     rect(100,380,20,40);
     fill(#FFC356);
     rect(140,380,20,80);
     rect(160,380,20,40);
     rect(120,380,20,40);
     fill(#363643);
     rect(100,360,20,20);
     fill(#6C6B86);
     rect(120,360,80,20);
     
     //Torso
     fill(#1B1B21);
     rect(120,340,20,20);
     fill(#363643);
     rect(140,340,40,20);
     fill(#89899E);
     rect(100,300,20,20);
     rect(120,280,20,60);
     rect(140,280,20,60);
     rect(160,280,20,60);
     rect(180,300,20,20);
     fill(#6C6B86);
     rect(100,240,20,60);
     rect(120,220,20,60);
     rect(140,220,20,60);
     rect(160,220,20,20);
     rect(160,260,20,20);
     rect(180,220,20,80);
     fill(#96B28D);
     rect(160,240,20,20);
     fill(#363643);
     rect(100,220,20,20);
     
     //Brazos
     fill(#89899E);
     rect(200,240,20,40);
     fill(#676777);
     rect(80,240,20,40);
     fill(#6C6B86);
     rect(220,280,20,40);
     rect(60,280,20,40);
     rect(220,340,20,60);
     rect(60,340,20,60);
     fill(#1B1B21);
     rect(220,320,20,20);
     rect(60,320,20,20);
     fill(#89899E);
     rect(200,400,20,40);
     rect(40,400,20,40);
     rect(240,400,20,40);
     rect(80,400,20,40);
     
     //Cabeza
     fill(#363643);
     rect(120,200,20,20);
     fill(#6C6B86);
     rect(140,200,20,20);
     rect(140,180,40,20);
     fill(#96B28D);
     rect(140,160,40,20);
     fill(#89899E);
     rect(120,180,20,20);
     rect(120,160,20,20);
     rect(100,140,80,20);
     fill(#676777);
     rect(100,160,20,20);
     rect(80,140,20,20);
     
     popMatrix();
     break;
     
     case 2://1101/p1
     pushMatrix();
     noStroke();
     
     //Piernas
     fill(#779495);
     rect(80,640,20,20);
     rect(140,640,20,20);
     rect(80,420,20,100);
     rect(120,420,20,20);
     rect(100,400,60,20);
     fill(#9EC5C6);
     rect(80,520,20,120);
     rect(100,420,20,100);
     rect(140,420,20,220);
     fill(#B1D1D1);
     rect(160,420,20,100);
     
     //Capa
     fill(#502626);
     rect(60,320,20,260);
     rect(80,320,20,100);
     rect(120,440,20,140);
     rect(100,520,20,60);
     rect(160,520,20,60);
     rect(160,360,20,60);
     rect(180,320,20,220);
     rect(200,360,20,100);
     fill(#3C1C1C);
     rect(40,440,20,120);
     fill(#6B3232);
     rect(60,260,20,20);
     rect(80,220,20,20);
     rect(100,200,20,40);
     rect(160,200,20,40);
     rect(180,220,20,20);
     rect(200,240,20,20);
     
     //Torso
     fill(#779495);
     rect(100,320,20,80);
     rect(120,320,20,20);
     rect(140,280,20,40);
     rect(160,320,20,20);
     rect(80,240,20,40);
     rect(120,200,20,20);
     fill(#9EC5C6);
     rect(120,340,20,60);
     rect(140,320,20,80);
     rect(160,340,20,20);
     rect(80,280,20,40);
     rect(100,240,20,80);
     rect(120,220,20,20);
     rect(120,260,20,60);
     rect(140,200,20,40);
     rect(140,260,20,20);
     rect(160,240,20,80);
     rect(180,260,20,60);
     fill(#B1D1D1);
     rect(180,240,20,20);
     fill(#B7B369);
     rect(120,240,20,20);
     rect(140,240,20,20);
     
     //Brazos
     fill(#B1D1D1);
     rect(200,260,20,100);
     fill(#779495);
     rect(60,280,20,40);
     rect(40,420,20,20);
     fill(#9EC5C6);
     rect(40,320,20,100);
     rect(220,360,20,20);
     rect(240,380,40,20);
     
     //Espada
     fill(#8E4343);
     rect(300,360,20,20);
     rect(280,200,20,220);
     fill(#6B3232);
     rect(260,360,20,20);
     
     //Cabeza
     fill(#779495);
     rect(120,100,20,100);
     fill(#9EC5C6);
     rect(140,120,20,20);
     rect(140,160,20,40);
     fill(#283131);
     rect(140,140,20,20);
     rect(160,140,20,20);
     fill(#B1D1D1);
     rect(160,120,20,20);
     rect(160,160,20,20);
     
     popMatrix();
     break;
     
     case 3://00010/p2
     pushMatrix();
     noStroke();
     
     //Piernas
     fill(#7D9C84);
     rect(100,380,20,280);
     rect(120,340,20,60);
     rect(140,340,20,60);
     rect(160,360,20,300);
     fill(#97B09D);
     rect(160,340,20,20);
     rect(180,360,20,140);
     fill(#5E7563);
     rect(100,340,20,40);
     rect(80,360,20,140);
     
     //Torso
     fill(#5E7563);
     rect(120,280,20,60);
     rect(140,260,20,20);
     rect(80,220,20,40);
     rect(100,220,20,20);
     fill(#7D9C84);
     rect(140,280,20,60);
     rect(100,240,20,40);
     rect(120,220,20,60);
     rect(140,220,20,40);
     rect(160,240,20,40);
     fill(#97B09D);
     rect(160,220,20,20);
     rect(180,220,20,40);
     
     //Brazos
     fill(#7D9C84);
     rect(200,260,20,40);
     rect(60,260,20,40);
     rect(220,300,20,140);
     rect(40,300,20,140);
     
     //Cabeza
     fill(#5E7563);
     rect(100,140,20,40);
     rect(120,140,20,20);
     rect(120,180,20,40);
     fill(#7D9C84);
     rect(140,140,20,20);
     rect(140,180,20,40);
     fill(#ACC0B1);
     rect(120,160,20,20);
     rect(140,160,20,20);
     
     popMatrix();
     break;
     
     case 4://11110/p3
     pushMatrix();
     noStroke();
     
     //Piernas
     fill(#7F7E9E);
     rect(120,640,20,20);
     rect(180,640,20,20);
     fill(#A9A8D2);
     rect(120,560,20,80);
     rect(180,540,20,100);
     rect(140,480,20,60);
     rect(200,460,20,80);
     rect(120,440,20,40);
     rect(180,440,20,40);
     rect(140,420,20,20);
     fill(#BAB9DB);
     rect(140,540,20,20);
     rect(200,540,20,20);
     rect(160,480,20,60);
     rect(220,460,20,80);
     rect(140,440,20,40);
     rect(200,440,20,20);
     rect(160,420,20,20);
     
     //Torso
     fill(#A9A8D2);
     rect(140,400,20,20);
     rect(160,280,20,140);
     rect(100,280,20,40);
     rect(120,280,20,40);
     rect(140,280,20,80);
     rect(180,280,20,60);
     rect(200,300,20,40);
     fill(#7F7E9E);
     rect(120,400,20,20);
     rect(140,360,20,40);
     rect(120,320,20,40);
     rect(100,260,20,20);
     fill(#BAB9DB);
     rect(180,340,20,80);
     rect(200,280,20,20);
     
     //Brazos
     fill(#A9A8D2);
     rect(220,320,20,80);
     rect(240,400,20,40);
     rect(260,440,20,20);
     rect(80,280,20,20);
     rect(60,300,20,20);
     rect(40,320,20,40);
     rect(60,360,20,20);
     rect(80,380,20,20);
     fill(#7F7E9E);
     rect(260,460,20,20);
     rect(80,400,20,20);
     fill(#BAB9DB);
     rect(220,300,20,20);
     
     //Cabeza
     fill(#A9A8D2);
     rect(140,200,20,80);
     fill(#BAB9DB);
     rect(160,180,20,20);
     rect(160,220,20,60);
     rect(180,180,20,20);
     rect(180,220,20,20);
     fill(#855D5E);
     rect(160,200,20,20);
     rect(180,200,20,20);
     
     popMatrix();
     break;
    
     case 5://Sheriff Espalda
     pushMatrix();
     noStroke();
     
     //Piernas
     fill(#32302D);
     rect(900,620,20,40);
     rect(840,620,20,40);
     fill(#CABFB3);
     rect(900,520,20,100);
     rect(840,380,20,240);
     rect(860,380,20,60);
     rect(880,380,20,140);
     fill(#988F86);
     rect(820,400,20,120);
     fill(#D5CCC2);
     rect(900,420,20,100);
     fill(#5A4C3D);
     rect(820,380,20,20);
     rect(820,360,80,20);
     fill(#44392E);
     rect(800,360,20,80);
     
     //Torso
     fill(#B9AA9A);
     rect(880,320,20,40);
     rect(900,220,20,100);
     rect(880,200,20,20);
     fill(#A79581);
     rect(820,220,20,100);
     rect(880,220,20,100);
     rect(840,200,20,160);
     rect(860,200,20,160);
     fill(#7D7061);
     rect(820,200,20,20);
     rect(820,320,20,40);
     rect(800,220,20,100);

     
     //Brazos
     fill(#737373);
     rect(780,240,20,60);
     rect(920,240,20,60);
     rect(760,300,20,120);
     rect(940,300,20,120);
     fill(#F4E5D4);
     rect(760,420,20,20);
     rect(940,420,20,20);
     
     //Cabeza
     fill(#F4E5D4);
     rect(860,180,20,20);
     rect(820,140,20,40);
     rect(840,160,20,20);
     fill(#B7AC9F);
     rect(840,180,20,20);
     fill(#A79581);
     rect(840,140,20,20);
     rect(860,140,20,40);
     fill(#7D7061);
     rect(820,120,60,20);
     rect(840,100,20,20);
     fill(#978D81);
     rect(860,100,20,20);
     rect(880,120,20,20);
     fill(#5E5449);
     rect(820,100,20,20);
     rect(800,120,20,20);
     
     popMatrix();
     break;
     
     case 6://robot Espalda
     pushMatrix();
     noStroke();
     
     //Piernas
     fill(#FF755F);
     rect(840,460,20,40);
     rect(860,420,20,40);
     rect(820,420,20,40);
     rect(880,380,20,40);
     rect(800,380,20,40);
     fill(#FFC356);
     rect(840,380,20,80);
     rect(860,380,20,40);
     rect(820,380,20,40);
     fill(#363643);
     rect(800,360,20,20);
     fill(#6C6B86);
     rect(820,360,80,20);
     
     //Torso
     fill(#1B1B21);
     rect(820,340,20,20);
     fill(#363643);
     rect(840,340,40,20);
     fill(#89899E);
     rect(800,300,100,20);
     rect(820,320,60,20);
     fill(#6C6B86);
     rect(800,240,20,60);
     rect(820,220,20,80);
     rect(840,220,20,80);
     rect(860,220,20,80);
     rect(880,220,20,80);
     fill(#363643);
     rect(800,220,20,20);
     
     //Brazos
     fill(#89899E);
     rect(900,240,20,40);
     fill(#676777);
     rect(780,240,20,40);
     fill(#6C6B86);
     rect(920,280,20,40);
     rect(760,280,20,40);
     rect(920,340,20,60);
     rect(760,340,20,60);
     fill(#1B1B21);
     rect(920,320,20,20);
     rect(760,320,20,20);
     fill(#89899E);
     rect(900,400,20,40);
     rect(740,400,20,40);
     rect(940,400,20,40);
     rect(780,400,20,40);
     
     //Cabeza
     fill(#363643);
     rect(820,200,20,20);
     fill(#6C6B86);
     rect(840,200,20,20);
     rect(800,180,40,20);
     rect(820,160,20,20);
     fill(#96B28D);
     rect(800,160,20,20);
     fill(#89899E);
     rect(840,160,20,40);
     rect(800,140,80,20);
     fill(#676777);
     rect(860,160,20,20);
     rect(880,140,20,20);
     
     popMatrix();
     break;
     
     case 7://1101/p1 Espalda
     pushMatrix();
     noStroke();
     
     //Piernas
     fill(#779495);
     rect(800,640,20,20);
     rect(860,640,20,20);
     fill(#9EC5C6);
     rect(800,560,20,80);
     rect(860,560,20,80);
     
     //Capa
     fill(#6B3232);
     rect(780,520,20,40);
     rect(820,520,20,40);
     rect(860,520,20,40);
     rect(780,180,20,20);
     rect(760,200,20,20);
     rect(740,220,20,220);
     rect(760,420,20,100);
     rect(760,300,20,20);
     rect(780,320,20,40);
     rect(800,360,20,40);
     rect(820,400,20,40);
     fill(#A56969);
     rect(840,180,20,20);
     rect(860,200,20,40);
     rect(880,240,20,60);
     rect(900,300,20,240);
     rect(840,360,20,20);
     rect(860,380,20,40);
     rect(880,420,20,20);
     fill(#8E4343);
     rect(760,220,20,80);
     rect(780,200,20,120);
     rect(800,200,20,160);
     rect(820,200,20,200);
     rect(840,200,20,160);
     rect(860,240,20,140);
     rect(880,300,20,120);
     rect(760,320,20,100);
     rect(780,360,20,160);
     rect(800,400,20,160);
     rect(820,440,20,80);
     rect(840,380,20,180);
     rect(860,420,20,100);
     rect(880,440,20,100);
     rect(840,520,20,40);
     rect(880,520,20,40);
     fill(#9EC5C6);
     rect(800,180,20,20);
     rect(820,180,20,20);
     
     
     //Brazos
     fill(#9EC5C6);
     rect(720,360,20,20);
     rect(680,380,40,20);
     
     //Espada
     fill(#8E4343);
     rect(680,360,20,20);
     rect(660,200,20,220);
     fill(#6B3232);
     rect(640,360,20,20);
     
     //Cabeza
     fill(#779495);
     rect(780,100,20,20);
     rect(780,140,20,20);
     rect(800,160,20,20);
     fill(#9EC5C6);
     rect(800,100,20,60);
     rect(820,100,20,80);
     fill(#283131);
     rect(780,120,20,20);
     fill(#B1D1D1);
     rect(820,80,20,20);
     
     popMatrix();
     break;
     
     case 8://00010/p2 Espalda
     pushMatrix();
     noStroke();
     
     //Piernas
     fill(#7D9C84);
     rect(800,380,20,280);
     rect(820,340,20,60);
     rect(840,340,20,60);
     rect(860,360,20,300);
     fill(#97B09D);
     rect(860,340,20,20);
     rect(880,360,20,140);
     fill(#5E7563);
     rect(800,340,20,40);
     rect(780,360,20,140);
     
     //Torso
     fill(#5E7563);
     rect(800,260,40,20);
     rect(780,220,20,40);
     rect(800,220,20,20);
     fill(#7D9C84);
     rect(820,280,20,60);
     rect(800,240,20,20);
     rect(820,220,20,40);
     rect(840,220,20,60);
     rect(860,240,20,40);
     fill(#97B09D);
     rect(840,280,20,60);
     rect(860,220,20,20);
     rect(880,220,20,40);
     
     //Brazos
     fill(#7D9C84);
     rect(900,260,20,40);
     rect(760,260,20,40);
     rect(920,300,20,140);
     rect(740,300,20,140);
     
     //Cabeza
     fill(#5E7563);
     rect(820,180,20,40);
     fill(#7D9C84);
     rect(820,140,20,20);
     rect(840,160,20,60);
     fill(#ACC0B1);
     rect(820,160,20,20);
     fill(#97B09D);
     rect(840,140,40,20);
     rect(860,160,20,20);
     
     popMatrix();
     break;
     
     case 9://11110/p3 Espalda
     pushMatrix();
     noStroke();
     
     //Piernas
     fill(#7F7E9E);
     rect(720,640,20,20);
     rect(780,640,20,20);
     rect(700,540,20,20);
     rect(760,540,20,20);
     rect(740,480,20,60);
     rect(680,460,20,80);
     rect(760,440,20,40);
     rect(700,440,20,20);
     rect(740,420,20,20);
     fill(#A9A8D2);
     rect(780,560,20,80);
     rect(720,540,20,100);
     rect(760,480,20,60);
     rect(700,460,20,80);
     rect(780,440,20,40);
     rect(720,440,20,40);
     rect(760,420,20,20);

     //Torso
     fill(#A9A8D2);
     rect(740,280,20,140);
     rect(700,280,20,40);
     rect(760,280,20,80);
     rect(720,280,20,60);
     rect(780,280,20,40);
     rect(800,280,20,40);
     rect(760,400,20,20);
     fill(#BAB9DB);
     rect(780,400,20,20);
     rect(760,360,20,40);
     rect(780,320,20,40);
     fill(#7F7E9E);
     rect(720,340,20,80);
     rect(700,280,20,20);
     rect(800,260,20,20);
     
     //Brazos
     fill(#A9A8D2);
     rect(680,320,20,80);
     rect(660,400,20,40);
     rect(640,440,20,20);
     rect(820,300,20,20);
     rect(840,320,20,20);
     rect(860,340,20,40);
     rect(840,380,20,20);
     rect(820,400,20,20);
     fill(#7F7E9E);
     rect(640,460,20,20);
     rect(820,420,20,20);
     rect(680,300,20,20);
     
     //Cabeza
     fill(#A9A8D2);
     rect(740,200,20,80);
     rect(760,220,20,60);
     fill(#7F7E9E);
     rect(720,200,20,20);
     rect(720,240,20,20);
     fill(#855D5E);
     rect(720,220,20,20);
     
     popMatrix();
     break;
  }
  }
  
  //Creo la barra de vida de los personajes 
  void BarraDeVida(){
    fill(255);
    rect(20,20,vida,20);
  }
  
}