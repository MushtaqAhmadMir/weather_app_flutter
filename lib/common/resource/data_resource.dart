import 'package:equatable/equatable.dart';
import 'package:weather_app_flutter/common/resource/data_failure.dart';

class DataResource<In> extends Equatable {
  final ResourceState resourceState;
  final In? data;
  final DataFailure? failure;

  const DataResource(this.resourceState, this.data, this.failure);

  const DataResource._(this.resourceState, this.data, this.failure);

  const DataResource.initial({In? data})
    : this._(ResourceState.initial, data, null);

  const DataResource.loading({In? data})
    : this._(ResourceState.loading, null, null);

  const DataResource.success(In? data)
    : this._(ResourceState.success, data, null);

  const DataResource.error(DataFailure? failure)
    : this._(ResourceState.error, null, failure);

  DataResource.dirty(DataResource resource)
    : this._(resource.resourceState, resource.data, resource.failure);

  DataResource<In> asLoading() => DataResource.loading(data: data);

  bool isLoading() => resourceState == ResourceState.loading;

  bool isInitialOrLoading() => isInitial() || isLoading();

  bool isLoadingOrSuccess() => isLoading() || isSuccess();

  bool isInitial() => resourceState == ResourceState.initial;

  bool isSuccess() => resourceState == ResourceState.success;

  bool isError() => resourceState == ResourceState.error;

  bool isDiff(DataResource<In> other) => resourceState != other.resourceState;

  @override
  List<Object?> get props {
    return [resourceState, data, failure];
  }
}

enum ResourceState { initial, loading, success, error }
