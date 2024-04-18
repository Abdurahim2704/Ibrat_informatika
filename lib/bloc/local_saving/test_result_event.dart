part of 'test_result_bloc.dart';

@immutable
abstract class TestResultEvent {}

class InitialEvent extends TestResultEvent {}

class SaveResultEvent extends TestResultEvent {
  final List<String> questions;
  final List<bool> userAnswers;
  final double accuracy;
  final List<String> answers;
  final String title;

  SaveResultEvent({
    required this.questions,
    required this.userAnswers,
    required this.accuracy,
    required this.title,
    required this.answers,
  });
}

class FetchResults extends TestResultEvent {}
