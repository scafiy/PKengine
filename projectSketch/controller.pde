void mousePressed() {
    if (stateStack.peek() == gameState.STARTMENU) {
        stateStack.pop();
    }
    if (stateStack.peek() == gameState.GAMEOVER) {
        stateStack.pop();
        stateStack.push(gameState.OVERWORLD);
        player.heal(player.getMaxHP());
    }
}

void keyPressed() {
    switch (stateStack.peek()) {
        case STARTMENU :
            stateStack.pop();
        break;	

        case GAMEOVER :
            stateStack.pop();
            stateStack.push(gameState.OVERWORLD);
            player.heal(player.getMaxHP());
        break;	

        case OVERWORLD:
            if (keyCode == UP) player.moveUp();
            if (keyCode == DOWN) player.moveDown();
            if (keyCode == LEFT) player.moveLeft();
            if (keyCode == RIGHT) player.moveRight();

            if (keyCode == 'B' || keyCode == 'b') {
                stateStack.push(gameState.BATTLE);
                currentEnemy = new Enemy("Bird", birdBattleSprite,  1, 10, 100, 100, 10, 9);
            }
            
        break;

        case BATTLE:
            if (keyCode == UP) BMPointerUp();
            if (keyCode == DOWN) BMPointerDown();
            if (keyCode == LEFT) BMPointerLeft();
            if (keyCode == RIGHT) BMPointerRight();
            if (keyCode == 'Z' || keyCode == 'z') selectChoice();
        break;
    }
}

void keyReleased(){
    switch (stateStack.peek()) {
    }
}
