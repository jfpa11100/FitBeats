import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/services/auth/auth_service.dart';
import 'package:myapp/states/login_state.dart';
import 'package:myapp/providers/validator.dart';

class AuthController extends StateNotifier<LoginState> {
  final AuthService authService;
  final Ref ref;

  AuthController(this.authService, this.ref) : super(const LoginStateInitial());

  // Validaciones antes de iniciar sesión o registrarse
  bool _isValidEmail(String email) {
    final emailValidator = ref.read(emailValidatorProvider);
    final emailError = emailValidator(email);
    return emailError == null; 
  }

  bool _isValidPassword(String password) {
    final passwordValidator = ref.read(passwordValidatorProvider);
    final passwordError = passwordValidator(password);
    return passwordError == null; 
  }

  Future<void> login(String email, String password) async {
    if (!_isValidEmail(email)) {
      state = const LoginStateError('Correo inválido');
      return;
    }
    if (!_isValidPassword(password)) {
      state = const LoginStateError('Contraseña inválida');
      return;
    }

    state = const LoginStateLoading();
    try {
      await authService.signIn(email, password);
      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateError('Error al iniciar sesión: ${e.toString()}');
    }
  }

  Future<void> signUp(String email, String password, String confirmPassword) async {
    if (!_isValidEmail(email)) {
      state = const LoginStateError('Correo inválido');
      return;
    }
    if (!_isValidPassword(password)) {
      state = const LoginStateError('Contraseña inválida');
      return;
    }
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
