import 'package:flutter/material.dart';
import 'package:quizz_app/models/quiz_question.dart';
import 'package:quizz_app/quiz_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.userAnswers, this.startAgainHandler, {super.key});

  final Map<QuizQuestion, bool> userAnswers;
  final void Function() startAgainHandler;

  @override
  Widget build(BuildContext context) {
    final totalQuestionCount = userAnswers.length;
    final correctQuestionCount =
        userAnswers.values.where((isCorrect) => isCorrect).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correctQuestionCount out of $totalQuestionCount questions correctly!",
              style: const TextStyle(color: Color.fromARGB(255, 217, 153, 239)),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 300,
                child: SingleChildScrollView(child: QuizSummary(userAnswers))),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text("Start Again"),
              onPressed: startAgainHandler,
            ),
          ],
        ),
      ),
    );
  }
}
