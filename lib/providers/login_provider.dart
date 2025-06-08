import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/states/login_state.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final authControllerProvider = StateNotifierProvider<AuthController, LoginState>((ref) {
  final authService = ref.read(authServiceProvider);
  return AuthController(authService); 
});
