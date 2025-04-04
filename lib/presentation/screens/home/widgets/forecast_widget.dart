import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter/domain/resource/model/weather_model_for_five_days.dart';
import 'package:weather_app_flutter/presentation/manager/style_manager.dart';
import 'package:weather_app_flutter/presentation/screens/home/cubit/home_cubit.dart';
import 'package:weather_app_flutter/presentation/screens/map/map_screen.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({super.key, required this.state});
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return forecastUI(state, context);
  }

  Widget forecastUI(HomeState state, BuildContext context) {
    var forecast = state.fiveDayWeatherResource.data?.list ?? [];

    // Group forecasts by date
    Map<String, WeatherForFiveDaysListModel> dailyForecast = {};
    for (var item in forecast) {
      if (item == null) continue;
      String date = item.dtTxt.split(" ")[0]; // Extract date (YYYY-MM-DD)
      if (!dailyForecast.containsKey(date)) {
        dailyForecast[date] = item;
      }
    }

    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children:
            dailyForecast.entries.map((entry) {
              var item = entry.value;
              return _forecastCard(item, context, state);
            }).toList(),
      ),
    );
  }

  Widget _forecastCard(
    WeatherForFiveDaysListModel item,
    BuildContext context,
    HomeState state,
  ) {
    final double temp = (item.main?.temp ?? 273.15) - 273.15;
    String icon = item.weather.first?.icon ?? "01d";
    String date = DateFormat("EEE, MMM d").format(DateTime.parse(item.dtTxt));

    final String city = state.fiveDayWeatherResource.data?.city?.name ?? "";
    final String country =
        state.fiveDayWeatherResource.data?.city?.country ?? "";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => MapScreen(
                  date: date,
                  cityName: "$city, $country",
                  lat: state.weatherResource.data?.coord?.lat ?? 0.0,
                  lng: state.weatherResource.data?.coord?.lon ?? 0.0,
                  temperature: temp,
                  humidity:
                      double.tryParse(item.main?.humidity.toString() ?? "") ??
                      0,
                ),
          ),
        );
      },
      child: Container(
        width: 120,
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.blue.shade800, Colors.blue.shade500],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              date,
              style: StyleManager.bodyText().copyWith(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Image.network(
              "https://openweathermap.org/img/wn/$icon@2x.png",
              height: 50,
              width: 50,
              fit: BoxFit.cover, // Ensures image fits correctly
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child; // ✅ Show image once loaded
                }

                return Center(
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                      value:
                          loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null, // ✅ Show loading progress
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.cloud, size: 50, color: Colors.white);
              },
            ),

            const SizedBox(height: 8),
            Text(
              "${temp.toStringAsFixed(1)}°C",
              style: StyleManager.bodyText().copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
