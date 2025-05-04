import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      throw 'Credenciales inválidas';
    }
  }

  signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        throw 'Contraseña debil';
      }else if(e.code == 'email-already-in-use'){
        throw 'Correo en uso';
      }
      throw 'Error al crear cuenta';
    }
  }

  signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException {
      throw Exception('Error al cerrar sesión');
    }
  }
}
