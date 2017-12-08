class Bullet extends Floater
{
  protected int tickCount;
  protected boolean isGone;
  public Bullet(Spaceship cheapStuff)
  {
    corners = 5;
    int[] xS = {6, 1, -3, -3, 1};
    int[] yS = {0, 2, 2, -2, -2};
    xCorners = xS;
    yCorners = yS;
    myPointDirection = cheapStuff.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myCenterX = cheapStuff.getX();
    myCenterY = cheapStuff.getY();
    myDirectionX = (7 * Math.cos(dRadians)) + cheapStuff.getDirectionX();
    myDirectionY = (7 * Math.sin(dRadians)) + cheapStuff.getDirectionY();
    myColor = color(255);
    isGone = false;
    tickCount = 130;
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
  public void setGone(boolean bStatus) {isGone = bStatus;}
  public boolean getGone() {return isGone;}
  public void setCount(int bCount) {tickCount = bCount;}
  public int getCount() {return tickCount;}
  
  public void move()
  {
    tickCount--;
    if (tickCount == 0)
    {
      isGone = true;
    }
    if (isGone == false)
    {
      super.move();
    }
  }
  public void show()
  {
    tickCount--;
    if (tickCount == 0)
    {
      isGone = true;
    }
    if (isGone == false)
    {
      super.show();
    }
  }
}