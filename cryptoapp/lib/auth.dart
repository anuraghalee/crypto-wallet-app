import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthState {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final userCurrent = FirebaseAuth.instance.currentUser;

  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException {}
  }

  Future<void> gSignIn() async {
    try {
      final gUser = await GoogleSignIn().signIn();

      if (gUser == null) return;

      final gAuth = await gUser.authentication;

      final gCred = GoogleAuthProvider.credential(idToken: gAuth.idToken, accessToken: gAuth.accessToken);

      await FirebaseAuth.instance.signInWithCredential(gCred);
    } on FirebaseAuthException {}
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
    } on FirebaseAuthException {}
  }
}
