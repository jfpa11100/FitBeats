import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/ui/profile_screen.dart';
import '../../providers/playlist_provider.dart';
import 'widgets/favorite_icon.dart';
import 'widgets/song_title.dart';
import 'auth/home/home_screen.dart';
import 'favorite_list_screen.dart';

class PlaylistScreen extends ConsumerWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistController = ref.watch(playlistProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Text(
            "Power Boost para Correr Bajo la Lluvia",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 16),
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/runner.png',
                    height: 310,
                    width: 380,
                    fit: BoxFit.cover,
                  ),
                ),
                FavoriteIcon(
                  isFavorite: playlistController.isFavorite,
                  onPressed: () {
                    ref.read(playlistProvider).toggleFavorite();
                    final isFav = ref.read(playlistProvider).isFavorite;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: const Color(0xFF9B5DE5),
                        content: Text(
                          isFav ? 'Añadido a favoritos' : 'Eliminado de favoritos',
                          style: TextStyle(
                            color: isFav ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'calSans',
                          ),
                        ),
                        duration: const Duration(seconds: 1),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: playlistController.songs.length,
              itemBuilder: (context, index) {
                final song = playlistController.songs[index];
                return SongTitle(song: song);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen(title: 'FitBeats')));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const FavoriteListScreen()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
        ],
      ),
    );
  }
}