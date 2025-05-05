import 'package:flutter/material.dart';
import 'package:myapp/ui/home_screen.dart';
import 'package:myapp/ui/playlist_screen.dart';
import 'package:myapp/ui/widgets/favorite_icon.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen({super.key});

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  List<Map<String, dynamic>> favoritePlaylists = [
    {
      'title': 'Power Boost para Correr Bajo la Lluvia',
      'addedAt': '2025-05-04',
      'image': 'assets/images/runner.png',
      'isFavorite': true,
    },
    {
      'title': 'Energía Total de Lunes',
      'addedAt': '2025-05-02',
      'image': 'assets/images/walk.png',
      'isFavorite': true,
    },
    {
      'title': 'Solo Hits para Hacer Yoga',
      'addedAt': '2025-04-01',
      'image': 'assets/images/yoga.png',
      'isFavorite': true,
    },
    {
      'title': 'Crossover para Hacer Hiit',
      'addedAt': '2025-04-28',
      'image': 'assets/images/hiit.png',
      'isFavorite': true,
    },
    {
      'title': 'Rock Pesado para Correr',
      'addedAt': '2025-03-09',
      'image': 'assets/images/runner.png',
      'isFavorite': true,
    },
  ];

  void toggleFavorite(int index) {
    setState(() {
      favoritePlaylists[index]['isFavorite'] =
          !favoritePlaylists[index]['isFavorite'];
    });

    final playlist = favoritePlaylists[index];
    final snackBar = SnackBar(
      backgroundColor: const Color(0xFF9B5DE5),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      content: Text(
        playlist['isFavorite']
            ? 'Añadido a favoritos'
            : 'Eliminado de favoritos',
        style: TextStyle(
          color: playlist['isFavorite'] ? Colors.black : Colors.white,
          fontWeight: FontWeight.w500, fontFamily: 'calSans',
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    const Color purple = Color(0xFF9B5DE5);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Favoritos',
          style: Theme.of(context)
              .textTheme.titleLarge
              ?.copyWith(color: Colors.white),
        ),

      ),
      body: ListView.builder(
        itemCount: favoritePlaylists.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final playlist = favoritePlaylists[index];

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
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      playlist['image'],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        playlist['title'],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Añadido el ${playlist['addedAt']}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                          FavoriteIcon(
                            isFavorite: playlist['isFavorite'],
                            onPressed: () => toggleFavorite(index),
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
        currentIndex: 1, // Favoritos
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen(title: 'FitBeats')),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PlaylistScreen()),
            );
          }

          // Implementar navegación a perfil
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
