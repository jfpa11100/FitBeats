import 'package:flutter/material.dart';
import 'package:myapp/ui/favorite_list_screen.dart';
import 'package:myapp/ui/home_screen.dart';
import 'package:myapp/ui/widgets/favorite_icon.dart';
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

    final snackBar = SnackBar(
      backgroundColor: const Color(0xFF9B5DE5),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      content: Text(
        isFavorite
            ? 'Añadido a favoritos'
            : 'Eliminado de favoritos',
        style: TextStyle(
          color: isFavorite ? Colors.black : Colors.white,
          fontWeight: FontWeight.w500, fontFamily: 'calSans',),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                FavoriteIcon(isFavorite: isFavorite, onPressed: _toggleFavorite),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                SongTitle(title: "Overdrive", artist: "FTBC Beyondfeat", duration: "3:45"),
                SongTitle(title: "Ignite", artist: "The Reworkers", duration: "2:40"),
                SongTitle(title: "Strong Now", artist: "Fortifiers", duration: "3:37"),
                SongTitle(title: "Keep Moving On", artist: "Pushers", duration: "3:25"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: 1, // O el índice actual correspondiente
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(title: 'FitBeats',),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteListScreen(),
                ),
              );
              break;

              // Implementar navegación a perfil
              
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),

    );
  }
}
