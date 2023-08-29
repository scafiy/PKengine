void mousePressed() {
    if (stateStack.get(0) == State.STARTMENU) {
        stateStack.remove(0);
    }
}

void keyPressed() {
    if (stateStack.get(0) == State.STARTMENU) {
        stateStack.remove(0);
    }

    if (stateStack.get(0) == State.OVERWORLD) {
        
        if (keyCode == LEFT) {

            if(playerSheetX == 30 && playerX - tileSize >= 0){
                playerX -= tileSize;
            }

            playerSheetX = 30;

        }

        if (keyCode == RIGHT) {


            if(playerSheetX == 90 && playerX + tileSize < cols * tileSize){
                playerX += tileSize;
            }

            playerSheetX = 90;

            
        }

        if (keyCode == UP) {
            if(playerSheetX == 60 &&playerY - tileSize >= 0){
                playerY -= tileSize;
            }

            playerSheetX = 60;
            
        }

        if (keyCode == DOWN) {

            if(playerSheetX == 0 && playerY + tileSize < rows * tileSize){
                playerY += tileSize;
            }
            playerSheetX = 0;
        }



        if (keyCode == 'B' || keyCode == 'b') {
            stateStack.add(0, State.BATTLE);
        }


    } else if (stateStack.get(0) == State.BATTLE) {
        if (keyCode == 'B' || keyCode == 'b') {
            stateStack.add(0, State.OVERWORLD);
        }
    }
}
