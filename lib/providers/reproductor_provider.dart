import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/reproductor_controller.dart';

final reproductorProvider = ChangeNotifierProvider((ref) => ReproductorController());