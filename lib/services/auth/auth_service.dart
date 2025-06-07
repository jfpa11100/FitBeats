import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Iniciar sesión
  Future<UserModel> signIn(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user!;
      return UserModel(id: user.uid, email: user.email!, password: password);
    } catch (e) {
      throw Exception('Error al iniciar sesión: ${e.toString()}');
    }
  }

  // Crear cuenta
  Future<UserModel> signUp(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user!;
      return UserModel(id: user.uid, email: user.email!, password: password);
    } catch (e) {
      throw Exception('Error al registrar: ${e.toString()}');
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
  
  // Usuario autenticado
  Future<UserModel?> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      return UserModel(id: user.uid, email: user.email!, password: '');
    }
    return null;
  }
}
