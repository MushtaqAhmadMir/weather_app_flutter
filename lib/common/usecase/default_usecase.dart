import 'package:flutter/foundation.dart';
import 'package:weather_app_flutter/common/resource/data_resource.dart';
import 'package:weather_app_flutter/common/resource/data_type.dart';
import 'package:weather_app_flutter/common/utils/error_handler.dart';

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

      // callback?.call(DataResource.error(tracedError));

      callback?.call(DataResource.error(tracedError));
      return DataResource.error(tracedError);
    }
  }
}
