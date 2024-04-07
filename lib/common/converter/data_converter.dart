import 'package:json_annotation/json_annotation.dart';

class DataConverter<T> implements JsonConverter<T?, Object?> {
  const DataConverter(this.fromJSON);

  @override
  final T? Function(Object? json) fromJSON;

  @override
  T? fromJson(Object? json) => fromJSON(json);

  @override
  Object? toJson(T? object) => object;
}
