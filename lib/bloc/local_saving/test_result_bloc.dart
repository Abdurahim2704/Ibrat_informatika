import 'package:bloc/bloc.dart';
import 'package:ibrat_informatika/data/services/db_service.dart';
import 'package:meta/meta.dart';

import '../../data/models/test_results.dart';

part 'test_result_event.dart';
part 'test_result_state.dart';

class TestResultBloc extends Bloc<TestResultEvent, TestResultState> {
  TestResultBloc() : super(const TestResultInitial(results: [])) {
    on<SaveResultEvent>(_saveTestResult);
    on<InitialEvent>(_onInitial);
    on<FetchResults>(_fetchHistories);
  }

  void _onInitial(InitialEvent event, Emitter<TestResultState> emit) async {
    emit(TestResultLoading(results: state.results));
    await DBService.open();
  }

  void _saveTestResult(
      SaveResultEvent event, Emitter<TestResultState> emit) async {
    emit(TestResultLoading(results: state.results));
    final testResults = TestResults(
      dateTime: DateTime.now(),
      questions: event.questions,
      accuracy: event.accuracy,
      userAnswers: event.userAnswers.map((e) => e ? 1 : 0).toList(),
      answers: event.answers,
      title: event.title,
    );
    await DBService.insert(testResults);

    emit(TestResultSaveStateSuccess(results: state.results));
    add(FetchResults());
  }

  void _fetchHistories(
      FetchResults event, Emitter<TestResultState> emit) async {
    emit(TestResultLoading(results: state.results));
    final result = await DBService.getLatestResults();
    emit(TestResultFetchSuccess(results: result));
  }
}
