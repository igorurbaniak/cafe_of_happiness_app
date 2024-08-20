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

  AuthState copyWith({
    User? user,
    String? errorMessage,
    bool? isAuthenticated,
    Status? status
  }) {
    return AuthState(
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      status: status ?? this.status,
    );
  }
}