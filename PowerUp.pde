public class PowerUp extends Floater
{
  public PowerUp()
  {
    corners = 4;
    int[] xS = {6, -6, -6, 6};
    int[] yS = {6, 6, -6, -6};
    xCorners = xS;
    yCorners = yS;
    myPointDirection = 0;
    //double dRadians = myPointDirection*(Math.PI/180);
    myCenterX = (int)(Math.random()*900)+50;
    myCenterY = (int)(Math.random()*600)+50;
    myDirectionX = 0;
    myDirectionY = 0;
    myColor = color(255, 255, 255);
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
    super.show();
    fill(255, 0 , 0);
    strokeWeight(0);
    rect((float)myCenterX-5, (float)myCenterY-1, 11, 3);
    rect((float)myCenterX-1, (float)myCenterY-5, 3, 11);
  }
}