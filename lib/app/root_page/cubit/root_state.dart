part of 'root_cubit.dart';

@immutable
class RootState {
  const RootState({
    required this.user,
    required this.isLoading,
    required this.errorMessage,
    required this.isLogged,
    required this.status,
  });

  final User? user;
  final bool isLoading;
  final String errorMessage;
  final bool isLogged;
  final Status status;
}
