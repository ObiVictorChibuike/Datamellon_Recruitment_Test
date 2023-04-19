abstract class DataState<T> {
  final T? data;
  final String? error;

  const DataState({this.data, this.error});
}
///Handles response when an api call is successful
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T? data) : super(data: data);
}
///Handles response when an api call is not successful
class DataFailed<T> extends DataState<T> {
  const DataFailed(String? error) : super(error: error);
}
