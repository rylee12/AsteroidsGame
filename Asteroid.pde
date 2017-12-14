public class Asteroid extends Floater
{
  private int rotSpeed;
  public Asteroid()
  {
    corners = 8;
    int[] xS = {12, 7, 2, -3, -9, -3, 1, 4};
    int[] yS = {0, -9, -13, -12, 0, 10, 8, 9};
    xCorners = xS;
    yCorners = yS;
    myColor = color(150);
    myCenterX = (int)(Math.random()*900)+50;
    myCenterY = (int)(Math.random()*250)+10;
    myDirectionX = (int)(Math.random()*5)-2;
    myDirectionY = (int)(Math.random()*5)-2;
    myPointDirection = (int)(Math.random()*360);
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