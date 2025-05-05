import 'package:flutter/material.dart';
import 'package:myapp/services/auth/auth.dart';
import 'package:myapp/ui/home_screen.dart';

class LoginScreen extends StatefulWidget {
  final String title;
  const LoginScreen({super.key, required this.title});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  bool _isLogIn = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset('assets/images/logo.png', height: 200.0),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _passwordController,
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(labelText: 'Contraseña'),
                    obscureText: true,
                  ),
                  SizedBox(height: 15),
                  if (!_isLogIn)
                    TextFormField(
                      controller: _rePasswordController,
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: InputDecoration(
                        labelText: 'Confirma la contraseña',
                      ),
                      obscureText: true,
                    ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton(
                onPressed:
                    _isLoading
                        ? null
                        : () {
                          if (_isLogIn) {
                            _handleLogIn();
                          } else {
                            _handleSignUp();
                          }
                        },
                child:
                    _isLoading
                        ? const CircularProgressIndicator(
                          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                        )
                        : Text(
                          _isLogIn ? 'Iniciar Sesión' : 'Registrarse',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isLogIn = !_isLogIn;
                });
              },
              child: Text(
                _isLogIn
                    ? '¿Aún no tienes una cuenta?'
                    : '¿Ya tienes una cuenta?',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await logIn();
      if (mounted) {
        Navigator.pushReplacement(
          // Usar pushReplacement para evitar volver a la pantalla de login
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(title: 'FitBeats'),
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error.toString())));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _handleSignUp() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await signUp();
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(title: 'FitBeats'),
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error.toString())));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> logIn() async {
    try {
      await Auth().signInWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signUp() async {
    String password = _passwordController.text;
    String rePassword = _rePasswordController.text;

    if (password != rePassword) {
      throw 'Las contraseñas no coinciden';
    }
    try {
      await Auth().signUpWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );
    } catch (error) {
      rethrow;
    }
  }
}
