import 'package:flutter/material.dart';

/// תרגיל נוסף: רשימת ציונים.
/// הממוצע למעלה, ✓ ירוק למי שעבר, ✗ אדום למי שלא, ו-⊕ שמעלה ציון.
class GradesScreen extends StatefulWidget {
  const GradesScreen({super.key});

  @override
  State<GradesScreen> createState() => _GradesScreenState();
}

class Student {
  Student(this.name, this.grade);

  final String name;
  int grade;
}

class _GradesScreenState extends State<GradesScreen> {
  static const int passGrade = 55; // ציון עובר (כמו isPassing בתרגיל D2)
  static const int step = 5; // בכמה ⊕ מעלה את הציון

  final List<Student> _students = [
    Student('נועה', 92),
    Student('עומר', 48),
    Student('דנה', 71),
    Student('יוסף', 54),
  ];

  double get _average =>
      _students.map((s) => s.grade).reduce((a, b) => a + b) /
      _students.length;

  void _raise(Student s) {
    setState(() => s.grade = (s.grade + step).clamp(0, 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ממוצע: ${_average.toStringAsFixed(1)}')),
      body: ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, i) {
          final s = _students[i];
          final passed = s.grade >= passGrade;
          return ListTile(
            leading: Icon(
              passed ? Icons.check_circle : Icons.cancel,
              color: passed ? Colors.green : Colors.red,
            ),
            title: Text(s.name),
            subtitle: Text('ציון: ${s.grade}'),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'העלאת ציון',
              onPressed: s.grade >= 100 ? null : () => _raise(s),
            ),
          );
        },
      ),
    );
  }
}
