part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final List<Course> courses;
  const HomeState({required this.courses});
}

class HomeInitial extends HomeState {
  const HomeInitial({required super.courses});
}

class HomeFetchSuccess extends HomeState {
  const HomeFetchSuccess({required super.courses});
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState({required super.courses});
}
