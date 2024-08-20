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
      ),
    );
    try {
      final account = await _authGoogleSignInRepository.signInWithGoogle();
      if (account != null) {
        emit(
          AuthGoogleState(
            user: account,
            status: Status.success,
          ),
        );
      } else {
        emit(
          AuthGoogleState(
            errorMessage: 'Google sign-in failed. Please try again.',
            status: Status.error,
          ),
        );
      }
    } on Exception catch (error) {
      emit(
        AuthGoogleState(
          errorMessage: error.toString(),
          status: Status.error,
        ),
      );
    }
  }
}
