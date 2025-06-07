import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileControllerProvider =
    StateNotifierProvider<ProfileController, ProfileState>(
  (ref) => ProfileController(),
);

class ProfileState {
  final String email;

  ProfileState({required this.email});

  ProfileState copyWith({String? email}) {
    return ProfileState(
      email: email ?? this.email,
    );
  }
}

class ProfileController extends StateNotifier<ProfileState> {
  ProfileController()
      : super(ProfileState(email: 'usuario@fitbeats.com')); // ejemplito

  void logout(BuildContext context) {
    // lógica  logout con firebase
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF9B5DE5),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        content: Row(
          children: [
            const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Sesión cerrada',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'calSans',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
