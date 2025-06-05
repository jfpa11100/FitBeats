import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/providers/weather_provider.dart';

class WeatherWidget extends ConsumerStatefulWidget {
  final Position location;
  const WeatherWidget({super.key, required this.location});

  @override
  ConsumerState<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends ConsumerState<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(
      weatherProvider(
        "${widget.location.latitude},${widget.location.longitude}",
      ),
    );

    return weatherState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              error.toString(),
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        );
        return const Center(child: Text('Activa la ubicación del dispositivo'));
      },
      data:
          (response) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              weatherIcon(response.current.condition.text.toLowerCase()),
              Column(
                children: [
                  Text(
                    "${response.current.condition.text} ${response.current.tempC}°C",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "${response.location.name}, ${response.location.region}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Text('Hoy', style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
    );
  }

  Widget weatherIcon(String condition) {
    if (condition.contains('cloud') || condition.contains('overcast')) {
      return Icon(Icons.cloud, size: 40, color: Colors.grey);
    } else if (condition.contains('sun')) {
      return Icon(Icons.wb_sunny, size: 40, color: Colors.yellow);
    } else if (condition.contains('rain')) {
      return Icon(Icons.cloudy_snowing, size: 40, color: Colors.blue);
    }
    return Icon(Icons.help_outline, size: 40);
  }
}
