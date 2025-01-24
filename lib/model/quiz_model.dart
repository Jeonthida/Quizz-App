class QuizModel {
  String question;
  List<String> answers;

  QuizModel(this.question, this.answers);

  Object? get correctAnswer => null;

  List<String> getShuffledAnswers(){

    final shuffledAnswers = List.of(answers);

    shuffledAnswers.shuffle();

    return shuffledAnswers;
  }
}