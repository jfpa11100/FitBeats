import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/controllers/states/reproductor_state.dart';
import '../controllers/reproductor_controller.dart';

final reproductorProvider = StateNotifierProvider<ReproductorController, ReproductorState>(
  (ref) => ReproductorController(),
);
