/// שאלה אחת בחידון: טקסט, 4 תשובות, ואינדקס התשובה הנכונה.
class Question {
  const Question(this.text, this.answers, this.correctIndex);

  final String text;
  final List<String> answers;
  final int correctIndex;
}

/// הנושא שבחרתי: בינה מלאכותית.
const List<Question> questions = [
  Question(
    'מה פירוש הקיצור AI?',
    ['Automatic Internet', 'Artificial Intelligence', 'Advanced Input', 'App Interface'],
    1,
  ),
  Question(
    'איך נקרא מודל שלומד מדוגמאות מתויגות?',
    ['למידה מונחית', 'למידה לא מונחית', 'למידת חיזוק', 'קומפילציה'],
    0,
  ),
  Question(
    'מה פירוש הקיצור LLM?',
    ['Large Language Model', 'Low Level Memory', 'Linear Logic Machine', 'Local Link Manager'],
    0,
  ),
  Question(
    'איזו חברה פיתחה את Claude?',
    ['Google', 'Meta', 'Anthropic', 'Microsoft'],
    2,
  ),
  Question(
    'באיזו שפה כותבים אפליקציות Flutter?',
    ['Java', 'Dart', 'Swift', 'Python'],
    1,
  ),
];
