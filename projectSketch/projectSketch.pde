import java.util.Stack; 
import processing.sound.*; //import sound processing library

SoundFile area1BGmusic; 
SoundFile battleMusic; 

int height = 450;
int width = 450;

int time = 0;


enum gameState {STARTMENU, OVERWORLD, BATTLE, DIALOGUE, GAMEOVER}

Stack<gameState> stateStack = new Stack<gameState>();



PImage startUpBG;

int tileSize = 40;

void setState(gameState state){
    stateStack.push(state);
}

gameState currentState(){
    return stateStack.peek();
}


void setup(){
    size(450,450);
    frameRate(30);



    //load Pimages
    startUpBG = loadImage("images/backgrounds/start.jpg");
    forest = loadImage("images/backgrounds/forest.png");
    characterSheet = loadImage("images/spritesheets/characterSheet.png");
    tileSheet = loadImage("images/spritesheets/tileSheet.png");
    playerBattle = loadImage("images/spritesheets/playerBattle.png");
    birdBattleSprite = loadImage("images/spritesheets/birdBattleSprite.png");


    //load states
    stateStack.add(gameState.BATTLE);
    stateStack.add(gameState.OVERWORLD);
    stateStack.add(gameState.STARTMENU);

    player = new Player(1, 0); //construct player object
    dialogue = new Dialogue(new ArrayList<String>()); //construct dialogue object


    //load audio
    //area1BGmusic = new SoundFile(this, "audio/ambient/cicada.mp3");
    //area1BGmusic.amp(0.1);
    //battleMusic = new SoundFile(this, "audio/battle.mp3");
    //battleMusic.amp(0.1);



    //load encounter data
    JSONObject encounterData = loadJSONObject("data/encounters.json");
    JSONArray area1EnemyData = encounterData.getJSONArray("area1");


    for(int i = 0 ; i < area1EnemyData.size(); i++){
        JSONObject enemyData = area1EnemyData.getJSONObject(i);
        PImage sprite = loadImage("images/spritesheets/" + enemyData.getString("sprite") + ".png");

        area1Enemies.add(new Enemy(enemyData.getString("name"), sprite, enemyData.getInt("level"), enemyData.getInt("EXP"), enemyData.getInt("maxHP"), enemyData.getInt("maxHP"), enemyData.getInt("ATK"), enemyData.getInt("SPEED")));
    }

    surface.setTitle("RPGengine");
    surface.setIcon(characterSheet.get(0, 0, 30, 30));

    

}

void draw(){
    switch (stateStack.peek()) {
        case STARTMENU:
            background(0);
            textAlign(CENTER, CENTER);
            textSize(32);
            fill(255);
            text("RPG engine", width/2, height/2 - 11);
            textSize(12);
            text("press any button to start", width/2, height/2 + 24);
        break;	

        case BATTLE:
            battle();
        break;

        case OVERWORLD:
            drawWorld();
            player.drawSprite();
            player.updatePosition();
        break;

        case DIALOGUE:
            dialogue.display();
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

    if (player.getCurrentHP() <= 0) setState(gameState.GAMEOVER);
    time++;
}
