import 'package:app_design/src/core/network/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ItemRepository {
  Future<Either<Failure, List<String>>> getItems();
}
