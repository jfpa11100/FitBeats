import 'package:flutter/material.dart';
import 'package:myapp/ui/playlists/favorite_list_screen.dart';
import 'package:myapp/ui/home/home_screen.dart';
import 'package:myapp/ui/profile/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int curIndex;
  const BottomNavBar({
    super.key,
    required this.curIndex
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Color(0xFF9B5DE5),
      unselectedItemColor: Colors.white70,
      currentIndex: curIndex,
      onTap: (index) {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen(title: 'FitBeats')),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FavoriteListScreen()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
    );
  }
}