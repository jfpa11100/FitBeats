import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/song_model.dart';
import '../../../providers/playlist_provider.dart';

class SongTitle extends ConsumerWidget {
  final SongModel song;

  const SongTitle({super.key, required this.song});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(playlistProvider);

    return InkWell(
      onTap: () {
        controller.togglePlay(song);
        final isPlaying = controller.songs.firstWhere((s) => s.title == song.title).isPlaying;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xFF9B5DE5),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 1),
            content: Row(
              children: [
                Icon(
                  isPlaying ? Icons.play_circle_fill : Icons.pause_circle_filled,
                  color: isPlaying ? Colors.black : Colors.grey[300],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    isPlaying ? 'Reproduciendo: ${song.title}' : 'Pausado: ${song.title}',
                    style: TextStyle(
                      color: isPlaying ? Colors.black : Colors.grey[300],
                      fontWeight: FontWeight.w500,
                      fontFamily: 'calSans',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      splashColor: Colors.white10,
      highlightColor: Colors.white12,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    song.artist,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    song.duration,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    song.isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                    color: const Color(0xFF9B5DE5),
                    size: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}