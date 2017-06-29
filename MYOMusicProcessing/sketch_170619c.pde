import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;



import de.voidplus.myo.*;

Minim minim; //minim library object, we will call function of this library using this object.
AudioPlayer play0,play1,play2,play3,play4;  //this is the variable to produce sound
Myo myo;

PImage[] img;
boolean[] active;

void setup() {
  size(800, 200);
  background(255);
  // ...

  myo = new Myo(this);
  //lockingPolicy = new String("none");
  myo.setLockingPolicy(Myo.LockingPolicy.NONE);
  myo.unlock(Myo.Unlock.TIMED);
  // myo.setVerbose(true);
  // myo.setVerboseLevel(2); // Default: 1 (1-3)
  
  myo.setFrequency(10);
  
  img = new PImage[5];
  img[0] = loadImage("data/double_tab.png");
  img[1] = loadImage("data/spread_fingers.png");
  img[2] = loadImage("data/wave_right.png");
  img[3] = loadImage("data/wave_left.png");
  img[4] = loadImage("data/make_a_fist.png");
  
  active = new boolean[5];
  resetImages();
  
  minim = new Minim(this);
  play0 = minim.loadFile("data/snare1.mp3");
  play1 = minim.loadFile("data/martin.mp3");
  play2 = minim.loadFile("data/kick.mp3");
  play3 = minim.loadFile("data/hip_hop_bass_line.mp3");
  play4 = minim.loadFile("data/hihat-open.mp3");
}

void resetImages(){
  for(int i = 0; i<5; i++){
    active[i] = false;
  }
}

void draw() {
  background(255);
  // ...

  for (int i = 0; i<5; i++) {
    tint(255, (active[i]) ? 100 : 50);
    image(img[i], ((140*i)+(i*10))+30, 30, 140, 140);
  }
}

void myoOnPose(Device myo, long timestamp, Pose pose) {
  
  if (!pose.getType().toString().equals("REST")) {
    resetImages();
  }
  
  switch (pose.getType()) {
  case REST:
    // resetImages();
    break;
  case FIST:
    active[4] = true;
    myo.vibrate();
    play0.loop();
    break;
  case FINGERS_SPREAD:
    myo.vibrate();
    active[1] = true;
    play1.loop();
    break;
  case DOUBLE_TAP:
    active[0] = true;
    myo.vibrate();
    play2.loop();
    break;
  case WAVE_IN:
    active[2] = true;
    myo.vibrate();
    play3.loop();
    break;
  case WAVE_OUT:
    active[3] = true;
    myo.vibrate();
    play4.loop();
    break;
  default:
    break;
  }
}

void myoOnLock(Device myo, long timestamp) {
  resetImages();
}

void myoOnUnLock(Device myo, long timestamp) {
  resetImages();
}