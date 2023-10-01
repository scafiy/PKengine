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

            if (keyCode == 'B' || keyCode == 'b') encounter(); //force encounter for testing
            
            if (keyCode == 'Z' || keyCode == 'z') stateStack.push(gameState.DIALOGUE); //force dialogue for testing
        break;

        case BATTLE:
            if (keyCode == UP) BMPointerUp();
            if (keyCode == DOWN) BMPointerDown();
            if (keyCode == LEFT) BMPointerLeft();
            if (keyCode == RIGHT) BMPointerRight();
            if (keyCode == 'Z' || keyCode == 'z') selectChoice();
        break;

        case DIALOGUE:
            if (keyCode == 'Z' || keyCode == 'z') dialogue.nextLine();
        break;
    }
}

void keyReleased(){
    switch (stateStack.peek()) {
    }
}
