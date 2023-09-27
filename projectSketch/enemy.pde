public class Enemy{
    //fields
    private String name;
    private int level;
    private PImage sprite;
    private float EXP;
    private float currentHP;
    private float maxHP;
    private float ATK;
    private float SPEED;

    //constructer
    public Enemy(String name, PImage sprite, int level, float EXP, float currentHP,float maxHP, float ATK, float SPEED) {
        this.name = name;
        this.level = level;
        this.currentHP = currentHP;
        this.maxHP = maxHP;
        this.ATK = ATK;
        this.SPEED = SPEED;
        this.EXP = EXP;
        this.sprite = sprite;

    }

    //getter
    public String getName() {return name;}
    public int getLevel() {return level;}
    public float getEXP() {return EXP;}
    public float getMaxHP() {return maxHP;}
    public float getCurrentHP() {return currentHP;}
    public float getATK() {return ATK;}
    public float getSPEED() {return SPEED;}
    public PImage getSprite() {return sprite;}

    public void takeDamage(float damage){
        if (this.currentHP != 0) this.currentHP -= damage;
    }





}

