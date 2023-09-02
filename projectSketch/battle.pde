PImage playerBattle, enemyBattle;

void battle(){
    background(255,255,255);

    copy(enemyBattle, 
    0, 0, 197, 302,
    width - width/3, 0, width/4, height/3); //draw enemy

    copy(playerBattle, 
    0, 0, 197, 302,
    0, height - height/2 - height/3, width/3, height/2); //draw player

    fill(255);
    strokeWeight(10);

    rect(0, height - height/3.5, width, height/3.5); //draw border for dialogue

    textSize(24);
    fill(0);
    text("hello world", 10, height - 100);


}