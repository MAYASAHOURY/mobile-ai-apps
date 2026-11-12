import 'package:flutter/material.dart';

/// תחנה 4 (T2): כפתור לייק. לחיצה הופכת את הלב לאדום ומעלה את המספר,
/// לחיצה נוספת מחזירה אותו ומורידה את המספר.
class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  bool _liked = false;
  int _likes = 41;

  void _toggle() {
    setState(() {
      _liked = !_liked;
      _likes += _liked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('כפתור לייק')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              iconSize: 72,
              onPressed: _toggle,
              icon: Icon(
                _liked ? Icons.favorite : Icons.favorite_border,
                color: _liked ? Colors.red : Colors.grey,
              ),
            ),
            Text('$_likes',
                style: const TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
