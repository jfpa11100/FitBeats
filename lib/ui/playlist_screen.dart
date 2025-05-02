import 'package:flutter/material.dart';
import 'package:myapp/ui/widgets/song_title.dart';


class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Text(
            "Power Boost para correr bajo la lluvia",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/runner.png',
                height: 310,
                width: 380,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: const [
                SongTile(title: "Overdrive", artist: "FTBC Beyondfeat", duration: "3:45"),
                SongTile(title: "Ignite", artist: "The Reworkers", duration: "2:40"),
                SongTile(title: "Strong Now", artist: "Fortifiers", duration: "3:37"),
                SongTile(title: "Keep Moving On", artist: "Pushers", duration: "3:25"),
              ],
            ),
          )
        ],
      ),
    );
  }
}


// Implementar la reproducción de la canción o playlist (hacer algo transición/gesto)
// Implementar el botón de "Favorito" y "no favorito" para cada canción