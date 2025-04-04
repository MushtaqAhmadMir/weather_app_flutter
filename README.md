# 🌤️ Weather App Flutter

A full-featured **Weather App** built with **Flutter** using **Clean Architecture**, **Cubit/BLoC** for state management, **Dio + Retrofit** for API calls, and **Dependency Injection** with `get_it` and `injectable`.

## 🏗️ Architecture

The project is structured into the following clean architecture layers:

- **Presentation Layer**  
  - UI Screens, Widgets, Resource Managers (Colors, Styles, Routes, etc.)
  - `Cubit/BLoC` for state management
- **Domain Layer**  
  - Business logic (UseCases), Repositories (abstract)
  - Entities and Inputs
- **Data Layer**  
  - Repository Implementations, Remote Data Sources, API Clients
- **Common Layer**  
  - Dependency Injection, Resource classes, Utility functions, Default UseCases

---

## 🔧 Key Features

- 🌐 **Dio + Retrofit** for structured API calls
- 🧩 **Cubit / BLoC** for reactive state management
- 💉 **Dependency Injection** using `get_it` and `injectable`
- 🧮 **Freezed** for immutable data classes and sealed unions
- 📦 **Shared Preferences** for local storage
- 📍 **Geolocation** support
- 🗺️ Integrated **Google Maps** and **Flutter Map**
- 🌟 **Shimmer** for loading UI
- 🎯 Centralized **Error Handling**
- ⚙️ `DataResource<T>` for encapsulating API loading, success, error states
- ⚙️ `DefaultUseCase<In, Out>` base class for all business logic
- 🌈 Custom **Manager Classes** for theme, style, and resources

---

---

## 🧱 Project Structure
```
lib/
├── common/
│   ├── di/                  # Dependency injection setup
│   ├── manager/             # AssetManager, ColorManager, StyleManager etc.
│   ├── resource/            # DataResource, ResourceState, DataFailure
│   ├── utils/               # Helpers and error handler
├── data/
│   ├── datasource/          # API services and implementations
│   ├── models/              # Network models
│   ├── repository_impl/     # Repository implementations
├── domain/
│   ├── entities/            # Business logic entities
│   ├── repository/          # Abstract repositories
│   ├── usecase/             # Use cases with DefaultUseCase
├── presentation/
│   ├── cubit/               # BLoC and Cubit logic
│   ├── pages/               # Screen widgets
│   ├── widgets/             # Reusable widgets
│   ├── app.dart             # Root widget
├── main.dart                # App entry point
```

---

## 🔗 Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.6
  flutter_lifecycle_aware: ^0.0.3
  get_it: ^8.0.3
  injectable: ^2.5.0
  flutter_hooks: ^0.20.5
  intl: ^0.19.0
  shared_preferences: ^2.3.4
  shimmer: ^3.0.0
  logging: ^1.3.0
  flutter_bloc: ^8.1.6
  bloc: ^8.1.4
  freezed: ^2.5.7
  freezed_annotation: ^2.4.4
  dio: ^5.7.0
  animated_snack_bar: ^0.4.0
  pretty_dio_logger: ^1.4.0
  retrofit: ^4.4.2
  dart_mappable: ^4.3.0
  json_annotation: ^4.9.0
  geolocator: ^13.0.4
  equatable: ^2.0.7
  google_fonts: ^6.2.1
  flutter_map: ^8.1.1
  latlong2: ^0.9.1
  flutter_dotenv: ^5.2.1
  google_maps_flutter: ^2.12.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  injectable_generator: ^2.6.2
  build_runner: ^2.4.14
  json_serializable: ^6.9.0
  retrofit_generator: ^9.1.7
  dart_mappable_builder: ^4.3.0
```

---

## 🧩 Core Classes

### `DataResource<T>`
```dart
class DataResource<T> extends Equatable {
  final ResourceState resourceState;
  final T? data;
  final DataFailure? failure;

  const DataResource(this.resourceState, this.data, this.failure);

  const DataResource.loading({T? data}) : this(ResourceState.loading, data, null);
  const DataResource.success(T? data) : this(ResourceState.success, data, null);
  const DataResource.error(DataFailure? failure) : this(ResourceState.error, null, failure);

  bool isLoading() => resourceState == ResourceState.loading;
  bool isSuccess() => resourceState == ResourceState.success;
  bool isError() => resourceState == ResourceState.error;

  @override
  List<Object?> get props => [resourceState, data, failure];
}

enum ResourceState { initial, loading, success, error }
```

### `DefaultUseCase<In, Out>`
```dart
abstract class DefaultUseCase<In, Out> {
  Future<Out> run(In input, DataType dataType);

  Future<DataResource<Out>> invoke({
    ValueChanged<DataResource<Out>>? callback,
    required In input,
    DataType dataType = DataType.forceCacheStrategy,
    Duration timeout = const Duration(seconds: 120),
  }) async {
    try {
      callback?.call(const DataResource.loading());
      var result = await run(input, dataType).timeout(timeout);
      callback?.call(DataResource.success(result));
      return DataResource.success(result);
    } catch (error) {
      var tracedError = ErrorHandler().traceErrorException(error);
      callback?.call(DataResource.error(tracedError));
      return DataResource.error(tracedError);
    }
  }
}
```

---

## 🌍 API Example with Dio + Retrofit
```dart
@RestApi(baseUrl: "https://api.weatherapi.com/v1")
abstract class WeatherService {
  factory WeatherService(Dio dio, {String baseUrl}) = _WeatherService;

  @GET("/current.json")
  Future<WeatherResponse> getCurrentWeather(
    @Query("key") String apiKey,
    @Query("q") String location,
  );
}
```

---

## 🖼️ Screenshots
> *(Add screenshots here when available)*

---

## 🔐 .env Example
```
API_KEY=your_api_key_here
BASE_URL=https://api.weatherapi.com/v1
```

---

## 🛠️ Setup Instructions
```bash
git clone https://github.com/yourname/weather_app_flutter.git
cd weather_app_flutter
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

---

## 🤝 Contributing
Feel free to fork and raise a PR! Contributions and suggestions are welcome.

---

## 👨‍💻 Author
**Mushtaq Ahmad Mir**  
📧 mushtaq11917632@gmail.com.com  
🏢 Kashmir

---



