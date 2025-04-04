import 'package:geolocator/geolocator.dart';

class LocationManager {
  static Future<Position?> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location services are disabled.");
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Location permission denied.");
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Location permission permanently denied.");
      return null;
    }

    try {
      Position? lastPosition = await Geolocator.getLastKnownPosition();
      if (lastPosition != null) {
        print(
          "Using Last Known Position: ${lastPosition.latitude}, ${lastPosition.longitude}",
        );
        return lastPosition;
      }

      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );

      return await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
    } catch (e) {
      print("Error getting location: $e");
      return null;
    }
  }
}
