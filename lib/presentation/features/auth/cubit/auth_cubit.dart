import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/repositories/auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(const AuthState());

  final AuthRepository authRepository;

  Future<void> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    emit(
      const AuthState(
        status: Status.loading,
      ),
    );
    try {
      final user = await authRepository.signUp(email, password);
      await user?.updateDisplayName(displayName);
      await user?.reload();
      final updatedUser = authRepository.currentUser;
      emit(
        AuthState(
          user: updatedUser,
          isAuthenticated: true,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        AuthState(
          isAuthenticated: false,
          errorMessage: error.toString(),
          status: Status.error,
        ),
      );
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(
      const AuthState(
        status: Status.loading,
      ),
    );
    try {
      final user = await authRepository.signIn(email, password);
      emit(
        AuthState(
          user: user,
          isAuthenticated: true,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        AuthState(
          isAuthenticated: false,
          errorMessage: error.toString(),
          status: Status.error,
        ),
      );
    }
  }

  Future<void> signOut() async {
    emit(
      const AuthState(
        status: Status.loading,
      ),
    );
    try {
      await authRepository.signOut();
      emit(
        const AuthState(
          user: null,
          isAuthenticated: false,
          status: Status.initial,
        ),
      );
    } catch (error) {
      emit(
        AuthState(
          isAuthenticated: false,
          errorMessage: error.toString(),
          status: Status.error,
        ),
      );
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(
      const AuthState(
        status: Status.loading,
      ),
    );
    try {
      await authRepository.resetPassword(email: email);
      emit(
        const AuthState(
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        AuthState(
          errorMessage: error.toString(),
          status: Status.error,
        ),
      );
    }
  }
}
