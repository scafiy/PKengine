import java.util.Stack; 

enum State {STARTMENU, OVERWORLD, BATTLE, DIALOGUE}

private Stack<State> stateStack = new Stack<State>();

PImage startUpScreen;

int tileSize = 40;

void setup(){
    size(450,450);
    frameRate(30);

    //load Pimages
    startUpScreen = loadImage("images/backgrounds/start.jpg");
    forest = loadImage("images/backgrounds/forest.png");
    characterSheet = loadImage("images/spritesheets/characterSheet.png");
    tileSheet = loadImage("images/spritesheets/tileSheet.png");
    playerBattle = loadImage("images/spritesheets/playerBattle.png");
    enemyBattle = loadImage("images/spritesheets/enemyBattle.png");

    //load states
    stateStack.add(State.BATTLE);
    stateStack.add(State.OVERWORLD);
    stateStack.add(State.STARTMENU);

    player = new Player(0, 0); //construct player object
}

void draw(){
    switch (stateStack.peek()) {
        case STARTMENU :
            image(startUpScreen, 0, 0, width, height); 
        break;	

        case OVERWORLD:
            drawWorld();
            player.drawSprite();
            player.updatePosition();
        break;

        case BATTLE:
            battle();
        break;
    }
}
