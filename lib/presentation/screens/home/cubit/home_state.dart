part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({
    @Default(DataResource.initial())
    DataResource<WeatherReportModel> weatherResource,
    @Default(DataResource.initial())
    DataResource<WeatherForFiveDaysModel> fiveDayWeatherResource,
    @Default("") String city,
  }) = _Initial;
}
