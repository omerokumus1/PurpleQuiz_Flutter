import 'package:flutter/material.dart';

class QuestionNumber extends StatelessWidget {
  const QuestionNumber(this.questionNumber, this.isCorrect, {super.key});
  final int questionNumber;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: isCorrect
            ? const Color.fromARGB(255, 220, 89, 247)
            : const Color.fromARGB(255, 40, 143, 234),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
