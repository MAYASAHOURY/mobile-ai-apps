// D2 · כתבו פונקציה לפי הגדרה (להמשך)
String grade(int score) {
  if (score >= 90) return 'מצוין';
  if (score >= 70) return 'טוב';
  if (score >= 55) return 'עובר';
  return 'נכשל';
}

bool isPassing(int score) => score >= 55;

void main() {
  print(grade(95));
  print(grade(70));
  print(grade(54));
  print(isPassing(55));
}

/* הפלט:
מצוין
טוב
נכשל
true
*/
