public class Asteroid extends Floater
{
  private int rotSpeed;
  public Asteroid()
  {
    corners = 8;
    int[] xS = {15, 10, 5, -6, -12, -6, 0, 7};
    int[] yS = {1, -10, -14, -13, 0, 11, 9, 10};
    xCorners = xS;
    yCorners = yS;
    myColor = color(150);
    myCenterX = (int)(Math.random()*1000)+50;
    myCenterY = (int)(Math.random()*100)+10;
    myDirectionX = (int)(Math.random()*5)-2;
    myDirectionY = (int)(Math.random()*5)-2;
    myPointDirection = 0;
    rotSpeed = ((int)(Math.random()*5)-2);
  }
  public void setX(int x) {myCenterX = x;}  
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}   
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY = y;}  
  public double getDirectionY() {return myDirectionY;}  
  public void setPointDirection(int degrees) {myPointDirection = degrees;}  
  public double getPointDirection() {return myPointDirection;} 
  
  public void move()
  {
    turn(rotSpeed);
    super.move();
  }
}