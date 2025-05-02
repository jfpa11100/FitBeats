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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Elige una actividad',
            style: Theme.of(context).textTheme.bodyMedium,
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
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ActivityButton(icon: Icons.mood, text: '', width: 70, height: 70),
              ActivityButton(
                icon: Icons.sentiment_satisfied_alt,
                text: '',
                width: 70,
                height: 70,
              ),
              ActivityButton(
                icon: Icons.sentiment_neutral,
                text: '',
                width: 70,
                height: 70,
              ),
              ActivityButton(
                icon: Icons.mood_bad,
                text: '',
                width: 70,
                height: 70,
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Buscar mi playlist',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
