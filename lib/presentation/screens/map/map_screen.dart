import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_app_flutter/common/utils/constants.dart';

class MapScreen extends StatefulWidget {
  final double lat;
  final double lng;
  final double temperature;
  final double humidity;
  final String cityName;
  final String date;

  const MapScreen({
    super.key,
    required this.lat,
    required this.lng,
    required this.temperature,
    required this.humidity,
    required this.cityName,
    required this.date,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  void _showWeatherInfo() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // Transparent for rounded effect
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.cityName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              Text(
                widget.date,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Divider(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.thermostat,
                        color: Colors.orange,
                        size: 40,
                      ),
                      Text(
                        "${widget.temperature.toStringAsFixed(1)}°C",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Temperature",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Column(
                    children: [
                      const Icon(
                        Icons.water_drop,
                        color: Colors.blue,
                        size: 40,
                      ),
                      Text(
                        "${widget.humidity}%",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Humidity",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(widget.lat, widget.lng),
              initialZoom: 15,
            ),
            children: [
              TileLayer(urlTemplate: Constants.urlTemplate),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 50.0,
                    height: 50.0,
                    point: LatLng(widget.lat, widget.lng),
                    child: GestureDetector(
                      onTap: _showWeatherInfo,
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 45,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 50,
            left: 20,
            child: FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.white,
              elevation: 5,
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
