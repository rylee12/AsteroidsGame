class Bullet extends Floater
{
  protected int tickCount;
  protected boolean isGone;
  public Bullet(Spaceship cheapStuff)
  {
    myPointDirection = cheapStuff.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myCenterX = cheapStuff.getX();
    myCenterY = cheapStuff.getY();
    myDirectionX = (5 * Math.cos(dRadians)) + cheapStuff.getDirectionX();
    myDirectionY = (5 * Math.sin(dRadians)) + cheapStuff.getDirectionY();
    myColor = color(255);
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
  
  public void show()
  {
    ellipse((float)myCenterX, (float)myCenterY, 6, 6);
    super.show();
  }
}