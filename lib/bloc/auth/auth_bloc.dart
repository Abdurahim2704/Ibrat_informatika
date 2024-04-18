import 'package:bloc/bloc.dart';
import 'package:ibrat_informatika/data/services/auth_service.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterUser>(_registerUser);
  }

  void _registerUser(RegisterUser event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final result = await AuthServiceImpl.signUp(
        event.email, event.password, event.username);

    emit(AuthSuccessState());
  }
}
