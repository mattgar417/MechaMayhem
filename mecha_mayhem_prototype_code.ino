#include <LiquidCrystal.h>
#include "Arduino.h"
#include "SoftwareSerial.h"
#include "DFRobotDFPlayerMini.h
int POTValue = 0
static const uint8_t PIN_MP3_TX = 12;
static const uint8_t PIN_MP3_RX = 13;
SoftwareSerial softwareSerial(PIN_MP3_RX, PIN_MP3_TX);
const int button = 7;
const int led0 = 9;
const int led1 = 10;
const int led2 = 11;
const int led3 = 12;
const int led 4 = 13;

void setup() {
pinMode(button, INPUT_PULLUP);
pinMode(led0, OUTPUT);
pinMode(led1, OUTPUT);
pinMode(led2, OUTPUT);
pinMode(led3, OUTPUT);
pinMode(led3, OUTPUT);
lcd.begin(16,2); // Initializes the interface to the LCD screen, and specifies the dimensions (width and height) of the display }
    // Init USB serial port for debugging
  // Init USB serial port for debugging
  Serial.begin(9600);
  // Init serial port for DFPlayer Mini
  softwareSerial.begin(9600);

  // Start communication with DFPlayer Mini
  if (player.begin(softwareSerial)) {
   Serial.println("OK");

    // Set volume to maximum (0 to 30).
    player.volume(30);
    // Play the first MP3 file on the SD card
    player.play(1);
  } else {
    Serial.println("Connecting to DFPlayer Mini failed!");
  }
bool buttonPressed = false;
}

void loop() {
serial.print(POTValue);
if (0 < POTValue < 1){
  lcd.setCursor(0, 0);
  lcd.print("Choose a mecha component: ")
  lcd.setCursor(0, 1);
  lcd.print("Head")
  if(digitalRead(button == HIGH) {
    digitalWrite(led0, HIGH);
  }
  else {
    digitalWrite(led0, LOW)
  }
  lcd.clear()
}
else if (1 < POTValue < 2){
  lcd.setCursor(0, 0);
  lcd.print("Choose a mecha component: ")
  lcd.setCursor(0, 1);
  lcd.print("Left Arm")
  if(digitalRead(button == HIGH) {
    digitalWrite(led1, HIGH);
  }
  else {
    digitalWrite(led1, LOW)
  }
  lcd.clear()
}
else if (2 < POTValue < 3){
  lcd.setCursor(0, 0);
  lcd.print("Choose a mecha component: ")
  lcd.setCursor(0, 1);
  lcd.print("Right Arm")
  if(digitalRead(button == HIGH) {
    digitalWrite(led2, HIGH);
  }
  else {
    digitalWrite(led2, LOW)
  }
  lcd.clear()
}
else if (2 < POTValue < 3){
  lcd.setCursor(0, 0);
  lcd.print("Choose a mecha component: ")
  lcd.setCursor(0, 1);
  lcd.print("Left Leg")
  if(digitalRead(button == HIGH) {
    digitalWrite(led3, HIGH);
  }
  else {
    digitalWrite(led3, LOW)
  }
  lcd.clear()
}
else if (3 < POTValue < 4){
  lcd.setCursor(0, 0);
  lcd.print("Choose a mecha component: ")
  lcd.setCursor(0, 1);
  lcd.print("Right Leg")
  if(digitalRead(button == HIGH) {
    digitalWrite(led4, HIGH);
  }
  else {
    digitalWrite(led4, LOW)
  }
  lcd.clear()
}
}
