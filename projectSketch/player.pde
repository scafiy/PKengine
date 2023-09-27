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

int playerWalkingAnimationFrame = 0;

int playerSpeed = 2;

Enemy currentEnemy;

public class Player{
    //fields
    private int level;
    private int currentEXP;
    private int maxEXP;
    private float currentHP;
    private float maxHP;
    private float ATK;
    private float SPEED;
    
    //constructer
    public Player(int level, int exp) {
        this.level = level;
        this.currentEXP = currentEXP;
        this.maxEXP = 10;
        this.currentHP = 100;
        this.maxHP = 100;
        this.ATK = 10;
        this.SPEED = 10;

    }

    public float getCurrentHP(){
        return currentHP;
    }

    public void takeDamage(float damage){
        if (this.currentHP != 0) this.currentHP -= damage;
    }

    public float getMaxHP(){
        return maxHP;
    }

    public int getLevel(){
        return level;
    }

    public float getATK(){
        return ATK;
    }

    public float getSPEED(){
        return SPEED;
    }

    public float getCurrentEXP(){
        return currentEXP;
    }

    public float getMaxEXP(){
        return maxEXP;
    }


    public void levelUp(double expGain){
        currentEXP += expGain;
        if (currentEXP >= maxEXP){
            level++;
            currentEXP = 0;
            maxEXP += 10;
            maxHP += 10;
            currentHP = maxHP;
            ATK += 5;
            SPEED += 5;
        }
    }

    public void heal(float HP){
        if (currentHP + HP >= maxHP) currentHP = maxHP;
        else currentHP += HP;
    }

    public void drawSprite(){ //draw player sprite
        copy(characterSheet, 
        playerSheetX, playerWalkingAnimationFrame * 30, 30, 30,
        playerX, playerY, tileSize, tileSize); 
    }

    public void moveUp(){
        if(playerYV == 0 && playerXV == 0){
            playerSheetX = 60;
        }
        if(playerY - tileSize >= 0 && playerYV == 0 && playerXV == 0){
            playerYV -= tileSize;
        }
        
    }

    
    public void moveDown(){
        if(playerYV == 0 && playerXV == 0){
            playerSheetX = 0;
        }
        if( playerY + tileSize < rows * tileSize && playerYV == 0 && playerXV == 0){
            playerYV += tileSize;
        }
    }

    
    public void moveLeft(){
        if(playerYV == 0 && playerXV == 0){
            playerSheetX = 30;
        }
        if( playerX - tileSize >= 0 && playerYV == 0 && playerXV == 0){
            playerXV -= tileSize;
        }

        
    }

    
    public void moveRight(){
        if(playerYV == 0 && playerXV == 0){
            playerSheetX = 90;
        }
        if( playerX + tileSize < cols * tileSize && playerYV == 0 && playerXV == 0){
            playerXV += tileSize;
        }
    }



    public void updatePosition(){ //move's player position based on velocity and displays walking animation
        if(playerXV > 0){
            playerXV -= playerSpeed;
            playerX += playerSpeed;
        }
        if(playerXV < 0){
            playerXV += playerSpeed;
            playerX -= playerSpeed;        
        }
        if(playerYV > 0){
            playerYV -= playerSpeed;
            playerY += playerSpeed;
        }
        if(playerYV < 0){
            playerYV += playerSpeed;
            playerY -= playerSpeed;
        }

        if(playerXV != 0 || playerYV != 0){
            if(playerWalkingAnimationFrame >= 1) playerWalkingAnimationFrame = 0;
            else playerWalkingAnimationFrame++;
        }

        else playerWalkingAnimationFrame = 0;



    }

}

