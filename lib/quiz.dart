import 'package:flutter/material.dart';
import 'package:quizz_app/question_screen.dart';
import 'package:quizz_app/start_screen.dart';

const colors = [
  Color.fromARGB(255, 26, 2, 80),
  Color.fromARGB(255, 26, 25, 28),
];

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(startQuizHandler);
  }

  void startQuizHandler() {
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
