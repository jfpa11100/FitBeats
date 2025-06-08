import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/models/playlist.dart';
import 'package:myapp/providers/favorite_playlist_provider.dart';
import 'package:myapp/ui/layout/bottom_navbar.dart';
import 'package:myapp/ui/playlists/widgets/favorite_icon.dart';

class FavoriteListScreen extends ConsumerWidget {
  const FavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritePlaylists = ref.watch(favoritePlaylistProvider);
    final controller = ref.read(favoritePlaylistProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Favoritos',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: favoritePlaylists.isEmpty 
        ? Center(
            child: Text(
              'No has agregado playlists favoritas',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white70),
            ),
          )
        : ListView.builder(
        itemCount: favoritePlaylists.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final Playlist playlist = favoritePlaylists[index];

          return GestureDetector(
            // onTap: () => {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => PlaylistScreen(),
            //     ),
            //   ),
            // },
            child: Container(
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
                            Expanded(
                              child: Text(
                                'Añadido el ${playlist.addedAt!.split('.')[0]}',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(color: Colors.white70),
                              ),
                            ),
                            FavoriteIcon(
                              isFavorite: playlist.isFavorite,
                              onPressed: () {
                                controller.toggleFavoritePlaylist(playlist);
                                final updatedIsFavorite = ref
                                    .read(favoritePlaylistProvider)
                                    .any((favPlaylist) => favPlaylist.id == playlist.id);
            
                                final message = updatedIsFavorite
                                    ? 'Añadido a favoritos'
                                    : 'Eliminado de favoritos';
                                
                                final snackBar = SnackBar(
                                  backgroundColor: Color(0xFF9B5DE5),
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 1),
                                  content: Text(
                                    message,
                                    style: TextStyle(
                                      color: updatedIsFavorite
                                          ? Colors.black
                                          : Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'calSans',
                                    ),
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(curIndex: 1),
    );
  }
}
