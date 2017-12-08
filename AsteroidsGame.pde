Spaceship Xian;
Stars [] ChairmanMao;
ArrayList <Asteroid> regList;
ArrayList <Bullet> lolAd;
ArrayList <PowerUp> healthKit;
//Asteroid [] Huan;
//Keys
boolean wIsPressed = false;
boolean aIsPressed = false;
boolean dIsPressed = false;
boolean sIsPressed = false;
//Extras
int shipHealth = 50;
int powerCount = 0;
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
  healthKit = new ArrayList <PowerUp>();
  /*Huan = new Asteroid[50];
  for (int i = 0; i < Huan.length; i++)
  {
    Huan[i] = new Asteroid();
  }*/
}

public void draw() 
{
  background(25);
  counter();
  for (int i = 0; i < lolAd.size(); i++)
  {
    lolAd.get(i).move();
    lolAd.get(i).show();
  }
  
  for (int k = 0; k < healthKit.size(); k++)
  {
    healthKit.get(k).move();
    healthKit.get(k).show();
  }
  
  for (int a = 0; a < ChairmanMao.length; a++) //stars
  {
    ChairmanMao[a].show();
  }

  for (int j = 0; j < regList.size(); j++)
  {
    regList.get(j).move();
    regList.get(j).show();
    if (dist(regList.get(j).getX(), regList.get(j).getY(), Xian.getX(), Xian.getY()) < 25)
    {
      regList.remove(j);
      regList.add(new Asteroid());
      if (takeDamage == true) {shipHealth = shipHealth - 10;}
    }
  }
  
  for (int j = 0; j < regList.size(); j++)
  {
    for (int i = 0; i < lolAd.size(); i++)
    {
      if (dist(regList.get(j).getX(), regList.get(j).getY(), lolAd.get(i).getX(), lolAd.get(i).getY()) <= 18)
      {
        regList.remove(j);
        lolAd.remove(i);
        regList.add(new Asteroid());
        j--;
        i--;
        break;
      }
    }
  }
  //for (int k = 0; k < healthKit.size(); k++)
  
  textSize(16);
  fill(100,150,150);
  text("Health: " + shipHealth, 25, 40);
  
  Xian.show();
  Xian.move();

  if (wIsPressed == true) {Xian.accelerate(0.20);}
  if (sIsPressed == true) {Xian.accelerate(-0.20);}
  if (dIsPressed == true) {Xian.turn(12);}
  else if (aIsPressed == true) {Xian.turn(-12);}
  
  /*for (int i = 0; i < Huan.length; i++)
  {
    Huan[i].show();
    Huan[i].move();
  }*/
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

public void keyReleased()
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

public void counter()
{
  powerCount++;
  if (powerCount >= 10000)
  {
    healthKit.add(new PowerUp());
    powerCount = 0;
  }
}