import 'package:flutter/material.dart';
import 'package:quizz_app/models/quiz_question.dart';
import 'package:quizz_app/question_number.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary(this.summaryData, {super.key});

  final Map<QuizQuestion, bool> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getChildren(),
    );
  }

  List<Widget> getChildren() {
    List<Widget> children = [];
    var questionNumber = 1;
    summaryData.forEach((question, isCorrect) {
      var textColor = isCorrect
          ? const Color.fromARGB(255, 40, 143, 234)
          : const Color.fromARGB(255, 220, 89, 247);
      children.add(
        Row(
          children: [
            QuestionNumber(questionNumber, isCorrect),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    question.text,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 185, 167, 167)),
                  ),
                  Text(
                    isCorrect ? 'Correct' : 'Incorrect',
                    style: TextStyle(
                      color: textColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      children.add(const SizedBox(
        height: 10,
      ));
      questionNumber++;
    });
    return children;
  }
}
