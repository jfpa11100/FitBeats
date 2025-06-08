import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/models/song.dart';
import '../../../providers/reproductor_provider.dart';

class SongTitle extends ConsumerWidget {
  final Song song;

  const SongTitle({super.key, required this.song});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reproductorState = ref.watch(reproductorProvider);
    final isCurrent = reproductorState.currentSong?.id == song.id;
    final isPlaying = isCurrent && reproductorState.isPlaying;

    return InkWell(
      onTap: () {
        ref.read(reproductorProvider.notifier).togglePlay(song);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xFF9B5DE5),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 1),
            content: Row(
              children: [
                Icon(
                  isPlaying
                      ? Icons.play_circle_fill
                      : Icons.pause_circle_filled,
                  color: isPlaying ? Colors.black : Colors.grey[300],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    !isPlaying
                        ? 'Reproduciendo: ${song.name}'
                        : 'Pausado: ${song.name}',
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
                    song.name,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    song.artists.map((artist) => artist.name).join(', '),
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.white70),
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
                    formatDuration(song.durationMs),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
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

  String formatDuration(int milliseconds) {
    final duration = Duration(milliseconds: milliseconds);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    final secondsStr = seconds.toString().padLeft(2, '0');
    return '$minutes:$secondsStr';
  }
}
