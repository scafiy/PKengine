PImage startUpScreen, characterSheet;

int tileSize = 30;
int playerSize = tileSize;

int playerX = playerSize - tileSize ;
int playerY = playerSize - tileSize ;


void setup(){
    size(450,450);
    frameRate(30);

    startUpScreen = loadImage("images/start.jpg");
    characterSheet = loadImage("images/spritesheets/character.png");


    grassTile = loadImage("images/tiles/grass.png");
    smallGrass = loadImage("images/tiles/smallGrass.png");
    forest = loadImage("images/tiles/forest.png");

    stateStack.add(State.STARTMENU);
    stateStack.add(State.OVERWORLD);
    stateStack.add(State.BATTLE);

}




