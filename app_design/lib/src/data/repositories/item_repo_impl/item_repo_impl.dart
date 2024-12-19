import 'package:app_design/src/core/network/failure.dart';
import 'package:app_design/src/data/data_sources/remote_datasource.dart';
import 'package:app_design/src/domain/repositories/item_repo/item_repo.dart';
import 'package:dartz/dartz.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteDataSource remoteDataSource;

  ItemRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<String>>> getItems() async {
    try {
      final items = await remoteDataSource.fetchItems();
      return Right(items);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
