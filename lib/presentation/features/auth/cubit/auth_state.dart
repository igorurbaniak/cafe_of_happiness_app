part of 'auth_cubit.dart';

class AuthState {
  const AuthState({
    this.user,
    this.errorMessage = '',
    this.isAuthenticated = false,
    this.isLoading = false,
    this.email = '',
    this.password = '',
    this.status = Status.initial,
  });

  final User? user;
  final String errorMessage;
  final bool isAuthenticated;
  final bool isLoading;
  final String email;
  final String password;
  final Status status;

  AuthState copyWith({
    User? user,
    String? errorMessage,
    bool? isAuthenticated,
    bool? isLoading,
    String? email,
    String? password,
    Status? status
  }) {
    return AuthState(
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}