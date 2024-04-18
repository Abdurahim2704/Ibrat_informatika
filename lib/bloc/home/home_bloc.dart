import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ibrat_informatika/data/services/local_data.dart';
import 'package:meta/meta.dart';

import '../../data/models/course.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial(courses: [])) {
    on<FetchData>(_fetchData);
  }

  void _fetchData(FetchData event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState(courses: state.courses));
    final data = await LocalDataService.getCourse();
    emit(HomeFetchSuccess(courses: [data]));
  }
}
