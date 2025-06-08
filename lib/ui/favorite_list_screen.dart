import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/models/playlist.dart';
import 'package:myapp/providers/favorite_playlist_provider.dart';
import 'package:myapp/ui/auth/home/home_screen.dart';
import 'package:myapp/ui/profile_screen.dart';
import 'package:myapp/ui/widgets/favorite_icon.dart';

class FavoriteListScreen extends ConsumerWidget {
  const FavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritePlaylists = ref.watch(favoritePlaylistProvider);
    final controller = ref.read(favoritePlaylistProvider.notifier);
    const Color purple = Color(0xFF9B5DE5);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Favoritos',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: favoritePlaylists.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final Playlist playlist = favoritePlaylists[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/runner.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        playlist.title,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Añadido el ${playlist.addedAt}',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: Colors.white70),
                          ),
                          FavoriteIcon(
                            isFavorite: playlist.isFavorite,
                            onPressed: () {
                              controller.toggleFavoritePlaylist(playlist);
                              final message =
                                  playlist.isFavorite
                                      ? 'Añadido a favoritos'
                                      : 'Eliminado de favoritos';
                              final snackBar = SnackBar(
                                backgroundColor: purple,
                                behavior: SnackBarBehavior.floating,
                                duration: const Duration(seconds: 1),
                                content: Text(
                                  message,
                                  style: TextStyle(
                                    color:
                                        playlist.isFavorite
                                            ? Colors.black
                                            : Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'calSans',
                                  ),
                                ),
                              );
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(snackBar);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: purple,
        unselectedItemColor: Colors.white70,
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(title: 'FitBeats'),
              ),
            );
          } else if (index == 1) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const PlaylistScreen()),
            // );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
