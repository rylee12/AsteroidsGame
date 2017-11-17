Spaceship Xian;
Stars [] ChairmanMao;
ArrayList <Asteroid> regList;
ArrayList <Bullet> lolAd;
//Asteroid [] Huan;
boolean wIsPressed = false;
boolean aIsPressed = false;
boolean dIsPressed = false;
boolean sIsPressed = false;
public void setup() 
{
  size(1150, 800);
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
  lolAd = new ArrayList <Bullet>();
  /*Huan = new Asteroid[50];
  for (int i = 0; i < Huan.length; i++)
  {
    Huan[i] = new Asteroid();
  }*/
}
public void draw() 
{
  background(25);
  for (int i = 0; i < ChairmanMao.length; i++) //stars
  {
    ChairmanMao[i].show();
  }
  /*for (int i = 0; i < Huan.length; i++)
  {
    Huan[i].show();
    Huan[i].move();
  }*/
  for (int j = 0; j < regList.size(); j++)
  {
    regList.get(j).move();
    regList.get(j).show();
    if (dist(regList.get(j).getX(), regList.get(j).getY(), Xian.getX(), Xian.getY()) < 26)
    {
      regList.remove(j);
    }
  }
  for (int i = 0; i < lolAd.size(); i++)
  {
    lolAd.get(i).move();
    lolAd.get(i).show();
  }
  for (int i = 0; i < lolAd.size(); i++)
  {
    for (int j = 0; j < regList.size(); j++)
    {
    if (dist(regList.get(j).getX(), regList.get(j).getY(), lolAd.get(i).getX(), lolAd.get(i).getX()) < 10)
    {
      regList.remove(j);
      lolAd.remove(i);
      j--;
      i--;
    }
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

public void mousePressed()
{
  lolAd.add(new Bullet(Xian));
}