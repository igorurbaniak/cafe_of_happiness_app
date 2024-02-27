part of 'root_cubit.dart';

@immutable
class RootState {
  const RootState({
    required this.user,
    this.errorMessage = '',
    this.status = Status.initial,
  });

  final User? user;
  final String errorMessage;
  final Status status;
}
