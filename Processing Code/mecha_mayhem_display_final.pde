import processing.serial.*;
Serial myPort;
import processing.sound.*;
SoundFile opening;
SoundFile correct;
SoundFile incorrect;
SoundFile victory;
SoundFile failure;
String val = "";
boolean firstContact = false;
//int question_number = int(random(1, 24));
int n1 = 0; 
int n2 = 0;
int n3 = 0;
int n4 = 0;
int n5 = 0;
int n6 = 0;
int n7 = 0;
int n8 = 0;
int n9 = 0;
int n10 = 0;
int n11 = 0;
int n12 = 0;
int n13 = 0;
int n14 = 0;
int n15 = 0;
int n16 = 0;
int n17 = 0;
int n18 = 0;
int n19 = 0;
int n20 = 0;
int n21 = 0;
int n22 = 0;
int n23 = 0;
int n24 = 0;
int GUIn = 0;
int q1n = 0; 
int q2n = 0;
int q3n = 0;
int q4n = 0;
int q5n = 0;
int q6n = 0;
int q7n = 0;
int q8n = 0;
int q9n = 0;
int q10n = 0;
int q11n = 0;
int q12n = 0;
int q13n = 0;
int q14n = 0;
int q15n = 0;
int q16n = 0;
int q17n = 0;
int q18n = 0;
int q19n = 0;
int q20n = 0;
int q21n = 0;
int q22n = 0;
int q23n = 0;
int q24n = 0;
int h_counter = 0;
int b_counter = 0;
int la_counter = 0;
int ra_counter = 0;
int ll_counter = 0;
int rl_counter = 0;
Timer timer;
int currentTime;
PFont scifiFont;
PImage head;
PImage left_arm;
PImage body;
PImage right_arm;
PImage left_leg;
PImage right_leg;
PImage mecha1;
PImage mecha2;
PImage mecha3;
PImage mecha4;
PImage space;
PImage station;

void setup() {
  String portName = Serial.list()[0];
  myPort = new Serial(this, "COM3", 9600);
  myPort.bufferUntil('\n');
  timer = new Timer(1000);
  fullScreen();
  fill(0);
  scifiFont = createFont("Space Crusaders.otf", 30);
  head = loadImage("Head.jpg");
  left_arm = loadImage("Left Arm.jpg");
  body = loadImage("Body.jpg");
  right_arm = loadImage("Right Arm.jpg");
  left_leg = loadImage("Left Leg.jpg");
  right_leg = loadImage("Right Leg.jpg");
  mecha1 = loadImage("Mecha1.jpg");
  mecha2 = loadImage("Mecha2.jpeg");
  mecha3 = loadImage("Mecha3.jpg");
  mecha4 = loadImage("Mecha4.jpg");
  space = loadImage("Space.jpg");
  station = loadImage("Station.jpg");
  correct = new SoundFile(this, "level-up-sound-effect.mp3");
  incorrect = new SoundFile(this, "computer-fail-sound-effect.mp3");
  victory = new SoundFile(this, "level-fail-sound-effect.mp3");
  failure = new SoundFile(this, "win-sound-effect.mp3");
}

void serialEvent(Serial myPort) {
  val = myPort.readStringUntil('\n');
}

void draw() {
  println(val); //print it out in the console
  textFont(scifiFont, 50);
  text(mouseX/width + "    " + mouseY/height, mouseX/width, mouseY/height);
  if (timer.complete() == true) {
    currentTime++;
    timer.start();
  }
  opening.play();
  if (GUIn == 0) {
    show_GUI();
  }
  if (val == null) {
    background(0, 0, 0);
  }
  else {
    if (val.contains("Start") && q1n == 0) {
      GUIn++;
      q1();
    }
    if (val.contains("1") && n1 == 0) { 
      if (val.contains("Head")) {
        h_counter++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
        q1n++;
      }
      if (val.contains("Body") || val.contains("Left Arm") || val.contains("Right Arm") || val.contains("Left Leg") || val.contains("Right Leg")) { 
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
        q1n++;
      }
    }
    if (val.contains("2") && n2 == 0) {
      if (val.contains("Start") && q2n == 0) {
        q2();
      }
      if (val.contains("Body")) {
        b_counter++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
        q2n++;
      }
      if (val.contains("Head") || val.contains("Left Arm") || val.contains("Right Arm") || val.contains("Left Leg") || val.contains("Right Leg")) {
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();;
        q2n++;
      }
    }
    if (val.contains("3") && n3 == 0) {
      if (val.contains("Start") && q3n == 0) {
        q3();
      }
      if (val.contains("Left Arm")) {
        la_counter++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
        q3n++;
      }
      if (val.contains("Right Arm")) {
        ra_counter++;
        correct();
        correct.play();
        delay(2000);
        correct.stop(); 
        q3n++;
      }
      if (val.contains("Head") || val.contains("Body") || val.contains("Left Leg") || val.contains("Right Leg")) {
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
        q3n++;
      }
    }
    if (val.contains("4") && n4 == 0) {
      if (val.contains("Start") && q4n == 0) {
        q4();
      }
      if (val.contains("Left Leg")) {
        ll_counter++;
        q4n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Right Leg")) {
        rl_counter++;
        q4n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Head") || val.contains("Body") || val.contains("Left Arm") || val.contains("Right Arm")) {
        q4n++;
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
      }
    }
    if (val.contains("5") && n5 == 0) {
      if (val.contains("Start") && q5n == 0) {
        q5();
      }
      if (val.contains("Left Arm")) {
        la_counter++;
        q5n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Right Arm")) {
        ra_counter++;
        q5n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Head") || val.contains("Body") || val.contains("Left Leg") || val.contains("Right Leg")) {
        q5n++;
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
      }
    }
    if (val.contains("6") && n6 == 0) {
      if (val.contains("Start") && q6n == 0) {
        q6();
      }
      if (val.contains("Left Leg")) {
        ll_counter++;
        q6n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Right Leg")) {
        rl_counter++;
        q6n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Head") || val.contains("Body") || val.contains("Left Arm") || val.contains("Right Arm")) {
        q6n++;
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
      }
    }
    if (val.contains("7") && n7 == 0) {
      if (val.contains("Start") && q7n == 0) {
        q7();
      }
      if (val.contains("Head")) {
        h_counter++;
        q7n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Body") || val.contains("Left Arm") || val.contains("Right Arm") || val.contains("Left Leg") || val.contains("Right Leg")) {
        q7n++;
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
      }
    }
    if (val.contains("8") && n8 == 0) {
      if (val.contains("Start") && q8n == 0) {
        q8();
      }
      if (val.contains("Body")) {
        b_counter++;
        q8n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Head") || val.contains("Left Arm") || val.contains("Right Arm") || val.contains("Left Leg") || val.contains("Right Leg")) {
        q8n++;
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
      }
    }
    if (val.contains("9") && n9 == 0) {
      if (val.contains("Start") && q9n == 0) {
        q9();
      }
      if (val.contains("Left Arm")) {
        la_counter++;
        q9n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Right Arm")) {
        ra_counter++;
        q9n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Head") || val.contains("Body") || val.contains("Left Leg") || val.contains("Right Leg")) {
        q9n++;
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
      }
    }
    if (val.contains("10") && n10 == 0) {
      if (val.contains("Start") && q10n == 0) {
        q10();
      }
      if (val.contains("Left Leg")) {
        ll_counter++;
        q10n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Right Leg")) {
        rl_counter++;
        q10n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Head") || val.contains("Body") || val.contains("Left Arm") || val.contains("Right Arm")) {
        q10n++;
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
      }
    }
    if (val.contains("11") && n11 == 0) {
      if (val.contains("Start") && q11n == 0) {
        q11();
      }
      if (val.contains("Left Arm")) {
        la_counter++;
        q11n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Right Arm")) {
        ra_counter++;
        q11n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Head") || val.contains("Body") || val.contains("Left Leg") || val.contains("Right Leg")) {
        q11n++;
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
      }
    }
    if (val.contains("12") && n12 == 0) {
      if (val.contains("Start") && q12n == 0) {
        q12();
      }
      if (val.contains("Left Leg")) {
        ll_counter++;
        q12n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Right Leg")) {
        rl_counter++;
        q12n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Head") || val.contains("Body") || val.contains("Left Arm") || val.contains("Right Arm")) {
        q12n++;
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
      }
    }
    if (val.contains("13") && n13 == 0) {
      if (val.contains("Start") && q13n == 0) {
        q13();
      }
      if (val.contains("Head")) {
        h_counter++;
        q13n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Body") || val.contains("Left Arm") || val.contains("Right Arm") || val.contains("Left Leg") || val.contains("Right Leg")) {
        q13n++;
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
      }
    }
    if (val.contains("14") && n14 == 0) {
      if (val.contains("Start") && q14n == 0) {
        q14();
      }
      if (val.contains("Body")) {
        b_counter++;
        q14n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Head") || val.contains("Left Arm") || val.contains("Right Arm") || val.contains("Left Leg") || val.contains("Right Leg")) {
        q14n++;
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
      }
    }
    if (val.contains("15") && n15 == 0) {
      if (val.contains("Start") && q15n == 0) {
        q15();
      }
      if (val.contains("Left Arm")) {
        la_counter++;
        q15n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Right Arm")) {
        ra_counter++;
        q15n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Head") || val.contains("Body") || val.contains("Left Leg") || val.contains("Right Leg")) {
        q15n++;
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
      }
    }
    if (val.contains("16") && n16 == 0) {
      if (val.contains("Start") && q16n == 0) {
        q16();
      }
      if (val.contains("Left Leg")) {
        ll_counter++;
        q16n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Right Leg")) {
        rl_counter++;
        q16n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
      }
      if (val.contains("Head") || val.contains("Body") || val.contains("Left Arm") || val.contains("Right Arm")) {
        q16n++;
        incorrect();
        incorrect.play();
        delay(1000);
        incorrect.stop();
      }
    }
    if (val.contains("17") && n17 == 0) {
      if (val.contains("Start") && q17n == 0) {
        q17();
      }
      if (val.contains("Left Arm")) {
        la_counter++;
        q17n++;
        correct();
        correct.play();
        delay(2000);
        correct.stop();
       }
       if (val.contains("Right Arm")) {
         ra_counter++;
         q17n++;
         correct();
         correct.play();
         delay(2000);
         correct.stop();
       }
       if (val.contains("Head") || val.contains("Body") || val.contains("Left Leg") || val.contains("Right Leg")) {
         q17n++;
         incorrect();
         incorrect.play();
         delay(1000);
         incorrect.stop();
       }
     }
     if (val.contains("18") && n18 == 0) {
       if (val.contains("Start") && q18n == 0) {
         q18();
       }
       if (val.contains("Left Leg")) {
         ll_counter++;
         q18n++;
         correct();
         correct.play();
         delay(2000);
         correct.stop();
       }
       if (val.contains("Right Leg")) {
         rl_counter++;
         q18n++;
         correct();
         correct.play();
         delay(2000);
         correct.stop();
       }
       if (val.contains("Head") || val.contains("Body") || val.contains("Left Arm") || val.contains("Right Arm")) {
         q18n++;
         incorrect();
         incorrect.play();
         delay(1000);
         incorrect.stop();
       }
     }
     if (val.contains("19") && n19 == 0) {
       if (val.contains("Start") && q19n == 0) {
         q19();
       }
       if (val.contains("Head")) {
         h_counter++;
         q19n++;
         correct();
         correct.play();
         delay(2000);
         correct.stop();
       }
       if (val.contains("Body") || val.contains("Left Arm") || val.contains("Right Arm") || val.contains("Left Leg") || val.contains("Right Leg")) {
         q19n++;
         incorrect();
         incorrect.play();
         delay(1000);
         incorrect.stop();
       }
     }
     if (val.contains("20") && n20 == 0) {
       if (val.contains("Start") && q20n == 0) {
         q20();
       }
       if (val.contains("Body")) {
         b_counter++;
         q20n++;
         correct();
         correct.play();
         delay(2000);
         correct.stop();
       }
       if (val.contains("Head") || val.contains("Left Arm") || val.contains("Right Arm") || val.contains("Left Leg") || val.contains("Right Leg")) {
         q20n++;
         incorrect();
         incorrect.play();
         delay(1000);
         incorrect.stop();
       }
     }
     if (val.contains("21") && n21 == 0) {
       if (val.contains("Start") && q21n == 0) {
         q21();
       }
       if (val.contains("Left Arm")) {
         la_counter++;
         q21n++;
         correct();
         correct.play();
         delay(2000);
         correct.stop();
       }
       if (val.contains("Right Arm")) {
         ra_counter++;
         q21n++;
         correct();
         correct.play();
         delay(2000);
         correct.stop();
       }
       if (val.contains("Head") || val.contains("Body") || val.contains("Left Leg") || val.contains("Right Leg")) {
         q21n++;
         incorrect();
         incorrect.play();
         delay(1000);
         incorrect.stop();
       }
     }
     if (val.contains("22") && n22 == 0) {
       if (val.contains("Start") && q22n == 0) {
         q22();
       }
       if (val.contains("Left Leg")) {
         ll_counter++;
         q22n++;
         correct();
         correct.play();
         delay(2000);
         correct.stop();
       }
       if (val.contains("Right Leg")) {
         rl_counter++;
         q22n++;
         correct();
         correct.play();
         delay(2000);
         correct.stop();
       }
       if (val.contains("Head") || val.contains("Body") || val.contains("Left Arm") || val.contains("Right Arm")) {
         q22n++;
         incorrect();
         incorrect.play();
         delay(1000);
         incorrect.stop();
       }
     }
     if (val.contains("23") && n23 == 0) {
       if (val.contains("Start") && q23n == 0) {
         q23();
       }
       if (val.contains("Left Arm")) {
         la_counter++;
         q23n++;
         correct();
         correct.play();
         delay(2000);
         correct.stop();
       }
       if (val.contains("Right Arm")) {
         ra_counter++;
         q23n++;
         correct();
         correct.play();
         delay(2000);
         correct.stop();
       }
       if (val.contains("Head") || val.contains("Body") || val.contains("Left Leg") || val.contains("Right Leg")) {
         q23n++;
         incorrect();
         incorrect.play();
         delay(1000);
         incorrect.stop();
       }
     }
     if (val.contains("24") && n24 == 0) {
       if (val.contains("Start") && q24n == 0) {
         q24();
       }
       if (val.contains("Left Leg")) {
         ll_counter++;
         q24n++;
         correct();
         correct.play();
         delay(2000);
         correct.stop();
       }
       if (val.contains("Right Leg")) {
         rl_counter++;
         q24n++;
         correct();
         correct.play();
         delay(2000);
         correct.stop();
       }
       if (val.contains("Head") || val.contains("Body") || val.contains("Left Arm") || val.contains("Right Arm")) {
         q24n++;
         incorrect();
         incorrect.play();
         delay(1000);
         incorrect.stop();
       }
     }
     if (h_counter > 0 && b_counter > 0 && ra_counter > 0 && la_counter > 0 && rl_counter > 0 && ll_counter > 0) {
       q1n++;
       q2n++;
       q3n++;
       q4n++;
       q5n++;
       q6n++;
       q7n++;
       q8n++;
       q9n++;
       q10n++;
       q11n++;
       q12n++;
       q13n++;
       q14n++;
       q15n++;
       q16n++;
       q17n++;
       q18n++;
       q19n++;
       q20n++;
       q21n++;
       q22n++;
       q23n++;
       q24n++;
       n1++;
       n2++;
       n3++;
       n4++;
       n5++;
       n6++;
       n7++;
       n8++;
       n9++;
       n10++;
       n11++;
       n12++;
       n13++;
       n14++;
       n15++;
       n16++;
       n17++;
       n18++;
       n19++;
       n20++;
       n21++;
       n22++;
       n23++;
       n24++;
       complete();
       victory.play();
       delay(2000);
       victory.stop();
     }
     if (currentTime >= 120) {
       q1n++;
       q2n++;
       q3n++;
       q4n++;
       q5n++;
       q6n++;
       q7n++;
       q8n++;
       q9n++;
       q10n++;
       q11n++;
       q12n++;
       q13n++;
       q14n++;
       q15n++;
       q16n++;
       q17n++;
       q18n++;
       q19n++;
       q20n++;
       q21n++;
       q22n++;
       q23n++;
       q24n++;
       n1++;
       n2++;
       n3++;
       n4++;
       n5++;
       n6++;
       n7++;
       n8++;
       n9++;
       n10++;
       n11++;
       n12++;
       n13++;
       n14++;
       n15++;
       n16++;
       n17++;
       n18++;
       n19++;
       n20++;
       n21++;
       n22++;
       n23++;
       n24++;
       incomplete();
       failure.play();
       delay(2000);
       failure.stop();
     }
    if (val.contains("Stop")) {
      exit();
    }
  }
}

void show_GUI() {
  background(space);
  fill(255, 255, 255);
  //rect(1725, 1325, 550, 250);
  //rect(1725, 2325, 550, 250);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Mecha Mayhem", width/2, (height*.1875));
  fill(51, 229, 49);
  textAlign(CENTER);
  text("Start", width/2, (height*.4)); 
  image(mecha4, width*.05, height*.25, width*.3, height*.5);
  image(mecha1, width*.65, height*.25, width*.3, height*.5);
  textAlign(CENTER);
  text("Exit", width/2, (height*.6));
}
  
void q1() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the robot helps it see?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q2() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the robot connects its head to its legs and arms?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q3() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the robot is used for grabbing objects?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q4() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the robot helps it walk?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q5() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the robot is used for balancing?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q6() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the robot helps it take off?"  + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q7() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the robot that houses its computer brain?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q8() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part is the center of the robot?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q9() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("What part of the robot helps it feel touch?"+ " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q10() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the robot has motors that help it travel?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q11() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the robot is used for lifting objects?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q12() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the mecha helps it run?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);;
}

void q13() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("What part of the robot helps it communicate" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q14() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the robot is used for turning?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q15() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the mecha is used for climbing?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q16() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part does the robot use to kick with?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q17() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the robot senses object?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q18() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("What is the lowermost part of the robot?"  + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q19() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("What part of the robot helps it hear?"  + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q20() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the robot takes the blow from enemies?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q21() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the robot is used for pushing objects?"+ " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q22() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part of the mecha is used for jumping?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q23() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part does the robot use to punch with" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void q24() {
  background(station);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Which part supports the robot's weight?" + " " + currentTime, width/2, (height*.15));
  fill(51, 229, 49);
  text("Head", width/2, height*.2);
  image(head, width*.4, height*.25, width*.2, height*.2);
  text("Body", width/2, height*.5);
  image(body, width*.4, height*.55, width*.2, height*.2);
  text("Left Arm", width/4, height*.5);
  image(left_arm, width*.15, height*.55, width*.2, height*.2);
  text("Right Arm", 3*width/4, height*.5);
  image(right_arm, width*.65, height*.55, width*.2, height*.2);
  text("Left Leg", width/4, height*.8);
  image(left_leg, width*.15, height*.85, width*.2, height*.15);
  text("Right Arm", 3*width/4, height*.8);
  image(right_leg, width*.65, height*.85, width*.2, height*.15);
}

void correct() {
  background(station);
  fill(255, 255, 255);
  //rect(1725, 1325, 550, 250);
  //rect(1725, 2325, 550, 250);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("That's correct, good job" + " " + currentTime, width/2, height/2 //(height*.15));
  /*
  text("So far you have collected", width/2, (height*.3));
  text(h_counter + " head(s)", width/2, (height*.4));
  text(b_counter + " body(s)", width/2, (height*.5));
  text(la_counter + " left arm(s)", width/2, (height*.6));
  text(ra_counter + " right arm(s)", width/2, (height*.7));
  text(ll_counter + " left leg(s)", width/2, (height*.8));
  text(rl_counter + " right leg(s)", width/2, (height*.9));
  */
}

void incorrect() {
  background(station);
  fill(255, 255, 255);
  //rect(1725, 1325, 550, 250);
  //rect(1725, 2325, 550, 250);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("That's not quite right, try again" + " " + currentTime, width/2, height/2 //(height*.15));
}

void complete() {
  background(mecha2);
  fill(255, 255, 255);
  //rect(1725, 1325, 550, 250);
  //rect(1725, 2325, 550, 250);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Congratulations, you completed the mecha!", width/2, (height*.1875));
  text("Your game code is GPGJ", width/2, (height*.25));
  //image(mecha2, width*.25, height*.4, width*.5, height*.5);
}

void incomplete() {
  background(mecha3);
  fill(255, 255, 255);
  //rect(1725, 1325, 550, 250);
  //rect(1725, 2325, 550, 250);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Too bad, time ran out!", width/2, (height*.1875));
  text("Try again", width/2, (height*.25));
  //image(mecha3, width*.25, height*.4, width*.5, height*.5);
}
