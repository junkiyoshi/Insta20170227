import de.voidplus.leapmotion.*;

LeapMotion leap;
Particle particle;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  colorMode(HSB);
  rectMode(CENTER);
  
  leap = new LeapMotion(this);
  particle = new Particle(new PVector(width / 2, height / 2, 0));
}

void draw()
{
  background(0);
   
  float size = 30;
  float x = 0;
  float y = 0;
  
  for(Hand hand : leap.getHands())
  {
    if(hand.isRight())
    {
      Finger thumb = hand.getThumb();
      Finger index = hand.getIndexFinger();
      
      float distance = PVector.dist(thumb.getPosition(), index.getPosition());
      size = distance;
      
      float _x = atan2(thumb.getPosition().y - index.getPosition().y, thumb.getPosition().x - index.getPosition().x);
      x = degrees(_x);
      
      float _y = atan2(thumb.getPosition().y - index.getPosition().y, thumb.getPosition().x - index.getPosition().x);
      y = degrees(_y);
    }
  }
  
  particle.update(size, x, y);
  particle.display();
    
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 900)
  {
     exit();
  }
  */
}