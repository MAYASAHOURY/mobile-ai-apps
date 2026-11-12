import 'package:flutter/material.dart';

import 'questions.dart';

/// תחנה 5: QuizPop. שלושה מצבים: פתיחה ← שאלות ← תוצאה.
class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

enum _Stage { start, question, result }

class _QuizAppState extends State<QuizApp> {
  _Stage _stage = _Stage.start;
  int _index = 0; // השאלה הנוכחית
  int _score = 0; // מספר התשובות הנכונות
  int? _picked; // התשובה שנבחרה בשאלה הנוכחית

  void _start() {
    setState(() {
      _stage = _Stage.question;
      _index = 0;
      _score = 0;
      _picked = null;
    });
  }

  void _answer(int i) {
    if (_picked != null) return; // אפשר לענות פעם אחת
    setState(() {
      _picked = i;
      if (i == questions[_index].correctIndex) _score++;
    });
    Future.delayed(const Duration(milliseconds: 700), _next);
  }

  void _next() {
    if (!mounted) return;
    setState(() {
      _picked = null;
      if (_index < questions.length - 1) {
        _index++;
      } else {
        _stage = _Stage.result;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QuizPop')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: switch (_stage) {
          _Stage.start => _buildStart(),
          _Stage.question => _buildQuestion(),
          _Stage.result => _buildResult(),
        },
      ),
    );
  }

  Widget _buildStart() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🧠', style: TextStyle(fontSize: 72)),
          const SizedBox(height: 12),
          Text('חידון בינה מלאכותית',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text('${questions.length} שאלות · כמה תצליחו?'),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _start,
            icon: const Icon(Icons.play_arrow),
            label: const Text('מתחילים!'),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion() {
    final q = questions[_index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text('שאלה ${_index + 1} מתוך ${questions.length}'),
            const Spacer(),
            Chip(label: Text('⭐ $_score')),
          ],
        ),
        LinearProgressIndicator(value: (_index + 1) / questions.length),
        const SizedBox(height: 32),
        Text(q.text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 24),
        for (var i = 0; i < q.answers.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: FilledButton.tonal(
              style: FilledButton.styleFrom(
                backgroundColor: _colorFor(i, q.correctIndex),
              ),
              onPressed: () => _answer(i),
              child: Text(q.answers[i]),
            ),
          ),
      ],
    );
  }

  Color? _colorFor(int i, int correct) {
    if (_picked == null) return null;
    if (i == correct) return Colors.green.shade200;
    if (i == _picked) return Colors.red.shade200;
    return null;
  }

  Widget _buildResult() {
    final total = questions.length;
    final message = _score == total
        ? 'מושלם! 🏆'
        : _score >= total / 2
            ? 'כל הכבוד! 👏'
            : 'נסו שוב 💪';
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Text('$_score / $total',
              style: const TextStyle(
                  fontSize: 48, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _start,
            icon: const Icon(Icons.replay),
            label: const Text('שחקו שוב'),
          ),
        ],
      ),
    );
  }
}
