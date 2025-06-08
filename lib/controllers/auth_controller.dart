import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/services/auth/auth_service.dart';
import 'package:myapp/states/login_state.dart';

class AuthController extends StateNotifier<LoginState> {
  final AuthService authService;

  AuthController(this.authService) : super(const LoginStateInitial());

  Future<void> login(String email, String password) async {
    state = const LoginStateLoading();
    try {
      await authService.signIn(email, password);
      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateError('Correo o contraseña incorrectos');
    }
  }

  Future<void> signUp(String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      state = const LoginStateError('Las contraseñas no coinciden');
      return;
    }

    state = const LoginStateLoading();
    try {
      await authService.signUp(email, password);
      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateError('Error al registrarse: ${e.toString()}');
    }
  }

  void reset() {
    state = const LoginStateInitial();
  }
}
