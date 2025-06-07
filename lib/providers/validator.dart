// Proveedor de validación de correo
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailValidatorProvider = Provider<String? Function(String?)>((ref) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu correo';
    }

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value);

    if (!emailValid) {
      return 'Ingresa un correo válido';
    }

    final allowedDomains = ['gmail.com', 'yahoo.com', 'outlook.com'];
    final parts = value.split('@');
    
    if (parts.length != 2) {
      return 'El correo debe tener un solo "@"';
    }

    if (!allowedDomains.contains(parts[1].toLowerCase())) {
      return 'Dominios permitidos: ${allowedDomains.join(', ')}';
    }

    if (!parts[1].contains('.')) {
      return 'El dominio del correo debe contener un punto';
    }

   
    if (parts[1].length < 3) {
      return 'El dominio del correo debe tener al menos 3 caracteres';
    }

    return null; 
  };
});


final passwordValidatorProvider = Provider<String? Function(String?)>((ref) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu contraseña';
    }

    if (value.length < 6) {
      return 'Tu contraseña debe tener al menos 6 caracteres';
    }

    bool hasUpperCase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowerCase = value.contains(RegExp(r'[a-z]'));
    bool hasDigit = value.contains(RegExp(r'[0-9]'));
    bool hasSpecialChar = value.contains(RegExp(r'[@$!%*?&]'));

    if (!hasUpperCase || !hasLowerCase || !hasDigit || !hasSpecialChar) {
      return 'Tu contraseña debe contener mayúsculas, minúsculas, números y carácter especiales';
    }

    return null;
  };
});
