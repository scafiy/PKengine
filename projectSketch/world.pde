World world;

PImage tileSheet, forest; //map textures

int[][] area1TileMap = { //tile map
    {1,1,1,1,1,1,1,1,1,1,1,1},
    {1,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,2,2,2,2,0,0,0,0,0,1},
    {1,0,2,2,2,2,0,0,0,0,0,3},
    {1,0,2,2,0,0,0,0,0,0,0,3},
    {1,0,2,2,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,1},
    {1,1,1,1,1,1,1,1,1,1,1,1},

};


int[][] area2TileMap = { //tile map
    {1,1,1,1,1,3,3,1,1,1,1,1},
    {1,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,2,2,2,2,0,0,0,0,0,1},
    {4,0,2,2,2,2,0,0,0,0,0,3},
    {4,0,2,2,0,0,0,0,0,0,0,3},
    {1,0,2,2,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,0,0,1},

    {1,1,1,1,1,3,3,1,1,1,1,1},

};

int rows; // number of rows in the tile map
int cols; // number of columns in the tile map

ArrayList<Enemy> area1Enemies = new ArrayList<Enemy>();

int prevTileX = -1; // initialize previous tile coordinates to -1
int prevTileY = -1;


public class World{
    private String currentArea;
    private int[][] currentTileMap;

    public World(String currentArea){
        this.currentArea = currentArea;

        switch(currentArea){
            case "area1": this.currentTileMap = area1TileMap;
            break;
            case "area2": this.currentTileMap = area2TileMap;
            break;
        }
    }

    void setMap(String map){
        this.currentArea = map;
    }

    void encounter(){
        double encounterRate = 0.3; // 10% chance of encounter
        if(random(0, 1.00) < 1 - encounterRate) return; 

        setState(gameState.BATTLE);
        switch(currentArea){
            case "area1":
                currentEnemy = new Enemy(area1Enemies.get((int) random(area1Enemies.size())), (int) random(1,7)); // get a random enemy from the list
            break;
        }
        
        dialogue.popUp("a wild " + currentEnemy.getName() + " appeared!");
    }

    void teleportTo(String destination){
        //requirement to access new area
        switch(destination){
            case "area1": 
                currentArea = destination;
                currentTileMap = area1TileMap;
                playerX = tileSize;
                prevTileX = -1; // Reset the previous tile X-coordinate
                prevTileY = -1; // Reset the previous tile Y-coordinate
                rows = currentTileMap.length;  
                cols = currentTileMap[0].length; 
                playerX = (cols * tileSize) - tileSize*2;

            break;

            case "area2":
                if (player.getLevel() < 10) {
                    dialogue.popUp("You need to be level 10 to leave.");
                    dialogue.add("Try running around in the tall grass.");
                    playerXV = -tileSize;
                }

                else{
                    currentArea = destination;
                    currentTileMap = area2TileMap;
                    playerX = tileSize;
                }

            break;
        }

    }

    void drawMap(){
        rows = currentTileMap.length;  
        cols = currentTileMap[0].length; 
        
        background(0, 0, 0);
        translate(width / 2 - playerX - tileSize / 2, height / 2 - playerY - tileSize / 2); // set player at center of camera

        int currentTileX = floor((playerX + tileSize / 2) / tileSize); // calculate current tile coordinates
        int currentTileY = floor((playerY + tileSize / 2) / tileSize);

        if (playerX % tileSize == 0 && playerY % tileSize == 0 && (currentTileX != prevTileX || currentTileY != prevTileY)) { // check if player has fully landed on a new tile
            int tile = currentTileMap[currentTileY][currentTileX];
            if (tile == 2) encounter(); 
            if (tile == 3) {
                world.teleportTo("area2");
                return;
            }
            if (tile == 4) {
                world.teleportTo("area1");
                return;
            }

            prevTileX = currentTileX; 
            prevTileY = currentTileY;
        }

        
        for (int row = 0; row < rows; row++) { // draw the map
            for (int col = 0; col < cols; col++) {
                int tile = currentTileMap[row][col];

                switch (tile) {
                    case 0:
                        copy(tileSheet, 0, 0, 30-2, 30, tileSize * col, tileSize * row, tileSize, tileSize);
                        break;

                    case 1:
                        copy(tileSheet, 30, 0, 30-2, 30, tileSize * col, tileSize * row, tileSize, tileSize);
                        break;

                    case 2:
                        copy(tileSheet, 60, 0, 30-2, 30, tileSize * col, tileSize * row, tileSize, tileSize);
                        break;

                     case 3:
                        fill(0);
                        rect(tileSize * col, tileSize * row, tileSize, tileSize);
                        break;
                }
            }
        }
  
    }







}