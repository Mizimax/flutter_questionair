import 'dart:core';

class Questionair {
  String question;
  String answer;
  bool isCorrected;
  bool isQuestion;

  Questionair({this.question, this.answer, this.isCorrected = false, this.isQuestion = true});

  Questionair copyWith({String question, String answer, bool isCorrected, bool isQuestion}) {
    return Questionair(
        question: question ?? this.question,
        answer: answer ?? this.answer,
        isCorrected: isQuestion ?? this.isQuestion,
        isQuestion: isQuestion ?? this.isQuestion
    ); 
  }

  @override
  String toString() {
    return 'questionair { question: $question, answer: $answer, isCorrected: $isCorrected, isQuestion: $isQuestion }';
  }
}