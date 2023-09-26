PImage playerBattle, enemyBattle;

enum Choice {ATTACK, RUN, HEAL, PARTY}

Choice pointerHover = Choice.ATTACK;

void turn(String move){
    if(player.getSPEED() > currentEnemy.getSPEED()){ //if player is faster then player goes first
        //player turn
        if (player.getCurrentHP() > 0){
            if (move == "Attack") currentEnemy.takeDamage(player.getATK());
            if (move == "Heal") player.heal(player.getMaxHP());
         }
        //enemy turn
        if (currentEnemy.getCurrentHP() > 0) player.takeDamage(currentEnemy.getATK());
    }

    else{ //if enemy is faster then enemy goes first
        //enemy turn
        if (currentEnemy.getCurrentHP() > 0) player.takeDamage(currentEnemy.getATK());
        //player turn
        if (player.getCurrentHP() > 0) if (move == "Attack") currentEnemy.takeDamage(player.getATK());
    }

}




//move around pointer in the battle menu
void BMPointerUp(){
    if (pointerHover == Choice.RUN) pointerHover = Choice.ATTACK;
    if (pointerHover == Choice.HEAL) pointerHover = Choice.PARTY;
}
void BMPointerDown(){
    if (pointerHover == Choice.ATTACK) pointerHover = Choice.RUN;
    if (pointerHover == Choice.PARTY) pointerHover = Choice.HEAL;

}

void BMPointerLeft(){
    if (pointerHover == Choice.PARTY) pointerHover = Choice.ATTACK;
    if (pointerHover == Choice.HEAL) pointerHover = Choice.RUN;

}
void BMPointerRight(){
    if (pointerHover == Choice.ATTACK) pointerHover = Choice.PARTY;
    if (pointerHover == Choice.RUN) pointerHover = Choice.HEAL;
}

void selectChoice(){
    switch(pointerHover){
        case ATTACK:
            turn("Attack");
            break;
        case RUN:
            stateStack.push(gameState.OVERWORLD);
            break;
        case PARTY:
            break;
        case HEAL:
            turn("Heal");
            break;
    }
}

void battleChoiceUI(){

    float boxUIHeight = height/3.5;
    float battleUIWidth = width/3;
    int battleUIHeight = 50;

    fill(255);
    strokeWeight(5);
    rect(15/2, height - boxUIHeight - 10, width/3 - 15, boxUIHeight); //draw border for dialogue
    textAlign(TOP, LEFT);
    textSize(24);
    fill(0);


    text("Attack!", 50 + width/3 - 15, height - 100 + 10);
    text("Run", 50 + width/3 - 15, height - 100 + 60);
    text("Party", 50 + width/3 - 15 + 100, height - 100 + 10);
    text("Heal", 50 + width/3 - 15 + 100, height - 100 + 60);


    int pointerLength = 5;
    float BMpointerX = 0;
    float BMpointerY = 0;

    switch(pointerHover){
        case ATTACK:
            BMpointerX = width/2 - 50;
            BMpointerY = height - 100;
            break;
        case RUN:
            BMpointerX = width/2 - 50;
            BMpointerY = height - 50;
            break;
        case PARTY:
            BMpointerX = width/2 + 50;
            BMpointerY = height - 100;
            break;
        case HEAL:
            BMpointerX = width/2 + 50;
            BMpointerY = height - 50;
            break;
    }


    triangle(BMpointerX, BMpointerY, BMpointerX - pointerLength, BMpointerY + pointerLength, BMpointerX - pointerLength, BMpointerY - pointerLength);
}

void battle(){
    background(255,255,255);


    //ui fields
    float boxUIHeight = height/3.5;
    float barWidth = width/3;
    int battleUIHeight = 50;

    //enemy fields
    int enemyBattleSpriteX = width - width/3;
    int enemyBattleSpriteY = 0;

    //player fields
    int characterBattleSpriteX = 0;
    int characterBattleSpriteY = height - height/2 - height/3;

    //draw enemy
    copy(enemyBattle, 0, 0, 197, 302, enemyBattleSpriteX, enemyBattleSpriteY, width/4, height/3); //draw enemy
    fill(0);
    rect(10, 50, barWidth, 10); //enemy hp bar
    fill(255,0,0);
    rect(10, 50, barWidth * (currentEnemy.getCurrentHP() / currentEnemy.getMaxHP()), 10); //enemy hp bar
    fill(0);
    text(currentEnemy.getName() + " Lv:" + currentEnemy.getLevel(), 10, 40);


    //draw player
    copy(playerBattle, 0, 0, 197, 302, characterBattleSpriteX, characterBattleSpriteY, width/3, height/2); //draw player

    rect(width - barWidth - 10, height - boxUIHeight - 70, barWidth, 10);  //player hp bar backdrop
    fill(0);
    fill(255,0,0);
    rect(width - barWidth - 10, height - boxUIHeight - 70, barWidth * (player.getCurrentHP() / player.getMaxHP()), 10); //player hp bar
    fill(0);
    rect(width - barWidth - 10, height - boxUIHeight - 50, barWidth, 10); //player exp bar backdrop
    fill(0,0,255);
    rect(width - barWidth - 10, height - boxUIHeight - 50, barWidth * (player.getCurrentEXP() / player.getMaxEXP()), 10); //player exp bar
    fill(0);
    text("You Lv:" + player.getLevel(), width - barWidth - 30, height - boxUIHeight - 80);
    textSize(15);
    text("HP", width - barWidth - 35, height - boxUIHeight - 60);
    text("XP", width - barWidth - 35, height - boxUIHeight -40);


    //draw UI
    fill(0);
    fill(255);
    strokeWeight(5);
    rect(15/2, height - boxUIHeight - 10, width - 15, boxUIHeight); //draw border for dialogue
    textAlign(TOP, LEFT);
    textSize(24);
    fill(0);
    //text("a wild enemy appeared!", 10, height - 100);
    
    battleChoiceUI();
    if (currentEnemy.getCurrentHP() <= 0){
        player.levelUp(currentEnemy.getEXP());
        stateStack.push(gameState.OVERWORLD);
    }

  
}