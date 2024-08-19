import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/repositories/auth_repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(const AuthState());

  final AuthRepository authRepository;

  Future<void> signUp({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = await authRepository.signUp(email, password);
      emit(
        state.copyWith(
          user: user,
          isAuthenticated: true,
          isLoading: false,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          errorMessage: error.toString(),
          isLoading: false,
        ),
      );
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true, status: Status.loading));
    await Future.delayed(const Duration(seconds: 3));
    try {
      final user = await authRepository.signIn(email, password);
      emit(
        state.copyWith(
          user: user,
          isAuthenticated: true,
          isLoading: false,
          status: Status.success
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          errorMessage: error.toString(),
          isLoading: false,
          status: Status.error
        ),
      );
    }
  }

  Future<void> signOut() async {
    emit(state.copyWith(isLoading: true));
    try {
      await authRepository.signOut();
      emit(
        state.copyWith(
          user: null,
          isAuthenticated: false,
          isLoading: false,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          errorMessage: error.toString(),
          isLoading: false,
        ),
      );
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(state.copyWith(isLoading: true));
    try {
      await authRepository.resetPassword(email: email);
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          errorMessage: error.toString(),
          isLoading: false,
        ),
      );
    }
  }
}