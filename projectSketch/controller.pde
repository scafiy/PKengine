void mousePressed() {
    if (stateStack.peek() == State.STARTMENU) {
        stateStack.pop();
    }
}

void keyPressed() {
    switch (stateStack.peek()) {
        case STARTMENU :
            stateStack.pop();
        break;	

        case OVERWORLD:
            if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT) {
                player.move(keyCode);
            }

            if (keyCode == 'B' || keyCode == 'b') {
                stateStack.push(State.BATTLE);
            }
            
        break;

        case BATTLE:
            if (keyCode == 'B' || keyCode == 'b') {
                stateStack.push(State.OVERWORLD);
            }
        break;
    }
}
