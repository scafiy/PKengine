PImage startUpScreen;
PImage playerModel;

int tileSize = 30;

int playerX = 0;
int playerY = 0;


void setup(){
    size(450,450);
    frameRate(30);

    startUpScreen = loadImage("images/start.jpg");
    playerModel = loadImage("images/player.png");

    stateStack.add(State.STARTMENU);
    stateStack.add(State.OVERWORLD);
    stateStack.add(State.BATTLE);

}




