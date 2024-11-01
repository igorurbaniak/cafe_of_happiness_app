import 'dart:async';
import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/repositories/auth_google_repository/auth_google_sign_in_repository.dart';
import 'package:cafe_of_happiness_app/domain/repositories/auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'root_state.dart';

@injectable  
class RootCubit extends Cubit<RootState> {
  RootCubit({
    required this.authRepository,
    required this.authGoogleSignInRepository,
  }) : super(
          const RootState(
            user: null,
            isLoading: false,
            errorMessage: '',
            status: Status.initial,
          ),
        );

  final AuthRepository authRepository;
  final AuthGoogleSignInRepository authGoogleSignInRepository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const RootState(
        user: null,
        isLoading: true,
        errorMessage: '',
        status: Status.loading,
      ),
    );

    _streamSubscription = authRepository.authStateChanges().listen(
      (user) {
        emit(
          RootState(
            user: user,
            isLoading: false,
            errorMessage: '',
            status: Status.success,
          ),
        );
      },
    )..onError((error) {
        emit(
          RootState(
            user: null,
            isLoading: false,
            errorMessage: error.toString(),
            status: Status.error,
          ),
        );
      });
  }

  Future<void> signOut() async {
    try {
      await authGoogleSignInRepository.signOut();
      await authRepository.signOut();
      emit(
          const RootState(
            user: null,
            isLoading: false,
            errorMessage: '',
            status: Status.initial,
          ),
        );
    } catch (error) {
      emit(
          RootState(
            user: null,
            isLoading: false,
            errorMessage: error.toString(),
            status: Status.error,
          ),
        );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}