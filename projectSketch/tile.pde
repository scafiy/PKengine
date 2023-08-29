public class Tile {
    private int texture;
    private boolean walkable;

    public Tile(int texture, boolean walkable) {
        this.texture = texture;
        this.walkable = walkable;
    }

    public int getTexture() {
        return texture;
    }

    public boolean isWalkable() {
        return walkable;
    }
}
