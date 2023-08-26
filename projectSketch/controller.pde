void mousePressed() {
    if (stateStack.get(0) == State.STARTMENU) {
        stateStack.remove(0);

    }
}

void keyPressed() {
    if (stateStack.get(0) == State.OVERWORLD) {
        if (keyCode == LEFT) {
            if((playerX - tileSize) >= 0){
                playerX = playerX - tileSize;
            }
        }

        if (keyCode == RIGHT) {
            if((playerX + tileSize) < 450){
                playerX = playerX + tileSize;
            }
        }
        if (keyCode == UP) {
            if((playerY - tileSize) >= 0){
                playerY = playerY - tileSize;
            }
        }
        if (keyCode == DOWN) {
            if((playerY + tileSize) < 450){
                playerY = playerY + tileSize;
            }
        }


        if (keyCode == 'B' || keyCode == 'b') {
            stateStack.add(0, State.BATTLE);
        }

    }

    else if (stateStack.get(0) == State.BATTLE) {
        if (keyCode == 'B' || keyCode == 'b') {
            stateStack.add(0, State.OVERWORLD);
        }

    }

    

}
