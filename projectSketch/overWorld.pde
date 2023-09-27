//fields
PImage tileSheet, forest; //map textures

int[][] tileMap = { //map
    {1,1,1,1,1,1,1,1,1,1,1,1},
    {1,0,0,0,0,0,0,0,0,1,1,1},
    {1,0,0,0,0,0,0,0,0,1,1,1},
    {1,0,0,0,0,0,0,0,0,1,1,1},
    {1,0,0,0,0,0,0,0,2,1,1,1},
    {1,1,1,1,1,1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1,1,1,1,1,1},
    {1,1,1,1,1,1,1,1,1,1,1,1}

};

int rows = tileMap.length;  
int cols = tileMap[0].length; 


void drawWorld() { // function to display the overworld
    background(0, 0, 0);
    translate(width / 2 - playerX - tileSize / 2, height / 2 - playerY - tileSize / 2); // set player at center of camera

    for (int row = 0; row < rows; row++) { // draw the map
        for (int col = 0; col < cols; col++) {

            int tile = tileMap[row][col];

            switch (tile) {
                case 0:
                    copy(tileSheet, 30, 0, 30, 30, tileSize * col, tileSize * row, tileSize, tileSize);
                    break;

                case 1:
                    copy(tileSheet, 0, 0, 30, 30, tileSize * col, tileSize * row, tileSize, tileSize);
                    break;
            }
        }
    }
}
