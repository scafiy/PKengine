int gameState = 0;

PImage background;
PImage playerModel;


int playerX = 10;
int playerY = 10;


void setup(){
    size(500,500);
    frameRate(30);

    background = loadImage("images/town.png");
    playerModel = loadImage("images/player.png");

}

void draw(){
    if(gameState == 0){
        startMenu();
    }

    else if(gameState == 1){
        overWorld();
    }
}

void startMenu(){
    background(100);
}


void overWorld(){
    image(background, 0, 0, width, height);

    image(playerModel, playerX, playerY, 50, 50);


}


void mousePressed() {
  if (gameState == 0) {
    gameState = 1; // Transition to the game screen
  }
}

void keyPressed() {
    if(gameState == 1){
        if (keyCode == LEFT) {
            playerX = playerX - 10;
        }
        if (keyCode == RIGHT) {
            playerX = playerX + 10;
        }
        if (keyCode == UP) {
            playerY = playerY - 10;
        }
        if (keyCode == DOWN) {
            playerY = playerY +10;
        }
    }

}
