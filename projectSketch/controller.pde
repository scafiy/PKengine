boolean pressUp() {return keyCode == UP || keyCode == 'W' || keyCode == 'w';} //check if player pressed an up button
boolean pressDown() {return keyCode == DOWN || keyCode == 'S' || keyCode == 's';} //check if player pressed a down button
boolean pressLeft() {return keyCode == LEFT || keyCode == 'A' || keyCode == 'a';} //check if player pressed a left button
boolean pressRight() {return keyCode == RIGHT || keyCode == 'D' || keyCode == 'd';} //check if player pressed a right button
boolean pressSelect() {return keyCode == 'Z' || keyCode == 'z' || keyCode == 'X' || keyCode == 'x' || keyCode == ' ';} //check if player pressed one of the select buttons

void mousePressed() {
    switch (stateStack.peek()) {
        case STARTMENU :
            stateStack.pop();
        break;

        case GAMEOVER :
            stateStack.pop();
            stateStack.push(gameState.OVERWORLD);
            player.heal(player.getMaxHP());
        break;

        case PAUSE:
            stateStack.pop();
        break;
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
            if (pressUp()) player.moveUp();
            if (pressDown()) player.moveDown();
            if (pressLeft()) player.moveLeft();
            if (pressRight()) player.moveRight();
            //if (keyCode == 'B' || keyCode == 'b') world.encounter(); //force encounter for testing
           //if (pressSelect()) stateStack.push(gameState.DIALOGUE); //force dialogue for testing
        break;

        case BATTLE:
            if (pressUp()) battle.pointerUp();
            if (pressDown()) battle.pointerDown();
            if (pressLeft()) battle.pointerLeft();
            if (pressRight()) battle.pointerRight();
            if (pressSelect()) battle.selectChoice();
        break;

        case DIALOGUE:
            if (pressSelect()) dialogue.nextLine();
        break;

        case PAUSE:
            stateStack.pop();
        break;
    }
}

void keyReleased(){
    switch (stateStack.peek()) {
    }
}
