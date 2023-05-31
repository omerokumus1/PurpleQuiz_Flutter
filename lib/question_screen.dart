import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/answer_button.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/models/quiz_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.quizFinishHandler, {super.key});

  final void Function(Map<QuizQuestion, bool>) quizFinishHandler;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  final Map<QuizQuestion, bool> userAnswers = {};
  int questionIndex = 0;
  void buttonPressedHandler(String pickedAnswer) {
    if (questionIndex < questions.length - 1) {
      final question = questions[questionIndex];
      setState(() {
        questionIndex++;
        userAnswers[question] = question.answers.first == pickedAnswer;
      });
    } else {
      widget.quizFinishHandler(userAnswers);
    }
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion question = questions[questionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 224, 187, 233),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...question.getShuffledAnswers().map((answer) {
              return AnswerButton(answer, () {
                buttonPressedHandler(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
