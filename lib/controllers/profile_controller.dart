import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class ProfileController extends StateNotifier<UserModel?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ProfileController() : super(null) {
    loadProfile();
  }

  // Cargando datos usuario actual
  Future<void> loadProfile() async {
    final currentUser = _auth.currentUser;

    if (currentUser != null) {
      state = UserModel(id: currentUser.uid, email: currentUser.email);
    }
  }

  Future<void> logout(BuildContext context) async {
    state = null;
    await _auth.signOut();
  }
}
