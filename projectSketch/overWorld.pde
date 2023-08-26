/*
int [] map = {1,1,1,1,1,1,1,1,1,1};

int [] [] tileMap = {
    {1,1,1,1,1,1,1,1,1,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,1,1,1,1,1,1,1,1,1}
};


int width = 10;
int height = 10;

*/

void overWorld(){

    background(0,0,0);

    float offsetX = width / 2 - playerX - tileSize / 2;
    float offsetY = height / 2 - playerY - tileSize / 2;

    translate(offsetX, offsetY); //set player at center of camera

    for (int i = 0; i < 15; i++) {
        for (int j = 0; j < 15; j++) {  
            fill(255,255,255);
            rect(tileSize * i, tileSize * j, tileSize, tileSize); //draw tile on map
        }
    }

    image(playerModel, playerX, playerY, tileSize, tileSize); //draw player


}