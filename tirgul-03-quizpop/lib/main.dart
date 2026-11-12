import 'package:flutter/material.dart';

import 'quiz/quiz_app.dart';
import 'screens/grades_screen.dart';
import 'screens/like_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // שינוי 1: כותרת האפליקציה
      title: 'האפליקציה של מאיה',
      debugShowCheckedModeBanner: false,
      // שינוי 2: צבע הנושא
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // כל האפליקציה מימין לשמאל
      builder: (context, child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
      home: const HomeScreen(),
    );
  }
}

/// תחנה 1: המסך הראשי, עם המונה המקורי ששונה, וקישורים לכל התחנות.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  // שינוי 5: הקפיצה גדלה ב-2 במקום ב-1
  void _incrementCounter() {
    setState(() => _counter += 2);
  }

  void _open(Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.inversePrimary,
        // שינוי 3: הכותרת בסרגל העליון
        title: const Text('תרגול 3 · מאיה'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // שינוי 4: הטקסט מעל המונה
          const Text('לחצת על הכפתור כל כך הרבה (בקפיצות של 2):',
              textAlign: TextAlign.center),
          Text('$_counter',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 24),
          _StationTile(
            number: 3,
            title: 'מסך פרופיל',
            icon: Icons.person,
            onTap: () => _open(const ProfileScreen()),
          ),
          _StationTile(
            number: 4,
            title: 'כפתור לייק',
            icon: Icons.favorite,
            onTap: () => _open(const LikeScreen()),
          ),
          _StationTile(
            number: 5,
            title: 'QuizPop · חידון',
            icon: Icons.quiz,
            onTap: () => _open(const QuizApp()),
          ),
          _StationTile(
            number: 0,
            title: 'רשימת ציונים',
            icon: Icons.grade,
            onTap: () => _open(const GradesScreen()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'הוספה',
        // שינוי 4: אייקון חדש לכפתור
        child: const Icon(Icons.rocket_launch),
      ),
    );
  }
}

class _StationTile extends StatelessWidget {
  const _StationTile({
    required this.number,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final int number;
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: number > 0 ? Text('תחנה $number') : const Text('תרגיל נוסף'),
        trailing: const Icon(Icons.chevron_left),
        onTap: onTap,
      ),
    );
  }
}
