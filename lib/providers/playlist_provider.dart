import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/playlist_controller.dart';

final playlistProvider = ChangeNotifierProvider((ref) => PlaylistController());