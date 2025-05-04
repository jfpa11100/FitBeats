import 'package:flutter/material.dart';
import 'package:myapp/ui/widgets/song_title.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  bool isFavorite = false; 

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; 
    });
  }

  Widget _buildSongTile(BuildContext context, String title, String artist, String duration) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      splashColor: Colors.white10,
      highlightColor: Colors.white12,
      child: SongTile(
        title: title,
        artist: artist,
        duration: duration,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            "Power Boost para correr bajo la lluvia",
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
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: _toggleFavorite, // Cambiar estado al hacer clic
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                _buildSongTile(context, "Overdrive", "FTBC Beyondfeat", "3:45"),
                _buildSongTile(context, "Ignite", "The Reworkers", "2:40"),
                _buildSongTile(context, "Strong Now", "Fortifiers", "3:37"),
                _buildSongTile(context, "Keep Moving On", "Pushers", "3:25"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
