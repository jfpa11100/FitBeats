import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/providers/login_provider.dart';
import 'package:myapp/states/login_state.dart';
import 'package:myapp/ui/auth/home/home_screen.dart';
import 'package:myapp/providers/validator.dart'; 

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Acceso estado del formulario
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(authControllerProvider);

    ref.listen<LoginState>(authControllerProvider, (prev, next) {
      if (next is LoginStateSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen(title: 'FitBeats')),
        );
      } else if (next is LoginStateError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage), 
          backgroundColor: Color(0xFF9B5DE5)),
        );
      }
    });

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey, 
            child: ListView(
              shrinkWrap: true,
              children: [
                Image.asset('assets/images/logo.png', height: 200.0),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: _isLogin ? null : ref.read(emailValidatorProvider),  
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                  validator: _isLogin ? null : ref.read(passwordValidatorProvider),  
                ),
                if (!_isLogin)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      decoration: const InputDecoration(labelText: 'Confirmar contraseña'),
                      obscureText: true,
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'Las contraseñas no coinciden';
                        }
                        return null;
                      },
                    ),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: loginState is LoginStateLoading
                      ? null
                      : _handleSubmit,
                  child: loginState is LoginStateLoading
                      ? const CircularProgressIndicator()
                      : Text(_isLogin ? 'Iniciar Sesión' : 'Registrarse'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                    ref.read(authControllerProvider.notifier).reset();
                  },
                  child: Text(_isLogin
                      ? '¿No tienes cuenta? Regístrate'
                      : '¿Ya tienes cuenta? Inicia sesión'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubmit() {
  // Validación antes de enviar
  if (_formKey.currentState?.validate() ?? false) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    final controller = ref.read(authControllerProvider.notifier);

    if (_isLogin) {
      controller.login(email, password);
    } else {
      controller.signUp(email, password, confirmPassword);
    }
  } else {
    String errors = '';
    
    final emailError = ref.read(emailValidatorProvider)(_emailController.text);
    if (emailError != null) {
      errors += '• $emailError\n';
    }

    final passwordError = ref.read(passwordValidatorProvider)(_passwordController.text);
    if (passwordError != null) {
      errors += '• $passwordError\n';
    }

    if (!_isLogin) {
      final confirmPasswordError = _confirmPasswordController.text != _passwordController.text
          ? '• Las contraseñas no coinciden'
          : null;
      if (confirmPasswordError != null) {
        errors += '$confirmPasswordError\n';
      }
    }

    if (errors.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errors.trim(),
            style: const TextStyle(fontSize: 16),
          ),
          backgroundColor: Color(0xFF9B5DE5),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
  }
}