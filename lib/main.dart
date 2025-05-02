import 'package:flutter/material.dart';
import 'package:myapp/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitBeats',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.purple,
          primary: Colors.white,
          secondary: Colors.black,
          primaryContainer: Colors.black,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontFamily: 'calSans',
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: const TextStyle(
            fontFamily: 'calSans',
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'schibstedGrotesk',
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
          bodySmall: TextStyle(
            fontFamily: 'schibstedGrotesk',
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
          displaySmall: TextStyle(
            fontFamily: 'schibstedGrotesk',
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.primary,
          titleTextStyle: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      home: SafeArea(child: const HomeScreen(title: 'FitBeats')),
    );
  }
}

// API with audios: https://audiomack.com/data-api/docs

// APIs TO HAVE IN MIND:
// https://docs-en.kkbox.codes/#get-/tracks/{track_id}
// https://developer.spotify.com/documentation/web-api/reference/get-track
