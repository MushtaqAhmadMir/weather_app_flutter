import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocProvider;
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter/common/di/injection.dart';
import 'package:weather_app_flutter/presentation/manager/style_manager.dart';
import 'package:weather_app_flutter/presentation/screens/home/cubit/home_cubit.dart';
import 'package:weather_app_flutter/presentation/screens/home/widgets/error_widget.dart';
import 'package:weather_app_flutter/presentation/screens/home/widgets/forecast_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final cubit = getIt<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (p, c) {
          var c1 = p.fiveDayWeatherResource != c.fiveDayWeatherResource;
          var c2 = p.weatherResource != c.weatherResource;
          var c3 = p.isPermissionGiven != c.isPermissionGiven;
          var c4 = p.position != c.position;
          return c1 || c2 || c3 || c4;
        },
        builder: (context, state) {
          var weather = state.weatherResource.data;
          final String city = weather?.name ?? "";
          final String country = weather?.sys?.country ?? "";

          return Scaffold(
            backgroundColor: Colors.blue[900],
            appBar: AppBar(
              title: Text(
                '${city.isEmpty ? "" : "$city,"} $country',
                style: StyleManager.headerOne(),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: GestureDetector(
                onPanUpdate: (details) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Column(
                  children: [
                    _buildSearchBar(context),
                    getCurrentScreenUI(state, context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getCurrentScreenUI(HomeState state, BuildContext context) {
    if (state.weatherResource.isLoading() ||
        state.fiveDayWeatherResource.isLoading()) {
      return loaderIndicator();
    } else if (state.weatherResource.isError()) {
      return ErrorScreen(
        isPermissionGiven: state.isPermissionGiven,
        onRetry: () {
          if (state.isPermissionGiven) {
            cubit.fetchWeatherDetails();
          } else {
            cubit.getPermission(
              callback: (value) {
                if (value == null) {
                  Geolocator.openAppSettings();
                }
              },
            );
          }
        },
      );
    } else {
      return _weatherContent(state, context);
    }
  }

  Widget loaderIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 200),
        const CircularProgressIndicator(color: Colors.white),
        const SizedBox(height: 12),
        Text(
          "Fetching Weather Data...",
          style: StyleManager.bodyText().copyWith(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: cubit.onChangeCity,
              controller: cubit.cityController,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              cursorHeight: 12,
              onEditingComplete: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: InputDecoration(
                labelStyle: StyleManager.bodyText(),
                hintText: "Enter city name",
                hintStyle: StyleManager.bodyText(),
                filled: true,

                fillColor: Colors.white.withValues(alpha: 0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(
                  Icons.location_city,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              if (cubit.cityController.text.isNotEmpty) {
                cubit.fetchWeatherDetails();
              }
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(15),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Icon(Icons.search, color: Colors.blue, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _weatherContent(HomeState state, BuildContext context) {
    return Column(
      children: [
        weatherUI(state),
        const SizedBox(height: 20),
        ForecastWidget(state: state),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget weatherUI(HomeState state) {
    var weather = state.weatherResource.data;
    final double temp = (weather?.main?.temp ?? 273.15) - 273.15;
    final double feelsLike = (weather?.main?.feelsLike ?? 273.15) - 273.15;
    final String condition = weather?.weather.first.description ?? "N/A";
    final String icon = weather?.weather.first.icon ?? "01d";
    final int humidity = weather?.main?.humidity ?? 0;
    final double windSpeed = weather?.wind?.speed ?? 0;
    final int pressure = weather?.main?.pressure ?? 0;

    final sunrise = DateTime.fromMillisecondsSinceEpoch(
      (weather?.sys?.sunrise ?? 0) * 1000,
    );
    final sunset = DateTime.fromMillisecondsSinceEpoch(
      (weather?.sys?.sunset ?? 0) * 1000,
    );
    final timeFormat = DateFormat('hh:mm a');

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        color: Colors.white.withValues(alpha: 0.2),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
              Text(condition.toUpperCase(), style: StyleManager.title()),
              const SizedBox(height: 10),
              Text(
                "${temp.toStringAsFixed(1)}°C",
                style: StyleManager.title().copyWith(
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
              Text(
                "Feels like ${feelsLike.toStringAsFixed(1)}°C",
                style: const TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  weatherInfoTile(Icons.water_drop, "Humidity", "$humidity%"),
                  weatherInfoTile(
                    Icons.air,
                    "Wind",
                    "${windSpeed.toStringAsFixed(1)} m/s",
                  ),
                  weatherInfoTile(Icons.compress, "Pressure", "$pressure hPa"),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  weatherInfoTile(
                    Icons.wb_sunny,
                    "Sunrise",
                    timeFormat.format(sunrise),
                  ),
                  weatherInfoTile(
                    Icons.nights_stay,
                    "Sunset",
                    timeFormat.format(sunset),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget weatherInfoTile(IconData icon, String title, String value) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.white70),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
