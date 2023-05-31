import 'package:flutter/material.dart';
import 'package:quizz_app/models/quiz_question.dart';
import 'package:quizz_app/question_screen.dart';
import 'package:quizz_app/results_screen.dart';
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
  // Widget? activeScreen;
  var activeScreen = 'StartScreen';
  Map<QuizQuestion, bool> userAnswers = {};
  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(startQuizHandler);
  // }

  void startQuizHandler() {
    setState(() {
      activeScreen = 'QuestionScreen';
    });
  }

  void quizFinishHandler(Map<QuizQuestion, bool> userAnswers) {
    setState(() {
      activeScreen = 'ResultsScreen';
      this.userAnswers = userAnswers;
    });
  }

  void startAgainHandler() {
    setState(() {
      activeScreen = 'StartScreen';
      userAnswers = {};
    });
  }

  @override
  Widget build(context) {
    Widget screenToShow = StartScreen(startQuizHandler);
    if (activeScreen == 'QuestionScreen') {
      screenToShow = QuestionScreen(quizFinishHandler);
    } else if (activeScreen == 'ResultsScreen') {
      screenToShow = ResultsScreen(userAnswers, startAgainHandler);
    }

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
          child: screenToShow,
        ),
      ),
    );
  }
}
