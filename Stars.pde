class Stars //note that this class does NOT extend Floater
{
  int myX, myY;
  int size;
  int myColor = color((int)(Math.random()*255)+1, (int)(Math.random()*255)+1, (int)(Math.random()*255)+1);
  public Stars()
  {
    myX = (int)(Math.random()*1175);
    myY = (int)(Math.random()*875);
    size = (int)(Math.random()*3)+3;
  }
  public void show()
  {
    fill(myColor);
    ellipse(myX, myY, size, size);
  }
}