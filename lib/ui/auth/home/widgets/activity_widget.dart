import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/ui/auth/home/widgets/activity_button.dart';
import 'package:myapp/ui/playlist_screen.dart';
import 'package:myapp/ui/widgets/weather_widget.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({
    super.key,
    required this.authLocation,
    required this.location,
  });

  final bool authLocation;
  final Position location;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Elige una actividad',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActivityButton(icon: Icons.directions_walk, text: 'Caminar'),
                ActivityButton(icon: Icons.directions_run, text: 'Correr'),
                ActivityButton(icon: Icons.directions_bike, text: 'Ciclismo'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActivityButton(icon: Icons.fitness_center, text: 'Gym'),
                ActivityButton(icon: Icons.self_improvement, text: 'Yoga'),
                ActivityButton(icon: Icons.monitor_heart_rounded, text: 'HIIT'),
              ],
            ),
          ],
        ),
        Text(
          '¿Cómo te sientes?',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ActivityButton(
              icon: Icons.mood,
              background: false,
              text: '',
              width: 70,
              height: 70,
              iconColor: Colors.yellow,
              iconSize: 45,
            ),
            ActivityButton(
              icon: Icons.sentiment_satisfied_alt,
              text: '',
              background: false,
              width: 70,
              height: 70,
              iconColor: Colors.yellow,
              iconSize: 45,
            ),
            ActivityButton(
              icon: Icons.sentiment_neutral,
              background: false,
              text: '',
              width: 70,
              height: 70,
              iconColor: Colors.yellow,
              iconSize: 45,
            ),
            ActivityButton(
              icon: Icons.mood_bad,
              text: '',
              background: false,
              width: 70,
              height: 70,
              iconColor: Colors.yellow,
              iconSize: 45,
            ),
          ],
        ),
        authLocation
            ? WeatherWidget(location: location)
            : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                SizedBox(width: 10),
                Text(
                  'Habilita y activa la ubicación\ndel dispositivo para\nfuncionar correctamente',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlaylistScreen()),
            );
          },
          child: Text('Buscar mi playlist'),
        ),
      ],
    );
  }
}