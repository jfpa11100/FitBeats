import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/ui/auth/login_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: dotenv.env['API_KEY']!,
        appId: dotenv.env['APP_ID']!,
        messagingSenderId: dotenv.env['SENDER_ID']!,
        projectId: dotenv.env['PROJECT_ID']!,
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          onSecondary: const Color.fromARGB(255, 160, 34, 247),
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
        ),
      ),
      home: SafeArea(child: const LoginScreen(title: 'FitBeats')),
    );
  }
}

// API with audios: https://audiomack.com/data-api/docs

// APIs TO HAVE IN MIND:
// https://docs-en.kkbox.codes/#get-/tracks/{track_id}
// https://developer.spotify.com/documentation/web-api/reference/get-track
