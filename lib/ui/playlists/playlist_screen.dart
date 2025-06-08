import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/providers/playlist_provider.dart';
import 'package:myapp/ui/layout/bottom_navbar.dart';
import 'widgets/favorite_icon.dart';
import 'widgets/song_title.dart';
import 'package:myapp/providers/favorite_playlist_provider.dart';

class PlaylistScreen extends ConsumerWidget {
  final Map<String, String?> searchQuery;
  const PlaylistScreen({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistState = ref.watch(playlistProvider(searchQuery.values.join(" ")));
    ref.watch(favoritePlaylistProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: playlistState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) {
          return Center(child: Text(error.toString().replaceAll("Exception:", "")));
        },
        data: (playlist) {
          playlist = playlist.copyWith(image: imageToDisplay(playlist.title));
          return Column(
            children: [
              Text(
                playlist.title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 16),
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        playlist.image!,
                        height: 310,
                        width: 380,
                        fit: BoxFit.cover,
                      ),
                    ),
                    FavoriteIcon(
                      onPressed: () {
                        ref
                            .read(favoritePlaylistProvider.notifier)
                            .toggleFavoritePlaylist(playlist);

                        bool isFav = ref
                            .read(favoritePlaylistProvider.notifier).isFavorite(playlist);

                        final message =
                            isFav
                                ? 'Añadido a favoritos'
                                : 'Eliminado de favoritos';
                        final snackBar = SnackBar(
                          backgroundColor: const Color(0xFF9B5DE5),
                          content: Text(
                            message,
                            style: TextStyle(
                              color: isFav ? Colors.black : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'calSans',
                            ),
                          ),
                          duration: const Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      isFavorite: ref
                            .read(favoritePlaylistProvider.notifier).isFavorite(playlist),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: playlist.songs.length,
                  itemBuilder: (context, index) {
                    return SongTitle(song: playlist.songs[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(curIndex: 0)
    );
  }

  String imageToDisplay(String title) {
    if (title.toLowerCase().contains('walk')) {
      return 'assets/images/walk.png';
    } else if (title.toLowerCase().contains('run')) {
      return 'assets/images/runner.png';
    } else if (title.toLowerCase().contains('cycling')) {
      return 'assets/images/cycling.png';
    } else if (title.toLowerCase().contains('gym')) {
      return 'assets/images/gym.png';
    } else if (title.toLowerCase().contains('yoga')) {
      return 'assets/images/yoga.png';
    } else if (title.toLowerCase().contains('hiit')) {
      return 'assets/images/hiit.png';
    } else {
      return 'assets/images/default_activity.png';
    }
  }
}
