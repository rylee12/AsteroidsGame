class Spaceship extends Floater  
{
  public Spaceship()
  {
    corners = 13;
    xCorners = new int[corners];
    yCorners = new int[corners];
    myColor = color(255);
    myCenterX = 500;
    myCenterY = 350;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    xCorners[0] = 22; //tip of ship
    yCorners[0] = 0;
    xCorners[1] = 2;
    yCorners[1] = 5;
    xCorners[2] = 11; //spike at top
    yCorners[2] = 5;
    xCorners[3] = 2;
    yCorners[3] = 8;
    xCorners[4] = -21; //end wing-tip (top)
    yCorners[4] = 12;
    xCorners[5] = -12;
    yCorners[5] = 3;
    xCorners[6] = -17; //6-7: Exhaust End point
    yCorners[6] = 3;
    xCorners[7] = -17;
    yCorners[7] = -3;
    xCorners[8] = -12;
    yCorners[8] = -3;
    xCorners[9] = -21;  //end wing-tip (bottom)
    yCorners[9] = -12;
    xCorners[10] = 2;
    yCorners[10] = -8;
    xCorners[11] = 11;  //spike at bottom
    yCorners[11] = -5;
    xCorners[12] = 2;
    yCorners[12] = -5;
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
    strokeWeight(0.7);
    super.show();
  }
}