Spaceship Xian;
Stars [] ChairmanMao;
ArrayList <Asteroid> regList;
Asteroid [] Huan;
boolean wIsPressed = false;
boolean aIsPressed = false;
boolean dIsPressed = false;
boolean sIsPressed = false;
public void setup() 
{
  size(1200, 900);
  Xian = new Spaceship();
  ChairmanMao = new Stars[150];
  for (int i = 0; i < ChairmanMao.length; i++)
  {
    ChairmanMao[i] = new Stars();
  }
  regList = new ArrayList <Asteroid>();
  for (int i = 0; i < 30; i++)
  {
    regList.add(new Asteroid());
  }
  Huan = new Asteroid[50];
  for (int i = 0; i < Huan.length; i++)
  {
    Huan[i] = new Asteroid();
  }
}
public void draw() 
{
  background(25);
  for (int i = 0; i < ChairmanMao.length; i++)
  {
    ChairmanMao[i].show();
  }
  for (int i = 0; i < Huan.length; i++)
  {
    Huan[i].show();
    Huan[i].move();
  }
  for (int i = 0; i < regList.size(); i++)
  {
    regList.get(i).move();
    regList.get(i).show();
  }
  for (int i = 0; i < regList.size(); i++)
  {
    if (dist(regList.get(i).getX(), regList.get(i).getY(), Xian.getX(), Xian.getY()) < 26)
    {
      regList.remove(i);
    }
  }
  Xian.show();
  Xian.move();
  if (wIsPressed == true)
  {
    Xian.accelerate(0.20);
  }
  if (sIsPressed == true)
  {
    Xian.accelerate(-0.20);
  }
  if (dIsPressed == true)
  {
    Xian.turn(10);
  }
  else if (aIsPressed == true)
  {
    Xian.turn(-10);
  }
}
public void keyPressed()
{
  if (key == 'h')
  {
    Xian.setDirectionX(0);
    Xian.setDirectionY(0);
    Xian.setX((int)(Math.random()*950)+50);
    Xian.setY((int)(Math.random()*750)+50);
    Xian.setPointDirection((int)(Math.random()*360));
  }
  if (key == 'w')
  {
    wIsPressed = true;
  }
  else if (key == 'd')
  {
    dIsPressed = true;
  }
  else if (key == 'a')
  {
    aIsPressed = true;
  }
  else if (key == 's')
  {
    sIsPressed = true;
  }
}
void keyReleased()
{
  if (key == 'w')
  {
    wIsPressed = false;
  }
  else if (key == 'd')
  {
    dIsPressed = false;
  }
  else if (key == 'a')
  {
    aIsPressed = false;
  }
  else if (key == 's')
  {
    sIsPressed = false;
  }
}