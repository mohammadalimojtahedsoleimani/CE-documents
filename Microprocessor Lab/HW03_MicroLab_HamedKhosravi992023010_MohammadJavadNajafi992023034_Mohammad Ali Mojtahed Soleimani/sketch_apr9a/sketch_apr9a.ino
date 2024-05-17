// Hamed Khosravi 992023010 | Mohammad Javad Najafi 992023034 | Mohammad Ali Mojtahed Soleimani 992023039


#include <LiquidCrystal.h>

const int rs = 12, en = 11, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

char studentID[] = "992023010 | 992023034 | ";  // Student ID
char birthday[] = "08-09-2002 | 10-03-2002 | ";   // Date of birth

void setup() {
  lcd.begin(16, 2);
}

void loop() {
  // Display student ID and birthday concurrently
  for (int i = 0; i < strlen(studentID) + strlen(birthday) + 16; i++) {
    lcd.clear();
    lcd.setCursor(0, 0);
    for (int j = 0; j < 16; j++) {
      lcd.print(studentID[(i + j) % strlen(studentID)]);
    }
    lcd.setCursor(0, 1);
    for (int j = 0; j < 16; j++) {
      lcd.print(birthday[(i + j) % strlen(birthday)]);
    }
    delay(300);  // Speed of rotation and scrolling
  }
}