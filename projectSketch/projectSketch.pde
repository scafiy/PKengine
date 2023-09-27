import java.util.Stack; 
//import processing.sound.*; //import sound processing library
//SoundFile stepSound; 


enum gameState {STARTMENU, OVERWORLD, BATTLE, DIALOGUE, GAMEOVER}

private Stack<gameState> stateStack = new Stack<gameState>();

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
    birdBattleSprite = loadImage("images/spritesheets/birdBattleSprite.png");

    //stepSound = new SoundFile(this, "sound/step.wav");


    //load states
    stateStack.add(gameState.BATTLE);
    stateStack.add(gameState.OVERWORLD);
    stateStack.add(gameState.STARTMENU);

    player = new Player(1, 0); //construct player object

    surface.setTitle("RPGengine");
    surface.setIcon(characterSheet.get(0, 0, 30, 30));

}

void draw(){
    switch (stateStack.peek()) {
        case STARTMENU:
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

        case GAMEOVER:
            background(255, 0, 0);
            textAlign(CENTER, CENTER);
            textSize(32);
            fill(0);
            text("Game Over", width/2, height/2 - 11);
            textSize(12);
            text("press any button to revive", width/2, height/2 + 24);
        break;	

    }

    if (player.getCurrentHP() <= 0) stateStack.push(gameState.GAMEOVER);
    
}

