PImage grassTile, smallGrass, forest;



int[][] tileMap = {
    {1,1,1,1,1,1,1,1,1,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,1,1,1,1,1,1,1,1,1}
};

int rows = tileMap.length; 
int cols = tileMap[0].length; 

int playerSheetX = 0; 
int playerSheetY = 0;






void overWorld(){

    background(0,0,0);
    image(forest, 0, 0, width, height); 


    float offsetX = width / 2 - playerX - tileSize / 2;
    float offsetY = height / 2 - playerY - tileSize / 2;

    translate(offsetX, offsetY); //set player at center of camera

    for(int row = 0 ; row < rows ; row++){
        for(int col = 0 ; col < cols ; col++ ){
            int tile = tileMap[row][col];

            if (tile == 0) {

                image(grassTile, tileSize * col, tileSize * row, tileSize, tileSize); 

            } else {
                image(smallGrass, tileSize * col, tileSize * row, tileSize, tileSize); 
            }

        }
    }


    copy(characterSheet, 
    playerSheetX, playerSheetY, 30, 30,
    playerX, playerY, tileSize, tileSize
    ); //draw player



}