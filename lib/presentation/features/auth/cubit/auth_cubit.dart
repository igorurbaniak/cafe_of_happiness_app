import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/repositories/auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(const AuthState());

  final AuthRepository authRepository;

  Future<void> signUp({required String email, required String password}) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    try {
      final user = await authRepository.signUp(email, password);
      emit(
        state.copyWith(
          user: user,
          isAuthenticated: true,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          isAuthenticated: false,
          errorMessage: error.toString(),
          status: Status.error,
        ),
      );
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    try {
      final user = await authRepository.signIn(email, password);
      emit(
        state.copyWith(
          user: user,
          isAuthenticated: true,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          isAuthenticated: false,
          errorMessage: error.toString(),
          status: Status.error,
        ),
      );
    }
  }

  Future<void> signOut() async {
    emit(state.copyWith(
      status: Status.loading,
    ));
    try {
      await authRepository.signOut();
      emit(
        state.copyWith(
          user: null,
          isAuthenticated: false,
          status: Status.initial,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          isAuthenticated: false,
          errorMessage: error.toString(),
          status: Status.error,
        ),
      );
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(state.copyWith(
      status: Status.loading,
    ));
    try {
      await authRepository.resetPassword(email: email);
      emit(
        state.copyWith(
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          errorMessage: error.toString(),
          status: Status.error,
        ),
      );
    }
  }
}
