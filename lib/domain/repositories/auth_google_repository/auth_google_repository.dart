import 'package:google_sign_in/google_sign_in.dart';

class AuthGoogleRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      return account;
    } catch (error) {
      throw Exception('Failed to sign in with Google: $error');
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (error) {
      throw Exception('Failed to sign out: $error');
    }
  }
}
