part of 'auth_cubit.dart';

@immutable
class AuthState {
  const AuthState({
    this.errorMessage = '',
    this.saved = false,
    this.email = '',
    this.password = '',
  });

  final String errorMessage;
  final bool saved;
  final String email;
  final String password;
}
