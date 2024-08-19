part of 'root_cubit.dart';

class RootState {
  const RootState({
     this.user,
     this.isLoading = false,
     this.errorMessage = '',
     this.status = Status.initial,
  });

  final User? user;
  final bool isLoading;
  final String errorMessage;
  final Status status;
}