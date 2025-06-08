import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/controllers/profile_controller.dart';
import 'package:myapp/models/user_model.dart';

final profileProvider = StateNotifierProvider<ProfileController, UserModel?>((ref) {
  return ProfileController();
});