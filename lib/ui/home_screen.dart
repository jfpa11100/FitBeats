import 'package:flutter/material.dart';
import 'package:myapp/ui/widgets/activity_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;
  @override
  State<HomeScreen> createState() => _HomScreeneState();
}

class _HomScreeneState extends State<HomeScreen> {
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
                  ActivityButton(icon: Icons.self_improvement, text: 'yoga'),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.cloudy_snowing, size: 50.0),
              Column(
                children: [
                  Text(
                    'Lluvia 12°',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Ciudad, País',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Text('Hoy', style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: Text('Buscar mi playlist')),
        ],
      ),
    );
  }
}
