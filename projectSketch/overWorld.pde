//fields
PImage tileSheet, forest; //map textures

int[][] tileMap = { //map
    {0,0,0,0,0,0,0,0,0,0,0,0},
    {0,1,1,1,1,1,1,2,2,2,1,0},
    {0,1,1,1,1,1,1,1,2,2,1,0},
    {0,1,1,1,1,1,1,1,2,2,1,0},
    {0,1,1,1,1,1,1,1,1,1,1,0},
    {0,0,0,0,0,0,0,0,0,0,0,0},


};

int rows = tileMap.length;  
int cols = tileMap[0].length; 

String currentArea = "route1";

public void encounter(){
    setState(gameState.BATTLE);
    switch(currentArea){
        case "route1":
            currentEnemy = new Enemy("Bird", birdBattleSprite,  1, 10, 100, 100, 10, 9);
        break;
    }
    
    
    dialogue.popUp("a wild " + currentEnemy.getName() + " appeared");
}


void drawWorld() { // function to display the overworld
    background(0, 0, 0);
    translate(width / 2 - playerX - tileSize / 2, height / 2 - playerY - tileSize / 2); // set player at center of camera

    for (int row = 0; row < rows; row++) { // draw the map
        for (int col = 0; col < cols; col++) {

            int tile = tileMap[row][col];

            switch (tile) {
                case 0:
                    copy(tileSheet, 0, 0, 30, 30, tileSize * col, tileSize * row, tileSize, tileSize);
                    break;

                case 1:
                    copy(tileSheet, 30, 0, 30, 30, tileSize * col, tileSize * row, tileSize, tileSize);
                    break;

                case 2:
                    copy(tileSheet, 60, 0, 30, 30, tileSize * col, tileSize * row, tileSize, tileSize);
                    break;
            }
        }
    }
}
