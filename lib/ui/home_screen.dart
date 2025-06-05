import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/controllers/location_controller.dart';
import 'package:myapp/ui/widgets/activity_button.dart';
import 'package:myapp/ui/playlist_screen.dart';
import 'package:myapp/ui/widgets/weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool authLocation = false;
  late Position location;

  @override
  void initState() {
    super.initState();
    LocationController().getLocation().then(
      (pos) => {
        setState(() {
          location = pos;
          authLocation = true;
        }),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: Image.asset('assets/images/logo.png'),
      ),
      body: Column(
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
                  ActivityButton(icon: Icons.fitness_center, text: 'Fuerza'),
                  ActivityButton(icon: Icons.self_improvement, text: 'Yoga'),
                  ActivityButton(
                    icon: Icons.monitor_heart_rounded,
                    text: 'HIIT',
                  ),
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
      ),
    );
  }
}
