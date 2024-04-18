part of 'test_result_bloc.dart';

@immutable
abstract class TestResultState {
  final List<TestResults> results;
  const TestResultState({required this.results});
}

class TestResultInitial extends TestResultState {
  const TestResultInitial({required super.results});
}

class TestResultLoading extends TestResultState {
  const TestResultLoading({required super.results});
}

class TestResultError extends TestResultState {
  final String message;
  const TestResultError({required this.message, required super.results});
}

class TestResultSaveStateSuccess extends TestResultState {
  const TestResultSaveStateSuccess({required super.results});
}

class TestResultFetchSuccess extends TestResultState {
  const TestResultFetchSuccess({
    required super.results,
  });
}
