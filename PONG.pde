int x;
int y;
int w;
int h;

int speedY;
int speedX;
int paddleY, paddleH;
int score = 0;
Paddle pad;
PFont font;
boolean intro= true;
boolean play = false;
boolean gameOver = false;

void setup(){
  
  size(1000,1000);
   pad = new Paddle();
  x= width/2;
  y= height/2;
  w=50;
  h=50;
  speedY = + 13;
  speedX = +12;
  font = loadFont("Kremlin-48.vlw");
  textFont( font, 64);
}


void draw(){ 
 background(0);
 noStroke();
 fill(255);
 ellipse(x, y, w, h);
  bounce();
  score();

  pad.draw();


  if(  y > width -30) { 
    speedY = -speedY;
  }

  if( x <0 + 25 || x > width -30) { 
    speedX = -speedX;
  }
  
  if(play){
  y= y+speedY;
  x=x+speedX;
  }

if(intro){ text("press to play", 240, 300); }
if(gameOver){ text("Game Over", 240,300);
              score=0;
              x= width/2;
              y= height/2;}

}
void bounce () {  
    if(y - h/2 < pad.paddleY + pad.paddleH/2 && x - w/2 < pad.paddleX + pad.paddleW/2 && x - w/2 > pad.paddleX - pad.paddleW/2)  { 
      speedY = - speedY;
  }
}
  
  
void score() { 
  fill(255);
  text(score,50 , 500);
   if(y - h/2 < pad.paddleY + pad.paddleH/2 && x - w/2 < pad.paddleX + pad.paddleW/2 && x - w/2 > pad.paddleX - pad.paddleW/2) { 
   score++;
   }
   // ywaard - 25 > 70+10                   && xwaarde - 25 > muispositie + 100      && xwaarde - 25 < muis - 25
   if(y - h/2 <= pad.paddleY - pad.paddleH/2 && x - w/2 >= pad.paddleX + pad.paddleW/2 || y - h/2 <= pad.paddleY - pad.paddleH/2 && x - w/2 <= pad.paddleX - pad.paddleW/2){
     play = false;
     gameOver = true;
     
   }
   
   
}

void reset(){
  play =true ;
  score = 0;
  x= width/2;
  y=height/2;
}

void mousePressed() {
  intro =false ;
  play = true;
  gameOver = false;
  //if(play ==false){gameOver = true;}
}