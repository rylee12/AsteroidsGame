class Bullet extends Floater
{
  public Bullet(Spaceship cheapStuff)
  {
    myCenterX = cheapStuff.getX();
    myCenterY = cheapStuff.getY();
    myDirectionX = cheapStuff.getDirectionX();
    myDirectionY = cheapStuff.getDirectionY();
    myPointDirection = double dRadians =myPointDirection*(Math.PI/180);
  }
}