part of 'auth_google_cubit.dart';

class AuthGoogleState {
  AuthGoogleState({
    this.user,
    this.errorMessage = '',
    this.status = Status.initial,
  });

  final User? user;
  final String errorMessage;
  final Status status;
}