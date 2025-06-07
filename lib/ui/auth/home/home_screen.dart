import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/controllers/location_controller.dart';
import 'package:myapp/ui/auth/home/widgets/activity_widget.dart';

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
      body: ActivityWidget(authLocation: authLocation, location: location),
    );
  }
}
