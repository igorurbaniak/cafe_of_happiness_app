import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/repositories/auth_google_repository/auth_google_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_google_state.dart';

class AuthGoogleCubit extends Cubit<AuthGoogleState> {
  AuthGoogleCubit(this.authGoogleRepository) : super(AuthGoogleState());

  final AuthGoogleRepository authGoogleRepository;

  Future<void> signInWithGoogle() async {
    emit(
      state.copyWith(
        status: Status.loading,
        isLoading: true,
      ),
    );
    try {
      final account = await authGoogleRepository.signInWithGoogle();
      if (account != null) {
        emit(
          state.copyWith(
            status: Status.success,
            isLoading: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: Status.error,
            isLoading: false,
            errorMessage: 'Google sign-in failed. Please try again.',
          ),
        );
      }
    } on Exception catch (error) {
      emit(
        state.copyWith(
          status: Status.error,
          isLoading: false,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}