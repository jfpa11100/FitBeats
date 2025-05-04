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
          seedColor: const Color.fromARGB(255, 160, 34, 247),
          primary: Colors.white,
          secondary: const Color.fromARGB(255, 68, 83, 205),
          primaryContainer: Colors.black,
          surface: Colors.black,
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
          titleMedium: TextStyle(
            fontFamily: 'schibstedGrotesk',
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'schibstedGrotesk',
            color: Colors.white,
            fontSize: 20,
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
          backgroundColor: Colors.black,
          titleTextStyle: Theme.of(context).textTheme.displayLarge,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            iconColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 68, 83, 205),
            textStyle: TextStyle(
              fontFamily: 'schibstedGrotesk',
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'schibstedGrotesk',
            fontWeight: FontWeight.w600,
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 17, 18, 22),
          contentPadding: EdgeInsets.symmetric(
            vertical: 25.0,
            horizontal: 20.0,
          ),
          //volver el input border redondeado sin que se vea el color,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0.0,
            ),
          ),
          // border: InputBorder.none,
        ),
      ),
      home: SafeArea(child: const HomeScreen(title:'FitBeats')),
    );
  }
}

// API with audios: https://audiomack.com/data-api/docs

// APIs TO HAVE IN MIND:
// https://docs-en.kkbox.codes/#get-/tracks/{track_id}
// https://developer.spotify.com/documentation/web-api/reference/get-track
