const int start_button = 7; // Pin for the start button
const int stop_button = 6; // Pin for the stop button
const int resistor0 = A0; // Pin for the first photoresistor (analog)
const int resistor1 = A1; // Pin for the second photoresistor
const int resistor2 = A2; // Pin for the third photoresistor
const int resistor3 = A3; // Pin for the fourth photoresistor
const int resistor4 = A4; // Pin for the fifth photoresistor
const int resistor5 = A5; // Pin for the sixth photoresistor
int lightlevel0; // Integer value of the light level for the first photoresistor
int lightlevel1; // Integer value of the light level for the second photoresistor
int lightlevel2; // Integer value of the light level for the third photoresistor
int lightlevel3; // Integer value of the light level for the fourth photoresistor
int lightlevel4; // Integer value of the light level for the fifth photoresistor
int lightlevel5; // Integer value of the light level for the sixth photoresistor
int start_button_state; // The value of whether or not the start button is pressed
int stop_button_state; // The value of whether or not the stop button is pressed
int count = 0; // The current question

const int numReadings = 10;  // Number of previous values to use
int lightlevel0Readings[numReadings]; // Array to store previous values
int lightlevel0Index = 0;  // Index of the next reading to be added to the array
int lightlevel0Total = 0;  // Running total of previous values

int lightlevel1Readings[numReadings]; // Same as above for the second photoresistor
int lightlevel1Index = 0;  
int lightlevel1Total = 0; 

int lightlevel2Readings[numReadings]; // Same as above for the third photoresistor
int lightlevel2Index = 0;  
int lightlevel2Total = 0;  

int lightlevel3Readings[numReadings]; // Same as above for the fourth photoresistor
int lightlevel3Index = 0;  
int lightlevel3Total = 0; 

int lightlevel4Readings[numReadings]; // Same as above for the fifth photoresistor
int lightlevel4Index = 0;  
int lightlevel4Total = 0; 

int lightlevel5Readings[numReadings]; // Same as above for the sixth photoresistor
int lightlevel5Index = 0; 
int lightlevel5Total = 0;

void setup() {
  pinMode(resistor0, INPUT); // Sets the first photoresistor as an input value
  pinMode(resistor1, INPUT); // Sets the second photoresistor as an input value
  pinMode(resistor2, INPUT); // Sets the third photoresistor as an input value
  pinMode(resistor3, INPUT); // Sets the fourth photoresistor as an input value
  pinMode(resistor4, INPUT); // Sets the firth photoresistor as an input value
  pinMode(resistor5, INPUT); // Sets the sixth photoresistor as an input value
  pinMode(start_button, INPUT_PULLUP); // Sets start button as an input pullup value
  pinMode(stop_button, INPUT_PULLUP); // Sets stop button as an input pullup value
  Serial.begin(9600); // Begins the serial monitor
}

void loop() {
  start_button_state = digitalRead(start_button); // Sets the start button state as the digital read of the start button
  stop_button_state = digitalRead(stop_button); // Sets the stop button state as the digital read of the stop button
  lightlevel0 = analogRead(resistor0); // Sets the light level as the analog read of the first photoresistor
  lightlevel1 = analogRead(resistor1); // Sets the light level as the analog read of the second photoresistor
  lightlevel2 = analogRead(resistor2); // Sets the light level as the analog read of the third photoresistor
  lightlevel3 = analogRead(resistor3); // Sets the light level as the analog read of the fourth photoresistor
  lightlevel4 = analogRead(resistor4); // Sets the light level as the analog read of the fifth photoresistor
  lightlevel5 = analogRead(resistor5); // Sets the light level as the analog read of the sixth photoresistor
  
  lightlevel0Total = lightlevel0Total - lightlevel0Readings[lightlevel0Index] + lightlevel0; // Adds the current reading to the array and update the running total
  lightlevel0Readings[lightlevel0Index] = lightlevel0;
  lightlevel0Index = (lightlevel0Index + 1) % numReadings;
  int lightlevel0_avg = lightlevel0Total / numReadings; // Calculates the average of the previous readings
  int lightlevel0_diff = lightlevel0 - lightlevel0_avg; // Calculates the derivative based on the average of the previous readings
  float lightlevel0_derivative = (float)lightlevel0_diff / 1000;
 
  lightlevel1Total = lightlevel1Total - lightlevel1Readings[lightlevel1Index] + lightlevel1; // Same as above for the second photoresistor
  lightlevel1Readings[lightlevel1Index] = lightlevel1;
  lightlevel1Index = (lightlevel1Index + 1) % numReadings;
  int lightlevel1_avg = lightlevel1Total / numReadings; 
  int lightlevel1_diff = lightlevel1 - lightlevel1_avg; 
  float lightlevel1_derivative = (float)lightlevel1_diff / 1000;
  
  lightlevel2Total = lightlevel2Total - lightlevel2Readings[lightlevel4Index] + lightlevel2; // Same as above for the third photoresistor
  lightlevel2Readings[lightlevel2Index] = lightlevel2;
  lightlevel2Index = (lightlevel2Index + 1) % numReadings;
  int lightlevel2_avg = lightlevel2Total / numReadings;
  int lightlevel2_diff = lightlevel2 - lightlevel2_avg; 
  float lightlevel2_derivative = (float)lightlevel2_diff / 1000;
  
  lightlevel3Total = lightlevel3Total - lightlevel3Readings[lightlevel3Index] + lightlevel3; // Same as above for the fourth photoresistor
  lightlevel3Readings[lightlevel3Index] = lightlevel3;
  lightlevel3Index = (lightlevel3Index + 1) % numReadings;
  int lightlevel3_avg = lightlevel3Total / numReadings; 
  int lightlevel3_diff = lightlevel3 - lightlevel3_avg;
  float lightlevel3_derivative = (float)lightlevel3_diff / 1000;
  
  lightlevel4Total = lightlevel4Total - lightlevel4Readings[lightlevel4Index] + lightlevel4; // Same as above for the fifth photoresistor
  lightlevel4Readings[lightlevel4Index] = lightlevel4;
  lightlevel4Index = (lightlevel4Index + 1) % numReadings;
  int lightlevel4_avg = lightlevel4Total / numReadings; 
  int lightlevel4_diff = lightlevel4 - lightlevel4_avg; 
  float lightlevel4_derivative = (float)lightlevel4_diff / 1000;
  
  lightlevel5Total = lightlevel5Total - lightlevel5Readings[lightlevel5Index] + lightlevel5; // Same as above for the sixth photoresistor
  lightlevel5Readings[lightlevel5Index] = lightlevel5;
  lightlevel5Index = (lightlevel5Index + 1) % numReadings;
  int lightlevel5_avg = lightlevel5Total / numReadings; 
  int lightlevel5_diff = lightlevel5 - lightlevel5_avg;
  float lightlevel5_derivative = (float)lightlevel5_diff / 1000;
  
  if (start_button_state == 0 ) { // When the start button is pressed
    count++;   // Increase the count by 1 (This tells Processing which Question number we're on)
    Serial.print("Start"); // Prints "Start" to the serial monitor
    Serial.println(count); // Prints the current question number to the serial monitor
    delay(1000);
  }
  
  if (stop_button_state == 0) { // When the stop button is pressed
    Serial.print("Stop"); // Prints "Stop" to the serial monitor
    delay(1000);
  }
  
  if (lightlevel0_derivative < -.01) { // When the derivative of the first light level is under -.01
    Serial.print("Head"); // Prints "Head" to the serial monitor
    Serial.println(count); // Prints the current question number to the serial monitor
    }
  
  if (lightlevel1_derivative < -.01) { // When the derivative of the second light level is under -.01
    Serial.print("Body"); // Prints "Body" to the serial monitor
    Serial.println(count); // Prints the current question number to the serial monitor
    }
  
  if (lightlevel2_derivative < -.01) { // When the derivative of the third light level is under -.01
    Serial.print("Right Arm"); // Prints "Right Arm" to the serial monitor
    Serial.println(count); // Prints the current question number to the serial monitor
    }
  if (lightlevel3_derivative < -.01) { // When the derivative of the fourth light level is under -.01
    Serial.print("Right Leg"); // Prints "Right Leg" to the serial monitor
    Serial.println(count); // Prints the current question number to the serial monitor
    }
  
  if (lightlevel4_derivative < -.001) { // When the derivative of the fifth light level is under -.001
    Serial.print("Left Arm"); // Prints "Left Arm" to the serial monitor
    Serial.println(count); // Prints the current question number to the serial monitor
    }
  
  if (lightlevel5_derivative < -.001) { // When the derivative of the sixth light level is under -.001
    Serial.print("Left Leg"); // Prints "Left Leg" to the serial monitor
    Serial.println(count); // Prints the current question number to the serial monitor
    }
}
