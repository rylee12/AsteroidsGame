Spaceship Xian;
Stars [] ChairmanMao;
ArrayList <Asteroid> regList;
ArrayList <Bullet> lolAd;
//Asteroid [] Huan;
//Keys
boolean wIsPressed = false;
boolean aIsPressed = false;
boolean dIsPressed = false;
boolean sIsPressed = false;
//Extras
int shipHealth = 50;
int tickCount = 0;
boolean gameOver = false;
boolean takeDamage = true;
public void setup() 
{
  size(1050, 700);
  Xian = new Spaceship();
  ChairmanMao = new Stars[150];
  for (int a = 0; a < ChairmanMao.length; a++)
  {
    ChairmanMao[a] = new Stars();
  }
  regList = new ArrayList <Asteroid>();
  for (int j = 0; j < 30; j++)
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
  for (int i = 0; i < lolAd.size(); i++)
  {
    lolAd.get(i).move();
    lolAd.get(i).show();
    if (tickCount >= 95)
    {
      lolAd.remove(i);
      tickCount = 0;
    }
  }
  for (int a = 0; a < ChairmanMao.length; a++) //stars
  {
    ChairmanMao[a].show();
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
      if (takeDamage == true) {shipHealth = shipHealth - 10;}
    }
  }
  for (int j = 0; j < regList.size(); j++)
  {
    for (int i = 0; i < lolAd.size(); i++)
    {
      if (dist(regList.get(j).getX(), regList.get(j).getY(), lolAd.get(i).getX(), lolAd.get(i).getX()) <= 19)
    {
      regList.remove(j);
      lolAd.remove(i);
      break;
    }
    }
  }
  if (shipHealth >= 0)
  {
    Xian.show();
    Xian.move();
  }
  if (wIsPressed == true) {Xian.accelerate(0.20);}
  if (sIsPressed == true) {Xian.accelerate(-0.20);}
  if (dIsPressed == true) {Xian.turn(10);}
  else if (aIsPressed == true) {Xian.turn(-10);}
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
  if (key == 'x')
  {
    takeDamage = false;
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