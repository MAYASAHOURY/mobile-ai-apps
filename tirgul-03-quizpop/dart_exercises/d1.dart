// D1 · נחשו את הפלט, ואז הריצו (ב-DartPad)
void main() {
  var name = 'דנה';
  int age = 21;
  var courses = ['Java', 'Dart', 'Python'];
  print('שלום $name');
  print('בעוד שנה: ${age + 1}');
  print('יש ${courses.length} קורסים, הראשון: ${courses[0]}');
  courses.add('Flutter');
  print(courses.last);
  String? nickname;
  print(nickname ?? 'אין כינוי');
}

/* הפלט:
שלום דנה
בעוד שנה: 22
יש 3 קורסים, הראשון: Java
Flutter
אין כינוי

הסברים:
- $name / ${age + 1}  → כרטיס 2: טקסט עם ערכים בתוכו ($ ו-${} לחישוב)
- courses.length / courses[0] / add / last → כרטיס רשימות (List)
- String? ו-??  → כרטיס 6: null, כש-nickname הוא null מודפס הערך החלופי
*/
