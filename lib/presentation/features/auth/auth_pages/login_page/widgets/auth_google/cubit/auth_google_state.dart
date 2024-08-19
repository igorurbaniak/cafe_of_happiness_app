part of 'auth_google_cubit.dart';

class AuthGoogleState {
  AuthGoogleState({
    this.status = Status.initial,
    this.googleIsLoading = false,
    this.googleErrorMessage = '',
    this.user
  });

  final Status status;
  final bool googleIsLoading;
  final String googleErrorMessage;
  final User? user;
}