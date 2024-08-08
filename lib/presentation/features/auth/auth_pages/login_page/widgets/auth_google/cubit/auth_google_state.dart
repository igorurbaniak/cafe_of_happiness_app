part of 'auth_google_cubit.dart';

class AuthGoogleState {
  AuthGoogleState({
    this.status = Status.initial,
    this.isLoading = false,
    this.errorMessage = '',
  });

  final Status status;
  final bool isLoading;
  final String errorMessage;

  AuthGoogleState copyWith({
    Status? status,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthGoogleState(
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
