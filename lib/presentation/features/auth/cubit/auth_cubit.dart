import 'package:cafe_of_happiness_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(const AuthState());

  final AuthRepository authRepository;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await authRepository.signUp(email, password);
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

  Future<void> signIn({required String email, required String password}) async {
    try {
      await authRepository.signIn(email, password);
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
      await authRepository.signOut();
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
      await authRepository.resetPassword(email: email);
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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showCloseIcon = true;
  bool isObscure = true;
  bool showObscureIcon = false;

  void updateEmail(String email) {
    emailController.text = email;
    emailController.addListener(onEmailChanged);
    emit(
      AuthState(
        showCloseIcon: email.isNotEmpty,
        email: email,
      ),
    );
  }

  void updatePassword(String password) {
    passwordController.addListener(onPasswordChanged);
    emit(
      AuthState(
        password: password,
      ),
    );
  }

  void onEmailChanged() {
    emit(
      AuthState(
        email: emailController.text,
      ),
    );
  }

  void onPasswordChanged() {
    showObscureIcon = passwordController.text.isNotEmpty;
    emit(
      AuthState(
        password: passwordController.text,
      ),
    );
  }

  @override
  Future<void> close() async {
    emailController.dispose();
    passwordController.dispose();
    super.close();
  }
}
