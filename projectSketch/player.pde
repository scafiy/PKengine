//fields
PImage characterSheet;
Player player;

int playerSize = tileSize;

int playerX = 0; //x positon of player
int playerY = 0; //y positon of player

int playerXV = 0; //x velocity of player
int playerYV = 0;  //y velocity of player

int playerSheetX = 0; //x position on sprite sheet
int playerSheetY = 0; //y position on sprite sheet


public class Player{
    //fields
    private int level;
    private int exp;

    
    //constructer
    public Player(int level, int exp) {
        this.level = level;
        this.exp = exp;
    }

    public void drawSprite(){ //draw player sprite
        copy(characterSheet, 
        playerSheetX, playerSheetY, 30, 30,
        playerX, playerY, tileSize, tileSize); 
    }

    public void move(int keyCode) { 

        if (keyCode == 38){ //move up
            if(playerYV == 0 && playerXV == 0){
                playerSheetX = 60;
            }
            if(playerY - tileSize >= 0 && playerYV == 0 && playerXV == 0){
                playerYV -= tileSize;
            }
        }

        if (keyCode == 40){ //move down
            if(playerYV == 0 && playerXV == 0){
                playerSheetX = 0;
            }
            if( playerY + tileSize < rows * tileSize && playerYV == 0 && playerXV == 0){
                playerYV += tileSize;
            }

        }

        if (keyCode == 37){ //move left
            if(playerYV == 0 && playerXV == 0){
                playerSheetX = 30;
            }
            if( playerX - tileSize >= 0 && playerYV == 0 && playerXV == 0){
                playerXV -= tileSize;
            }
        }

        if (keyCode == 39){ //move right
            if(playerYV == 0 && playerXV == 0){
                playerSheetX = 90;
            }
            if( playerX + tileSize < cols * tileSize && playerYV == 0 && playerXV == 0){
                playerXV += tileSize;
            }
        }

    }


    public void updatePosition(){ //move's player position based on velocity and displays walking animation
        if(playerXV > 0){
            playerXV -= 4;
            playerX += 4;
        }
        if(playerXV < 0){
            playerXV += 4;
            playerX -= 4;        
        }
        if(playerYV > 0){
            playerYV -= 4;
            playerY += 4;
        }
        if(playerYV < 0){
            playerYV += 4;
            playerY -= 4;
        }

        if(playerXV != 0 || playerYV != 0){
            if(playerSheetY == 30){
                playerSheetY = 0;
            }
            else{
                playerSheetY = 30;
            }
        }
    }

}

