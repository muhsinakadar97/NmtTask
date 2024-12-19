import 'package:app_design/src/core/data_state/data_state.dart';
import 'package:app_design/src/domain/repositories/item_repo/item_repo.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  final ItemRepository repository;

  var state = DataState<List<String>>.initial().obs;

  ItemController(this.repository);

  void fetchItems() async {
    state.value = DataState.initial();
    final result = await repository.getItems();
    result.fold(
      (failure) => state.value = DataState.failure(failure),
      (items) => state.value = DataState.success(items),
    );
  }
}
