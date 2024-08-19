import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/repositories/auth_google_repository/auth_google_sign_in_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_google_state.dart';

class AuthGoogleCubit extends Cubit<AuthGoogleState> {
  AuthGoogleCubit(this._authGoogleSignInRepository) : super(AuthGoogleState());

  final AuthGoogleSignInRepository _authGoogleSignInRepository;

  Future<void> signInWithGoogle() async {
    emit(
      AuthGoogleState(
        status: Status.loading,
        googleIsLoading: true,
        user: null,
        googleErrorMessage: '',
      ),
    );
    try {
      final account = await _authGoogleSignInRepository.signInWithGoogle();
      if (account != null) {
        emit(
          AuthGoogleState(
            status: Status.success,
            googleIsLoading: false,
            user: account,
            googleErrorMessage: '',
          ),
        );
      } else {
        emit(
          AuthGoogleState(
            status: Status.error,
            googleIsLoading: false,
            user: null,
            googleErrorMessage: 'Google sign-in failed. Please try again.',
          ),
        );
      }
    } on Exception catch (error) {
      emit(
        AuthGoogleState(
          status: Status.error,
          googleIsLoading: false,
          user: null,
          googleErrorMessage: error.toString(),
        ),
      );
    }
  }
}