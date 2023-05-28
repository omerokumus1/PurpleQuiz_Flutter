class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> getShuffledAnswers() {
    final shuffledAnswers = answers.toList();
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
