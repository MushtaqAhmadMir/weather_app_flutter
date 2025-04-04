// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  DataResource<WeatherReportModel> get weatherResource =>
      throw _privateConstructorUsedError;
  DataResource<WeatherForFiveDaysModel> get fiveDayWeatherResource =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      DataResource<WeatherReportModel> weatherResource,
      DataResource<WeatherForFiveDaysModel> fiveDayWeatherResource,
    )
    initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      DataResource<WeatherReportModel> weatherResource,
      DataResource<WeatherForFiveDaysModel> fiveDayWeatherResource,
    )?
    initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      DataResource<WeatherReportModel> weatherResource,
      DataResource<WeatherForFiveDaysModel> fiveDayWeatherResource,
    )?
    initial,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    DataResource<WeatherReportModel> weatherResource,
    DataResource<WeatherForFiveDaysModel> fiveDayWeatherResource,
  });
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherResource = null,
    Object? fiveDayWeatherResource = null,
  }) {
    return _then(
      _value.copyWith(
            weatherResource:
                null == weatherResource
                    ? _value.weatherResource
                    : weatherResource // ignore: cast_nullable_to_non_nullable
                        as DataResource<WeatherReportModel>,
            fiveDayWeatherResource:
                null == fiveDayWeatherResource
                    ? _value.fiveDayWeatherResource
                    : fiveDayWeatherResource // ignore: cast_nullable_to_non_nullable
                        as DataResource<WeatherForFiveDaysModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DataResource<WeatherReportModel> weatherResource,
    DataResource<WeatherForFiveDaysModel> fiveDayWeatherResource,
  });
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weatherResource = null,
    Object? fiveDayWeatherResource = null,
  }) {
    return _then(
      _$InitialImpl(
        weatherResource:
            null == weatherResource
                ? _value.weatherResource
                : weatherResource // ignore: cast_nullable_to_non_nullable
                    as DataResource<WeatherReportModel>,
        fiveDayWeatherResource:
            null == fiveDayWeatherResource
                ? _value.fiveDayWeatherResource
                : fiveDayWeatherResource // ignore: cast_nullable_to_non_nullable
                    as DataResource<WeatherForFiveDaysModel>,
      ),
    );
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({
    this.weatherResource = const DataResource.initial(),
    this.fiveDayWeatherResource = const DataResource.initial(),
  });

  @override
  @JsonKey()
  final DataResource<WeatherReportModel> weatherResource;
  @override
  @JsonKey()
  final DataResource<WeatherForFiveDaysModel> fiveDayWeatherResource;

  @override
  String toString() {
    return 'HomeState.initial(weatherResource: $weatherResource, fiveDayWeatherResource: $fiveDayWeatherResource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.weatherResource, weatherResource) ||
                other.weatherResource == weatherResource) &&
            (identical(other.fiveDayWeatherResource, fiveDayWeatherResource) ||
                other.fiveDayWeatherResource == fiveDayWeatherResource));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, weatherResource, fiveDayWeatherResource);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      DataResource<WeatherReportModel> weatherResource,
      DataResource<WeatherForFiveDaysModel> fiveDayWeatherResource,
    )
    initial,
  }) {
    return initial(weatherResource, fiveDayWeatherResource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      DataResource<WeatherReportModel> weatherResource,
      DataResource<WeatherForFiveDaysModel> fiveDayWeatherResource,
    )?
    initial,
  }) {
    return initial?.call(weatherResource, fiveDayWeatherResource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      DataResource<WeatherReportModel> weatherResource,
      DataResource<WeatherForFiveDaysModel> fiveDayWeatherResource,
    )?
    initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(weatherResource, fiveDayWeatherResource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial({
    final DataResource<WeatherReportModel> weatherResource,
    final DataResource<WeatherForFiveDaysModel> fiveDayWeatherResource,
  }) = _$InitialImpl;

  @override
  DataResource<WeatherReportModel> get weatherResource;
  @override
  DataResource<WeatherForFiveDaysModel> get fiveDayWeatherResource;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
