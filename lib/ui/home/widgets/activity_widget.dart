import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/controllers/location_controller.dart';
import 'package:myapp/ui/home/widgets/activity_button.dart';
import 'package:myapp/ui/playlists/playlist_screen.dart';
import 'package:myapp/ui/home/widgets/weather_widget.dart';

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({super.key});

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
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
  final Map<String, String?> searchQuery = {
    'mood': null,
    'weather': null,
    'activity': null,
  };
  final Map<String, bool> activitySelections = {
    'Caminar': false,
    'Correr': false,
    'Ciclismo': false,
    'Gym': false,
    'Yoga': false,
    'HIIT': false,
  };

  final Map<String, bool> moodSelections = {
    'excited': false,
    'happy': false,
    '': false,
    'sad': false,
  };

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
                ActivityButton(
                  icon: Icons.directions_walk,
                  text: 'Caminar',
                  isSelected: activitySelections['Caminar']!,
                  onChanged: (value) {
                    setState(() => activitySelections['Caminar'] = value);
                    setState(() => searchQuery['activity'] = 'walk');
                  },
                ),
                ActivityButton(
                  icon: Icons.directions_run,
                  text: 'Correr',
                  isSelected: activitySelections['Correr']!,
                  onChanged: (value) {
                    setState(() => activitySelections['Correr'] = value);
                    setState(() => searchQuery['activity'] = 'running');
                  },
                ),
                ActivityButton(
                  icon: Icons.directions_bike,
                  text: 'Ciclismo',
                  isSelected: activitySelections['Ciclismo']!,
                  onChanged: (value) {
                    setState(() => activitySelections['Ciclismo'] = value);
                    setState(() => searchQuery['cycling'] = 'cycling');
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActivityButton(
                  icon: Icons.fitness_center,
                  text: 'Gym',
                  isSelected: activitySelections['Gym']!,
                  onChanged: (value) {
                    setState(() => activitySelections['Gym'] = value);
                    setState(() => searchQuery['activity'] = 'gym');
                  },
                ),
                ActivityButton(
                  icon: Icons.self_improvement,
                  text: 'Yoga',
                  isSelected: activitySelections['Yoga']!,
                  onChanged: (value) {
                    setState(() => activitySelections['Yoga'] = value);
                    setState(() => searchQuery['activity'] = 'yoga');
                  },
                ),
                ActivityButton(
                  icon: Icons.monitor_heart_rounded,
                  text: 'HIIT',
                  isSelected: activitySelections['HIIT']!,
                  onChanged: (value) {
                    setState(() => activitySelections['HIIT'] = value);
                    setState(() => searchQuery['activity'] = 'HIIT');
                  },
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
              isSelected: moodSelections['excited']!,
              onChanged: (value) {
                setState(() => moodSelections['excited'] = value);
                setState(() => searchQuery['mood'] = '');
              },
            ),
            ActivityButton(
              icon: Icons.sentiment_satisfied_alt,
              text: '',
              background: false,
              width: 70,
              height: 70,
              iconColor: Colors.yellow,
              iconSize: 45,
              isSelected: moodSelections['happy']!,
              onChanged: (value) {
                setState(() => moodSelections['happy'] = value);
                setState(() => searchQuery['mood'] = 'happy');
              },
            ),
            ActivityButton(
              icon: Icons.sentiment_neutral,
              background: false,
              text: '',
              width: 70,
              height: 70,
              iconColor: Colors.yellow,
              iconSize: 45,
              isSelected: moodSelections['']!,
              onChanged: (value) {
                setState(() => moodSelections[''] = value);
                setState(() => searchQuery['mood'] = '');
              },
            ),
            ActivityButton(
              icon: Icons.mood_bad,
              text: '',
              background: false,
              width: 70,
              height: 70,
              iconColor: Colors.yellow,
              iconSize: 45,
              isSelected: moodSelections['sad']!,
              onChanged: (value) {
                setState(() => moodSelections['sad'] = value);
                setState(() => searchQuery['mood'] = 'sad');
              },
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
              MaterialPageRoute(
                builder: (context) => PlaylistScreen(searchQuery: searchQuery),
              ),
            );
          },
          child: Text('Buscar mi playlist'),
        ),
      ],
    );
  }
}
