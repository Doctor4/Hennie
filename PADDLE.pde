class Paddle {
  
int paddleX, paddleY ,paddleW ,paddleH;


Paddle(){
  rectMode(CENTER);

paddleY = 70;
paddleW = 200;
paddleH = 20;

}

void draw(){
  paddleX = mouseX;
rect(paddleX, paddleY, paddleW, paddleH);
}


}