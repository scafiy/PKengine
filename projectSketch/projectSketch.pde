import java.util.Stack; 

enum State {STARTMENU, OVERWORLD, BATTLE, DIALOGUE}

private Stack<State> stateStack = new Stack<State>();

PImage startUpBG;

int tileSize = 40;

void setup(){
    size(450,450);
    frameRate(30);

    //load Pimages
    startUpBG = loadImage("images/backgrounds/start.jpg");
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

    surface.setTitle("RPGengine");
    surface.setIcon(characterSheet.get(0, 0, 30, 30));
}

void draw(){
    switch (stateStack.peek()) {
        case STARTMENU :
            //image(startUpBG, 0, 0, width, height); 
            background(0);
            textAlign(CENTER, CENTER);
            textSize(32);
            fill(255);
            text("RPG engine", width/2, height/2 - 11);
            textSize(12);
            text("press any button to start", width/2, height/2 + 24);
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
    surface.setIcon(characterSheet.get(playerSheetX, playerSheetY, 30, 30)); //updates program icon to mimic the direct the character is facing in game which is cool
}
