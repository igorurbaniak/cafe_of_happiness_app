import 'package:cafe_of_happiness_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(const AuthState());

  final AuthRepository _authRepository;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await _authRepository.signUp(email, password);
      emit(
        const AuthState(saved: true),
      );
    } catch (error) {
      emit(
        AuthState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> signIn({required String emial, required String password}) async {
    try {
      await _authRepository.signIn(emial, password);
      emit(
        const AuthState(
          saved: true,
        ),
      );
    } catch (error) {
      emit(
        AuthState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
      emit(
        const AuthState(saved: true),
      );
    } catch (error) {
      emit(
        AuthState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _authRepository.resetPassword(email: email);
      emit(
        const AuthState(saved: true),
      );
    } catch (error) {
      emit(
        AuthState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
