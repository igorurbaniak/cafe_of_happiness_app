part of 'auth_cubit.dart';

class AuthState {
  const AuthState({
    this.user,
    this.errorMessage = '',
    this.isAuthenticated = false,
    this.status = Status.initial,
  });

  final User? user;
  final String errorMessage;
  final bool isAuthenticated;
  final Status status;
}