import 'package:flutter/material.dart';

class SongTitle extends StatefulWidget {
  final String title;
  final String artist;
  final String duration;

  const SongTitle({
    super.key,
    required this.title,
    required this.artist,
    required this.duration,
  });

  @override
  State<SongTitle> createState() => _SongTitleState();
}

class _SongTitleState extends State<SongTitle> {
  bool isPlaying = false;

  void _togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
    });

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
                isPlaying
                    ? 'Reproduciendo: ${widget.title}'
                    : 'Pausado: ${widget.title}',
                style: TextStyle(
                  color: isPlaying ? Colors.black : Colors.grey[300],
                  fontWeight: FontWeight.w500, fontFamily: 'calSans',
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _togglePlay,
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
                    widget.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.artist,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white70,
                        ),
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
                    widget.duration,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
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
