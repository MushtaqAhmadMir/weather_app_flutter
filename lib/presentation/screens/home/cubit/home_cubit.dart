import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_flutter/common/resource/data_resource.dart';
import 'package:weather_app_flutter/domain/resource/input/get_weather_input/get_weather_input.dart';
import 'package:weather_app_flutter/domain/resource/model/weather_model.dart';
import 'package:weather_app_flutter/domain/resource/model/weather_model_for_five_days.dart';
import 'package:weather_app_flutter/domain/usecase/get_weather_for_five_days_usecase.dart';
import 'package:weather_app_flutter/domain/usecase/get_weather_report_usecase.dart';
import 'package:weather_app_flutter/presentation/manager/location_manager.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.weatherUseCase, this.weatherForFiveDaysUsecase)
    : super(HomeState.initial()) {
    getPermission();
  }
  final TextEditingController cityController = TextEditingController();
  final GetWeatherUseCase weatherUseCase;
  final GetWeatherForFiveDaysUsecase weatherForFiveDaysUsecase;

  Future<void> getPermission() async {
    emit(state.copyWith(weatherResource: DataResource.loading()));
    try {
      var response = await LocationManager.determinePosition();
      double? lat = response?.latitude;
      double? lng = response?.longitude;

      getWeatherReport(lat.toString(), lng.toString());
      getWeatherReportForFiveDays(lat.toString(), lng.toString());
    } catch (e) {
      //handle error
      // Scaffold
    }
  }

  void getWeatherReport(String lat, String lng) async {
    String apiKey = dotenv.env['OPEN_WATHER_API_KEY'] ?? '';
    emit(state.copyWith(weatherResource: DataResource.loading()));
    weatherUseCase.invoke(
      input: GetWeatherInput(
        q: state.city,
        lat: lat,
        lng: lng,
        appId: apiKey,
        // units: LocationUnits.metric,
      ),
      callback: (value) {
        emit(state.copyWith(weatherResource: value));
        if (value.isSuccess()) {} //for handling calculations or other stuff
        if (value.isError()) {
          //for to show toast message
          debugPrint(value.failure?.message);
        }
      },
    );
  }

  void getWeatherReportForFiveDays(String lat, String lng) async {
    String apiKey = dotenv.env['OPEN_WATHER_API_KEY'] ?? '';
    emit(state.copyWith(fiveDayWeatherResource: DataResource.loading()));
    weatherForFiveDaysUsecase.invoke(
      input: GetWeatherInput(q: state.city, lat: lat, lng: lng, appId: apiKey),
      callback: (value) {
        emit(state.copyWith(fiveDayWeatherResource: value));
        if (value.isSuccess()) {} //for handling calculations or other stuff
        if (value.isError()) {} //for to show toast message
      },
    );
  }

  void onChangeCity(String val) {
    if (val.isEmpty) {
      getPermission();
    }
    emit(state.copyWith(city: val));
  }
}
