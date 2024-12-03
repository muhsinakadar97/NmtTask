enum DataState {
  loading,
  success,
  error;

  bool get isFetched => this == DataState.success;
  bool get isLoading => this == DataState.loading;
  bool get isFailed => this == DataState.error;
}

sealed class Ds<T> {
  final DataState state;
  String? error;
  T? valueOrNull;

  Ds({required this.state, this.error, this.valueOrNull});

  T? get value => valueOrNull;

  R onState<R>({
    required R Function(T data) success,
    required R Function(String error) onFailed,
    required R Function() onLoading,
  }) {
    switch (state) {
      case DataState.error:
        return onFailed(error ?? '');
      case DataState.success:
        return success(valueOrNull as T);
      case DataState.loading:
        return onLoading();
    }
  }
}

class Loading<T> extends Ds<T> {
  Loading() : super(state: DataState.loading);
}

class Success<T> extends Ds<T> {
  final T data;
  Success({required this.data})
      : super(
          state: DataState.success,
          valueOrNull: data,
        );
}

class Failed<T> extends Ds<T> {
  String? e;
  Failed({this.e}) : super(state: DataState.error, error: e);
}
