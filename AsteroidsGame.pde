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
int invinTimer = 240;
int pressCount = 1;
int pointSystem = 0;
boolean gameOver = false;
boolean takeDamage = true;
boolean pointGain = true;

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
  shipNodamage();
  for (int i = 0; i < lolAd.size(); i++)
  {
    lolAd.get(i).move();
    lolAd.get(i).show();
  }
  
  for (int k = 0; k < healthKit.size(); k++)
  {
    healthKit.get(k).move();
    healthKit.get(k).show();
    if (dist(healthKit.get(k).getX(), healthKit.get(k).getY(), Xian.getX(), Xian.getY()) <= 15)
    {
      healthKit.remove(k);
      k--;
      shipHealth = shipHealth + 5;
    }
  }
  
  for (int a = 0; a < ChairmanMao.length; a++) //stars
  {
    ChairmanMao[a].show();
  }

  for (int j = 0; j < regList.size(); j++)
  {
    regList.get(j).move();
    regList.get(j).show();
    if (dist(regList.get(j).getX(), regList.get(j).getY(), Xian.getX(), Xian.getY()) < 24)
    {
      regList.remove(j);
      regList.add(new Asteroid());
      j--;
      if (pointGain == true) {pointSystem = pointSystem + 10;}
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
        if (pointGain == true) {pointSystem = pointSystem + 10;}
        i--;
        j--;
        break;
      }
    }
  }
  
  for (int k = 0; k < healthKit.size(); k++)
  {
    for (int i = 0; i < lolAd.size(); i++)
    {
      if (dist(healthKit.get(k).getX(), healthKit.get(k).getY(), lolAd.get(i).getX(), lolAd.get(i).getY()) < 11)
      {
        healthKit.remove(k);
        lolAd.remove(i);
        shipHealth = shipHealth + 5;
        k--;
        i--;
        break;
      }
    }
  }

  textSize(16);
  fill(255, 255, 255);
  text("Health: " + shipHealth, 25, 40);
  text("Points: " + pointSystem, 950, 40);
  
  if (gameOver == false)
  {
    Xian.show();
    Xian.move();
  }
  
  if (shipHealth <= 0)
  {
    gameOver = true;
    shipHealth = 0;
    pointGain = false;
    textSize(30);
    text("Game Over", 450, 350);
    text("Your score is "+ pointSystem, 415, 400);
  }

  if (wIsPressed == true) {Xian.accelerate(0.15);}
  if (sIsPressed == true) {Xian.accelerate(-0.15);}
  if (dIsPressed == true) {Xian.turn(10);}
  else if (aIsPressed == true) {Xian.turn(-10);}
  
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
  if (key == 'x' && pressCount > 0)
  {
    takeDamage = false;
    pressCount = 0;
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
  if (powerCount >= 2000)
  {
    healthKit.add(new PowerUp());
    powerCount = 0;
  }
}

public void shipNodamage()
{
  if (takeDamage == false)
  {
    textSize(16);
    fill(255, 255, 255);
    text("Invulnerability Mode Activated", 25, 70);
    invinTimer--;
  }
  if (invinTimer <= 0)
  {
    takeDamage = true;
    invinTimer = 0;
  }
}