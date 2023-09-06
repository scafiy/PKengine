PImage playerBattle, enemyBattle;

void battle(){
    background(255,255,255);

    //draw enemy and player sprites
    int enemyBattleSpriteX = width - width/3;
    int enemyBattleSpriteY = 0;

    //copy(enemyBattle, 0, 0, 197, 302, enemyBattleSpriteX, enemyBattleSpriteY, width/4, height/3); //draw enemy

    rect(width - width/3 , 0, 10, 100); //enemy UI


    int characterBattleSpriteX = 0;
    int characterBattleSpriteY = height - height/2 - height/3;

    //copy(playerBattle, 0, 0, 197, 302, characterBattleSpriteX, characterBattleSpriteY, width/3, height/2); //draw player

    rect(0 , height - height/2 - height/3, 10, 100); //character UI



    //dialogue box UI
    int boxUIHeight = height/3.5;

    fill(255);
    strokeWeight(5);
    rect(15/2, height - boxUIHeight - 10, width - 15, boxUIHeight); //draw border for dialogue

    //text
    textAlign(TOP, LEFT);
    textSize(24);
    fill(0);
    text("hello world", 10, height - 100);


}