import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuizHandler, {super.key});

  final void Function() startQuizHandler;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn Flutter the Fun way!',
            style: TextStyle(color: Colors.white),
          ),
          OutlinedButton.icon(
            onPressed: startQuizHandler,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
