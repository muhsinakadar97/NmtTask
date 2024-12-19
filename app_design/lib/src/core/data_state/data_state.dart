import 'package:dartz/dartz.dart';

import '../network/failure.dart';

enum DataStateType { success, failure, initial }

class DataState<T> {
  final DataStateType state;
  final Either<Failure, T>? data;

  DataState._(this.state, this.data);

  factory DataState.success(T value) =>
      DataState._(DataStateType.success, Right(value));

  factory DataState.failure(Failure error) =>
      DataState._(DataStateType.failure, Left(error));

  factory DataState.initial() => DataState._(DataStateType.initial, null);
}
