part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class RegisterUser extends AuthEvent {
  final String username;
  final String email;
  final String password;

  const RegisterUser({
    required this.email,
    required this.password,
    required this.username,
  });
}
