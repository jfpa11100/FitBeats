import 'package:flutter/material.dart';
import 'package:myapp/Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitBeats',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

// API with audios: https://audiomack.com/data-api/docs


// APIs TO HAVE IN MIND:
// https://docs-en.kkbox.codes/#get-/tracks/{track_id}
// https://developer.spotify.com/documentation/web-api/reference/get-track
