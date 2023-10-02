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

String currentArea = "area1";

ArrayList<Enemy> area1Enemies = new ArrayList<Enemy>();

int prevTileX = -1; // initialize previous tile coordinates to -1
int prevTileY = -1;

public void encounter(){
    double encounterRate = 0.2; // 10% chance of encounter
    if(random(0, 1.00) < 1 - encounterRate) return; 

    setState(gameState.BATTLE);
    switch(currentArea){
        case "area1":
            currentEnemy = new Enemy(area1Enemies.get((int) random(area1Enemies.size()))); // get a random enemy from the list
        break;
    }
    
    dialogue.popUp("a wild " + currentEnemy.getName() + " appeared!");
}


void drawWorld() { // function to display the overworld
    background(0, 0, 0);
    translate(width / 2 - playerX - tileSize / 2, height / 2 - playerY - tileSize / 2); // set player at center of camera


    

    int currentTileX = floor((playerX + tileSize / 2) / tileSize); // calculate current tile coordinates
    int currentTileY = floor((playerY + tileSize / 2) / tileSize);
    

    if (currentTileX != prevTileX || currentTileY != prevTileY) { // check if player has stepped on a new tile
        int tile = tileMap[currentTileY][currentTileX];
        if (tile == 2) { // check if the new tile is the specified tile
            encounter(); // trigger encounter method
        }
        prevTileX = currentTileX; // update previous tile coordinates
        prevTileY = currentTileY;
    }




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
