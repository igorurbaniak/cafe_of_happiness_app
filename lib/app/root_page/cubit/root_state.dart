part of 'root_cubit.dart';

class RootState {
  const RootState({
     this.user,
     this.isLoading = false,
     this.errorMessage = '',
     this.isLogged = false,
     this.status = Status.initial,
  });

  final User? user;
  final bool isLoading;
  final String errorMessage;
  final bool isLogged;
  final Status status;

  RootState copyWith({
    User? user,
    bool? isLoading,
    String? errorMessage,
    bool? isLogged,
    Status? status,
  }) {
    return RootState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isLogged: isLogged ?? this.isLogged,
      status: status ?? this.status,
    );
  }
}